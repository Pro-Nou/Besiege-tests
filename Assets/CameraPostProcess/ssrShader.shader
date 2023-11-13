Shader "Hidden/ssrShader"
{
	CGINCLUDE
        #include "UnityCG.cginc"
        #include "AutoLight.cginc"
        #include "Lighting.cginc"

        #define _HeightBump 200
		sampler2D _MainCameraRGBAMap;
		float4 _MainCameraRGBAMap_TexelSize;
		sampler2D _MainCameraDepthMap;
		sampler2D _CameraDepthTexture;
		float4 _CameraDepthTexture_TexelSize;
		float _depthRTTransferFactor;

        sampler2D _HeightMap;
        float4 _HeightMap_ST;
        float4 _HeightMap_TexelSize;
        sampler2D _AttachMap;
        float4 _AttachMap_TexelSize;
        sampler2D _rainMap;
        float4 _rainMap_ST;
        float4 _rainMap_TexelSize;
        sampler2D _BubbleMap;
        float4 _BubbleMap_ST;
        sampler2D _waveMask;
        float4 _waveMask_ST;
        sampler2D _BumpMap;
        float4 _BumpMap_ST;
        samplerCUBE _MainCameraReflProbe;
        float4 _MainCameraReflProbe_TexelSize;
        sampler2D _SSRMaskTex;
        float4 _SSRMaskTex_ST;

        float _interactFadeUV;
        float _waveCull;
        float _HeightScale;
        // float _HeightBump;
        float4 _waveSpeed;
        float _AttachBump;
        float _rainBump;

        float _SSRPixelBias;
        float _SSRPixelThickness;
        float _SSRCrossFadeDistance;
        float _SSRQuality;
        float _BumpScale;
        float _Distortion;

        fixed4 _baseColor;
        float _FrontFace;
        float _density;
        float _underWaterCrossFade;
        float _EdgeScale;
        float _SpecularScale;
        float _SpecularSmoothness;
        float _invY;
        fixed _ReflactAmount;
        fixed _RefractAmount;

        float _TessFadeDist;
        float _TessMinDist;
        float _TessFactor;
        float3 getCross(float3 pos1, float3 dir1, float3 pos2, float3 dir2)
        {
            float a = dir1.x;
            float b = -dir2.x;
            float c = pos2.x - pos1.x;
            float d = dir1.y;
            float e = -dir2.y;
            float f = pos2.y - pos1.y;
            float l = (a*f - d*c)/(a*e - b*d);
            return l * dir2 + pos2;
        }
    	fixed4 tex2DBlurLod(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn, float blurScaleIn)
        {
            float lod = blurScaleIn / 10;
            float2 blurDir1 = float2(abs(texelSizeIn.x), 0) * blurScaleIn;
            float2 blurDir2 = float2(0, abs(texelSizeIn.y)) * blurScaleIn;
          	fixed4 colOut = tex2Dlod(texIn, fixed4(scrPosIn, 0, lod)) * 4;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir2, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir2, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1 + blurDir2, lod, lod));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1 - blurDir2, lod, lod));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1 + blurDir2, lod, lod));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1 - blurDir2, lod, lod));
            return colOut / 16;
        }
    	fixed4 tex2DBlur(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn)
        {
            float2 blurDir1 = float2(abs(texelSizeIn.x), 0);
            float2 blurDir2 = float2(0, abs(texelSizeIn.y));
            fixed4 colOut = tex2Dlod(texIn, fixed4(scrPosIn + blurDir1, 0, 0));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir2, 0, 0));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1, 0, 0));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir2, 0, 0));
            return colOut / 4;
        }
        float4 crossGraySample(sampler2D texIn, float2 texelSizeIn, float2 samplerPos)
        {
            float2 deltaU = float2(texelSizeIn.x, 0);
            float2 deltaV = float2(0, texelSizeIn.y);
            float h1_u = tex2Dlod(texIn, float4(samplerPos.xy - deltaU, 0, 0)).r;
            float h2_u = tex2Dlod(texIn, float4(samplerPos.xy + deltaU, 0, 0)).r;
            float h1_v = tex2Dlod(texIn, float4(samplerPos.xy - deltaV, 0, 0)).r;
            float h2_v = tex2Dlod(texIn, float4(samplerPos.xy + deltaV, 0, 0)).r;
            return float4(h1_u, h2_u, h1_v, h2_v);
        }
        float3 grayToNormal(sampler2D texIn, float2 texelSizeIn, float2 samplerPos, float xzScale, float yScale)
        {
            float4 crossSampler = crossGraySample(texIn, texelSizeIn, samplerPos);
            float3 tangent_u = float3(texelSizeIn.x * xzScale, (crossSampler.y - crossSampler.x) * yScale, 0);
            float3 tangent_v = float3(0, (crossSampler.w - crossSampler.z) * yScale, texelSizeIn.y * xzScale);
            float3 normalOut = cross(normalize(tangent_u), normalize(tangent_v));
            normalOut.y *= -1;
            return normalize(normalOut);
        }
        float pRand(float valueIn)
        {
            return (((valueIn * 12345.580078) + 18374.109289) % 8.759766);
            // return frac(sin(floor(valueIn)*12345.580078)*7658.759766);
        }
        float kusaiRand(float valueIn)
        {
            return frac(((valueIn * 11451.419198) + 10114.514191) % 9.810);
        }

        struct Attribute
        {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
            float4 tangent : TANGENT;
            float2 texcoord: TEXCOORD0;
        };
        struct TrianglePatchTess
        {
            float edgeTess[3] : SV_TessFactor; 
            float insideTess : SV_InsideTessFactor;
        };
        struct HullOutput
        {
            float4 positionOS : TEXCOORD0;
            float3 normal : NORMAL;
            float4 tangent : TANGENT;
            float4 uv : TEXCOORD1;
        };

        Attribute vert(Attribute v)
        {
            v.vertex += float4(_WorldSpaceCameraPos.x, 0, _WorldSpaceCameraPos.z, 0);
            return v;
        }
        [domain("tri")] 
        [partitioning("fractional_even")] 
        [outputtopology("triangle_cw")]  
        [outputcontrolpoints(4)] 
        [patchconstantfunc("ComputeTessFactor")] 
        [maxtessfactor(64.0)] 
        HullOutput HullS(InputPatch<Attribute, 3> input, uint controlPointId : SV_OutputControlPointID, uint patchId : SV_PrimitiveID)
        {
            HullOutput output;

            output.positionOS = input[controlPointId].vertex;
            // output.uv = input[controlPointId].uv;
            output.uv.xy = input[controlPointId].texcoord - (_WorldSpaceCameraPos.xz / 200);
            output.uv.zw = input[controlPointId].texcoord;
            output.normal = input[controlPointId].normal;
            output.tangent = input[controlPointId].tangent;
            return output;
        }
        float3 GetDistanceBasedTessFactor(float3 p0, float3 p1, float3 p2, float3 cameraPosWS, float tessMinDist, float tessMaxDist) 
        {
            float3 edgePosition0 = 0.5 * (p1 + p2);
            float3 edgePosition1 = 0.5 * (p0 + p2);
            float3 edgePosition2 = 0.5 * (p0 + p1);

            // In case camera-relative rendering is enabled, 'cameraPosWS' is statically known to be 0,
            // so the compiler will be able to optimize distance() to length().
            float dist0 = distance(edgePosition0, cameraPosWS);
            float dist1 = distance(edgePosition1, cameraPosWS);
            float dist2 = distance(edgePosition2, cameraPosWS);

            // The saturate will handle the produced NaN in case min == max
            float fadeDist = tessMaxDist - tessMinDist;
            float3 tessFactor;
            tessFactor.x = saturate(1.0 - (dist0 - tessMinDist) / fadeDist);
            tessFactor.y = saturate(1.0 - (dist1 - tessMinDist) / fadeDist);
            tessFactor.z = saturate(1.0 - (dist2 - tessMinDist) / fadeDist);

            return tessFactor;//[0,1] from distance
        }
        float4 CalcTriTessFactorsFromEdgeTessFactors(float3 triVertexFactors) {
            float4 tess;
            tess.x = triVertexFactors.x;
            tess.y = triVertexFactors.y;
            tess.z = triVertexFactors.z;
            tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0;

            return tess;
        }
        TrianglePatchTess ComputeTessFactor(InputPatch<Attribute, 3> patch, uint patchId : SV_PrimitiveID)
        {
            TrianglePatchTess output;
            float3 cameraPosWS = _WorldSpaceCameraPos.xyz;
            float3 p0 = mul(unity_ObjectToWorld, patch[0].vertex).xyz;
            float3 p1 = mul(unity_ObjectToWorld, patch[1].vertex).xyz;
            float3 p2 = mul(unity_ObjectToWorld, patch[2].vertex).xyz;

            float3 factors = GetDistanceBasedTessFactor(p0,p1,p2, cameraPosWS, _TessMinDist, _TessMinDist + _TessFadeDist);
            float4 finalfactors = _TessFactor * CalcTriTessFactorsFromEdgeTessFactors(factors);

            output.edgeTess[0] = max(1.0, finalfactors.x);
            output.edgeTess[1] = max(1.0, finalfactors.y);
            output.edgeTess[2] = max(1.0, finalfactors.z);
            output.insideTess = max(1.0, finalfactors.w);

            return output;
        }
	ENDCG
	// 替换标签是BloomTransparent的shader
	// SubShader
	// {
	// 	Tags{"QUEUE"="Transparent" "RenderType" = "Transparent" }
    //     Blend  SrcAlpha OneMinusSrcAlpha 
	// 	Cull back 
	// 	Lighting Off 
	// 	ZTest less
	// 	ZWrite off
	// 	Fog{ Mode Off }
	// 	Pass
	// 	{
	// 		CGPROGRAM
	// 		#pragma vertex vert_img
	// 		#pragma fragment frag
	// 		#pragma fragmentoption ARB_precision_hint_fastest
	// 		#include "UnityCG.cginc"
 
	// 		//uniform sampler2D _BloomTex;
	// 		half4 frag(v2f_img i) : COLOR
	// 		{
	// 			half4 final = half4(0, 0, 0, 0);
	// 			return final;
	// 		}
	// 		ENDCG
	// 	}
	// }
    SubShader 
	{
        Tags {"RenderType" = "ReflOpaque" "QUEUE" = "transparent"}
        Pass 
		{    
            CGPROGRAM
            #pragma vertex vert_Opaque
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest
            #include "UnityCG.cginc"

            struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

            struct v2f
			{
				float4 scrPos:TEXCOORD0;
				// float3 worldPos : TEXCOORD1;

				float4 vertex : SV_POSITION;
				// float depth : DEPTH;
				float3 normal : NORMAL;
			};

            v2f vert_Opaque (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				// o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.scrPos = ComputeScreenPos(o.vertex);

				// o.depth = -mul(UNITY_MATRIX_MV, v.vertex).z *_ProjectionParams.w;
				o.normal = UnityObjectToWorldNormal(v.normal);

				return o;
			}

            fixed4 frag(v2f i) : COLOR
            {
                float2 srcPosFrac = i.scrPos.xy / i.scrPos.w;
                float2 depthCaculate = tex2Dlod(_MainCameraDepthMap, fixed4(srcPosFrac, 0, 0)).rg;
                float screenDepth = ((depthCaculate.x * _depthRTTransferFactor) + depthCaculate.y) / _depthRTTransferFactor;

                fixed4 packedSSROffset = tex2Dlod(_SSRMaskTex, float4((_ScreenParams.xy / 256) * srcPosFrac,0,0));
      			fixed3 SSROffset = fixed3(0,0,1);
      			SSROffset.xy = (packedSSROffset.xy * 2 - 1 );
                SSROffset.z = sqrt(1.0 - saturate(dot(SSROffset.xy, SSROffset.xy)));

                float2 ndcPosLast = srcPosFrac.xy * 2 - 1;
                float3 clipVecLast = float3(ndcPosLast.x, ndcPosLast.y, -1) * _ProjectionParams.z;
                float3 viewVecLast = mul(unity_CameraInvProjection, clipVecLast.xyzz).xyz;
                float3 viewPosLast = viewVecLast * screenDepth;
                float3 worldPosLast = mul(unity_CameraToWorld, float4(viewPosLast, 1)).xyz;
                
                // fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPosLast));
                
                fixed3 bump = i.normal + SSROffset * 0.005;
                bump.y += 0.001 * (bump.y != 0);
                fixed3 reflDir = reflect(-worldViewDir, normalize(bump));
                fixed3 reflWorldPos = worldPosLast + reflDir;
                // fixed3 reflWorldPos = i.worldPos + reflDir;
                float4 reflObjPos = mul(unity_WorldToObject, float4(reflWorldPos, 1));
                float4 reflClipPos = UnityObjectToClipPos(reflObjPos);
                float4 reflScrPos = ComputeScreenPos(reflClipPos);
                float2 srcReflDir = normalize((reflScrPos.xy / reflScrPos.w) - srcPosFrac);
				float2 absRGBA_TexelSize = float2(abs(_MainCameraRGBAMap_TexelSize.x), abs(_MainCameraRGBAMap_TexelSize.y));

                if (abs(srcReflDir.x) > abs(srcReflDir.y))
                {
                	srcReflDir /= abs(srcReflDir.x);
                	srcReflDir *= absRGBA_TexelSize.x;
                }
                else
                {
                	srcReflDir /= abs(srcReflDir.y);
                	srcReflDir *= absRGBA_TexelSize.y;
                }

                float reflLod = 7 - floor(_SSRQuality);
                float reflSampleLength = pow(2, reflLod);
                float2 reflSampleBase = srcPosFrac;
                float reflValid = false;
                float lastScrDepth = screenDepth;
                float lastDepth = screenDepth;
                float thisScrDepth = screenDepth;
                float thisDepth = screenDepth;
                float SSRlength0 = length(worldPosLast - _WorldSpaceCameraPos.xyz);
                // float SSRlength0 = length(i.worldPos - _WorldSpaceCameraPos.xyz);
                float SSRcount = 0;
                while (reflLod >= 0 && SSRcount < 512)
                {
                	float2 reflSamplePos = reflSampleBase + reflSampleLength * srcReflDir;
                	if (reflSamplePos.x > 1 || reflSamplePos.x < 0 || reflSamplePos.y > 1 || reflSamplePos.y < 0)
                	{
                		reflLod -= 1;
                		reflSampleLength /= 2;
                		continue;
                	}
                	float2 ndcPos = reflSamplePos.xy * 2 - 1;
                	float3 clipVec = float3(ndcPos.x, ndcPos.y, -1) * _ProjectionParams.z;
                	float3 viewVec = mul(unity_CameraInvProjection, clipVec.xyzz).xyz;
                	float3 viewPos = viewVec * screenDepth;
                	float3 worldPos0 = mul(unity_CameraToWorld, float4(viewPos, 1)).xyz;
                	float3 worldDir0 = normalize(worldPos0 - _WorldSpaceCameraPos.xyz);
                	// float3 worldPos1 = getCross(i.worldPos, reflDir, _WorldSpaceCameraPos.xyz, worldDir0);
                	// float SSRlength1 = length(worldPos1 - i.worldPos) + SSRlength0;
                	float3 worldPos1 = getCross(worldPosLast, reflDir, _WorldSpaceCameraPos.xyz, worldDir0);
                	float SSRlength1 = length(worldPos1 - worldPosLast) + SSRlength0;
                	float3 viewPos1 = mul(unity_WorldToCamera, float4(worldPos1, 1)).xyz;
                	float depth0 = viewPos1 / viewVec;
                	if (depth0 < 0 || depth0 > 1)
                	{
                		break;
                	}
					
                	float2 depthCaculate0 = tex2Dlod(_MainCameraDepthMap, fixed4(reflSamplePos, 0, reflLod)).rg;
					float screenDepth0 = ((depthCaculate0.x * _depthRTTransferFactor) + depthCaculate0.y) / _depthRTTransferFactor;
                	if (screenDepth0 + reflSampleLength * _SSRPixelBias * SSRlength1 * 0.01 < depth0 && depth0 < screenDepth0 + reflSampleLength * max(abs(lastDepth - depth0), _SSRPixelThickness))
                	{
                		reflValid = (reflLod == 0);
                		thisScrDepth = screenDepth0;
                		thisDepth = depth0;
                		reflLod -= 1;
                		reflSampleLength /= 2;
                	}
                	else
                	{
                		reflSampleBase = reflSamplePos;
                		lastDepth = depth0;
                		lastScrDepth = screenDepth0;
                	}
                    SSRcount += 1;
                }
                float2 reflSamplefinal = reflSampleBase + reflSampleLength * srcReflDir;
                reflSampleBase = lerp(reflSamplefinal, reflSampleBase, (thisDepth - thisScrDepth)/(thisDepth - thisScrDepth + lastScrDepth - lastDepth));
                float reflLerpx = min(smoothstep(0, _SSRCrossFadeDistance * absRGBA_TexelSize.x, reflSampleBase.x), smoothstep(1, 1 - _SSRCrossFadeDistance * absRGBA_TexelSize.x, reflSampleBase.x));
                float reflLerpy = min(smoothstep(0, _SSRCrossFadeDistance * absRGBA_TexelSize.y, reflSampleBase.y), smoothstep(1, 1 - _SSRCrossFadeDistance * absRGBA_TexelSize.y, reflSampleBase.y));
                
                fixed4 reflCol = lerp(texCUBElod(_MainCameraReflProbe, fixed4(reflDir, 0)), tex2Dlod(_MainCameraRGBAMap, float4(reflSampleBase.x, reflSampleBase.y,0,0)), min(reflValid, min(reflLerpx, reflLerpy)));
            	
                return fixed4(reflCol.rgb, 1);
                // return fixed4(srcPosFrac,0,1);
            }
            ENDCG
        }
    } 
    SubShader 
	{
        Tags {"QUEUE"="Transparent" "RenderType" = "Ocean"}
		Blend One Zero
		Cull off
		LOD 100
        Pass 
		{    
			Tags{"LightMode"="ForwardBase"}
            CGPROGRAM
            #pragma vertex vert
            #pragma hull HullS
            #pragma domain DomainS
            #pragma fragment frag
      		#pragma multi_compile_fwdbase

			#include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "Lighting.cginc"

            struct DomainOutput
            {
                float4 pos : SV_POSITION;
                float4 scrPos : TEXCOORD0;
                float4 uv : TEXCOORD1;
                float3 worldPos : TEXCOORD2;
                fixed3 worldNormal : TEXCOORD3;
                fixed4 objectTangent : TEXCOORD4;
                float2 uv1 : TEXCOORD5;
                float depth: DEPTH;
            };

			[domain("tri")]
			DomainOutput DomainS(TrianglePatchTess patchTess, float3 bary: SV_DomainLocation, const OutputPatch<HullOutput, 3> patch)
			{
				DomainOutput output;

				float4 positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z; 
				float4 uv = patch[0].uv * bary.x + patch[1].uv * bary.y + patch[2].uv * bary.z; 
				float4 tangentOS = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z; 
				float3 normalOS = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z; 

                float2 waveOffset = _waveSpeed.xy * _Time.x;
                float2 waveMaskOffset = _waveSpeed.zw * _Time.x;
                output.uv.xy = TRANSFORM_TEX(uv.xy, _HeightMap) + waveOffset;
                output.uv.zw = TRANSFORM_TEX(uv.xy, _BumpMap) + waveOffset;
                output.uv1.xy = TRANSFORM_TEX(uv.xy, _waveMask) + waveMaskOffset;
                bool shouldInteract = uv.z <= (1 - _interactFadeUV) && uv.z >= _interactFadeUV && uv.w <= (1 - _interactFadeUV) && uv.w >= _interactFadeUV;
                
                if (shouldInteract)
                {
                    float waveMask = max(0, tex2Dlod(_waveMask, float4(output.uv1.xy, 0, 0)).r - _waveCull);
                    waveMask = smoothstep(0, 1 - _waveCull, waveMask) * _HeightScale;
                    float height = tex2Dlod(_HeightMap, float4(output.uv.xy, 0, 0)).r * waveMask;
                    positionOS.y += height;
                }

				output.pos = UnityObjectToClipPos(positionOS);
                output.scrPos = ComputeScreenPos(output.pos);

                output.worldPos = mul(unity_ObjectToWorld, positionOS).xyz;
                output.worldNormal = UnityObjectToWorldNormal(normalize(normalOS));
                output.objectTangent = tangentOS;

        		output.depth = -mul(UNITY_MATRIX_MV, positionOS).z * _ProjectionParams.w;
				// screenDepth = (screenDepth / _ProjectionParams.w);
				// screenDepth = min(screenDepth, 1);
				return output;
			}

            fixed4 frag(DomainOutput i) : COLOR
            {
				// return fixed4(1,0,0,1);
                // clip(_WorldSpaceCameraPos.y - unity_ObjectToWorld[1].w);
                float2 srcPosFrac = i.scrPos.xy / i.scrPos.w;

                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
                float waveMask = max(0, tex2Dlod(_waveMask, float4(i.uv1.xy, 0, 0)).r - _waveCull);
                waveMask = smoothstep(0, 1 - _waveCull, waveMask) * _HeightScale;

                float3 normalOS = grayToNormal(_HeightMap, _HeightMap_TexelSize.xy, i.uv.xy, _HeightBump, waveMask);

                float3 worldNormal = UnityObjectToWorldNormal(normalOS);
                float3 worldTangent = UnityObjectToWorldDir(i.objectTangent.xyz);
                float3 worldBinormal = cross(worldNormal, worldTangent) * i.objectTangent.w;

                float4 TtoW0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, i.worldPos.x);
                float4 TtoW1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, i.worldPos.y);
                float4 TtoW2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, i.worldPos.z);

            	fixed4 packedSSROffset = tex2Dlod(_SSRMaskTex, float4((_ScreenParams.xy / 256) * srcPosFrac,0,0));
      			fixed3 SSROffset = fixed3(0,0,1);
      			SSROffset.xy = (packedSSROffset.xy * 2 - 1 ) * 0.005;

                fixed4 packedNormal = tex2Dlod(_BumpMap, fixed4(i.uv.zw,0,0));
                fixed3 bump = fixed3(0,0,1);
                bump.xy = (packedNormal.xy * 2 - 1 ) * _BumpScale;
                bump.z = sqrt(1.0 - saturate(dot(bump.xy, bump.xy)));
                bump.xy += SSROffset.xy;
                bump = normalize(half3(dot(TtoW0.xyz, bump), dot(TtoW1.xyz, bump), dot(TtoW2.xyz, bump)));
				float2 depthCaculate = tex2Dlod(_MainCameraDepthMap, fixed4(srcPosFrac, 0, 0)).rg;
                float screenDepth = ((depthCaculate.x * _depthRTTransferFactor) + depthCaculate.y) / _depthRTTransferFactor;

                fixed3 reflDir = reflect(-worldViewDir, bump);
                fixed3 reflWorldPos = i.worldPos + reflDir;
                float4 reflObjPos = mul(unity_WorldToObject, float4(reflWorldPos, 1));
                float4 reflClipPos = UnityObjectToClipPos(reflObjPos);
                float4 reflScrPos = ComputeScreenPos(reflClipPos);
                float2 srcReflDir = normalize((reflScrPos.xy / reflScrPos.w) - srcPosFrac);
				float2 absRGBA_TexelSize = float2(abs(_MainCameraRGBAMap_TexelSize.x), abs(_MainCameraRGBAMap_TexelSize.y));

                if (abs(srcReflDir.x) > abs(srcReflDir.y))
                {
                	srcReflDir /= abs(srcReflDir.x);
                	srcReflDir *= absRGBA_TexelSize.x;
                }
                else
                {
                	srcReflDir /= abs(srcReflDir.y);
                	srcReflDir *= absRGBA_TexelSize.y;
                }

                float reflLod = 7 - floor(_SSRQuality);
                float reflSampleLength = pow(2, reflLod);
                float2 reflSampleBase = srcPosFrac;
                float reflValid = false;
                float lastScrDepth = screenDepth;
                float lastDepth = i.depth;
                float thisScrDepth = screenDepth;
                float thisDepth = i.depth;
                float SSRlength0 = length(i.worldPos - _WorldSpaceCameraPos.xyz);
                float SSRcount = 0;
                while (reflLod >= 0 && SSRcount < 512)
                {
                	float2 reflSamplePos = reflSampleBase + reflSampleLength * srcReflDir;
                	if (reflSamplePos.x > 1 || reflSamplePos.x < 0 || reflSamplePos.y > 1 || reflSamplePos.y < 0)
                	{
                		reflLod -= 1;
                		reflSampleLength /= 2;
                		continue;
                	}
                	float2 ndcPos = reflSamplePos.xy * 2 - 1;
                	float3 clipVec = float3(ndcPos.x, ndcPos.y, -1) * _ProjectionParams.z;
                	float3 viewVec = mul(unity_CameraInvProjection, clipVec.xyzz).xyz;
                	float3 viewPos = viewVec * i.depth;
                	float3 worldPos0 = mul(unity_CameraToWorld, float4(viewPos, 1)).xyz;
                	float3 worldDir0 = normalize(worldPos0 - _WorldSpaceCameraPos.xyz);
                	float3 worldPos1 = getCross(i.worldPos, reflDir, _WorldSpaceCameraPos.xyz, worldDir0);
                	float SSRlength1 = length(worldPos1 - i.worldPos) + SSRlength0;
                	float3 viewPos1 = mul(unity_WorldToCamera, float4(worldPos1, 1)).xyz;
                	float depth0 = viewPos1 / viewVec;
                	if (depth0 < 0 || depth0 > 1)
                	{
                		break;
                	}
					
                	float2 depthCaculate0 = tex2Dlod(_MainCameraDepthMap, fixed4(reflSamplePos, 0, reflLod)).rg;
					float screenDepth0 = ((depthCaculate0.x * _depthRTTransferFactor) + depthCaculate0.y) / _depthRTTransferFactor;
                	if (screenDepth0 + reflSampleLength * _SSRPixelBias * SSRlength1 * 0.01 < depth0 && depth0 < screenDepth0 + reflSampleLength * max(abs(lastDepth - depth0), _SSRPixelThickness))
                	{
                		reflValid = (reflLod == 0);
                		thisScrDepth = screenDepth0;
                		thisDepth = depth0;
                		reflLod -= 1;
                		reflSampleLength /= 2;
                	}
                	else
                	{
                		reflSampleBase = reflSamplePos;
                		lastDepth = depth0;
                		lastScrDepth = screenDepth0;
                	}
                    SSRcount += 1;
                }
                float2 reflSamplefinal = reflSampleBase + reflSampleLength * srcReflDir;
                reflSampleBase = lerp(reflSamplefinal, reflSampleBase, (thisDepth - thisScrDepth)/(thisDepth - thisScrDepth + lastScrDepth - lastDepth));
                float reflLerpx = min(smoothstep(0, _SSRCrossFadeDistance * absRGBA_TexelSize.x, reflSampleBase.x), smoothstep(1, 1 - _SSRCrossFadeDistance * absRGBA_TexelSize.x, reflSampleBase.x));
                float reflLerpy = min(smoothstep(0, _SSRCrossFadeDistance * absRGBA_TexelSize.y, reflSampleBase.y), smoothstep(1, 1 - _SSRCrossFadeDistance * absRGBA_TexelSize.y, reflSampleBase.y));

                fixed4 reflCol = lerp(texCUBElod(_MainCameraReflProbe, fixed4(reflDir, 0)), tex2Dlod(_MainCameraRGBAMap, float4(reflSampleBase.x, reflSampleBase.y,0,0)), min(reflValid, min(reflLerpx, reflLerpy)));
            	return fixed4(reflCol.rgb, 1);
            }
            ENDCG
        }
    } 
	Fallback Off  
}
