Shader "Unlit/ssrocean"
{
    Properties
    {
		// [Enum(UnityEngine.Rendering.CullMode)] _Culling ("Cull Mode", Int) = 2
		[Enum(Off,0,On,1)] _invY("inv Y", int) = 0

    	_SSRRoughness ("SSR Roughness", range(0, 7)) = 0

        // _interactFadeUV ("Interact Fade UV", range(0, 0.5)) = 0.2
        _interactFadeDistance ("Interact Fade Distance", range(0, 100)) = 100
        _OceanHeightMap ("Ocean Height Map", 2D) = "white" {}
        _OceanHeightScale("Height Scale", Range(0, 4)) = 1
        // _HeightBump("Height Bump", Range(0.001, 1)) = 0.2
        [NoScaleOffset]_AttachMap ("Attach Map", 2D) = "black" {}
        _AttachBump("Attach Bump", Range(0.001, 1)) = 0.2
        _OceanWaveSpeed("Wave Speed", Vector) = (0, 0, 0, 0)
        _OceanWaveCullMap ("Wave Mask", 2D) = "white" {}
        _OceanWaveCullScale ("Wave Cull", range(0, 1)) = 0
        _TessFactor("Tessellation Base Factor", Range(1,16)) = 4
        _TessFadeDist("Tessellation Fade Distance", Range(1,200)) = 128
        _TessMinDist("Tessellation Min Distance", Range(0.1, 10)) = 1

    	_OceanBaseColor ("base color", Color) = (1.0,1.0,1.0,1.0)
    	_OceanSecondColor ("second color", Color) = (1.0,1.0,1.0,1.0)
        _BubbleMap ("Bubble Map", 2D) = "white" {}
        // _BubbleStartHeight ("Bubble Start Height", range(0, 1)) = 0
        // _BubbleAlphaMulti ("Bubble Alpha Multi", range(0, 10)) = 1

        _BumpMap ("Normal Map", 2D) = "bump" {}
        _BumpScale ("Bump Scale", range(0,10)) = 1
        _EdgeScale ("Edge Scale", range(0,10)) = 1
		_SpecularScale ("Specular Scale", Range(0,1)) = 0.02
		_SpecularSmoothness ("Specular Smoothness", Range(0,1)) = 0.1
        _Distortion ("Distortion", Range(0, 100)) = 10
        _ReflectAmount ("Reflect Amount", Range(0.0, 1.0)) = 1.0
    }
    CGINCLUDE
        #include "UnityCG.cginc"
        #include "AutoLight.cginc"
        #include "Lighting.cginc"

        #define _HeightBump 200

        samplerCUBE _MainCameraReflProbe;
        float4 _MainCameraReflProbe_TexelSize;
        sampler2D _MainCameraSSRMap;
        float4 _MainCameraSSRMap_TexelSize;
        sampler2D _MainCameraSSRTSpecMap;
        sampler2D _MainCameraSSRTDiffMap;

        sampler2D _OceanHeightMap;
        float4 _OceanHeightMap_ST;
        float4 _OceanHeightMap_TexelSize;
        sampler2D _AttachMap;
        float4 _AttachMap_TexelSize;
        sampler2D _RainMap;
        float4 _RainMap_ST;
        float4 _RainMap_TexelSize;
        sampler2D _BubbleMap;
        float4 _BubbleMap_ST;
        sampler2D _OceanWaveCullMap;
        float4 _OceanWaveCullMap_ST;
        sampler2D _BumpMap;
        float4 _BumpMap_ST;

        // float _interactFadeUV;
        float _interactFadeDistance;
        float _OceanWaveCullScale;
        float _OceanHeightScale;
        // float _HeightBump;
        float4 _OceanWaveSpeed;
        float _AttachBump;
        float _rainVisibility;
        float _AfterRainAmount;

        float _BubbleStartHeight;
        float _BubbleAlphaMulti;

        float _SSRRoughness;
        float _SSRDistance;
        float _SSRPixelBias;
        float _SSRPixelThickness;
        float _SSRCrossFadeDistance;
        float _SSRQuality;
        float _MainCameraFarClipPlane;
        float _BumpScale;
        float _Distortion;
        sampler2D _RefractionTex_Ocean;
        float4 _RefractionTex_Ocean_TexelSize;
        sampler2D _CameraDepthTexture;
        float4 _CameraDepthTexture_TexelSize;

        fixed4 _OceanBaseColor;
        fixed4 _OceanSecondColor;
        float _FrontFace;
        float _OceanDensity;
        float _OceanDensityMin;
        float _OceanUnderWaterVisiableDistance;
        float _EdgeScale;
        float _SpecularScale;
        float _SpecularSmoothness;
        float _invY;
        fixed _ReflectAmount;

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
          	float4 colOut = tex2Dlod(texIn, float4(scrPosIn, 0, lod)) * 4;
            colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir1, 0, lod)) * 2;
            colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir2, 0, lod)) * 2;
            colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir1, 0, lod)) * 2;
            colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir2, 0, lod)) * 2;
            colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir1 + blurDir2, 0, lod));
            colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir1 - blurDir2, 0, lod));
            colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir1 + blurDir2, 0, lod));
            colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir1 - blurDir2, 0, lod));
            return colOut / 16;
        }
        fixed4 texCubeBlur(samplerCUBE texIn, float3 reflDirIn, float2 texelSizeIn, float blurIn)
        {
            float lod = blurIn / 10;
            fixed3 reflDir1 = fixed3(reflDirIn.z, 0, -reflDirIn.x);
            fixed3 reflDir2 = cross(reflDirIn, reflDir1);
            float4 colOut = texCUBElod(texIn, float4(reflDirIn,lod)) * 4;
            colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * reflDir1,lod)) * 2;
            colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * reflDir1,lod)) * 2;
            colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * reflDir2,lod)) * 2;
            colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * reflDir2,lod)) * 2;
            colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * (reflDir1 + reflDir2),lod));
            colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * (reflDir1 + reflDir2),lod));
            colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * (reflDir1 - reflDir2),lod));
            colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * (reflDir1 - reflDir2),lod));
            return colOut / 16;
        }
    	fixed4 tex2DBlur(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn)
        {
            float2 blurDir1 = float2(abs(texelSizeIn.x), 0);
            float2 blurDir2 = float2(0, abs(texelSizeIn.y));
            float4 colOut = tex2Dlod(texIn, float4(scrPosIn + blurDir1, 0, 0));
            colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir2, 0, 0));
            colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir1, 0, 0));
            colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir2, 0, 0));
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
        float3 grayToNormal(sampler2D texIn, float2 texelSizeIn, float2 samplerPos)
        {
            float4 crossSampler = crossGraySample(texIn, texelSizeIn, samplerPos);
            float3 tangent_u = float3(1, (crossSampler.y - crossSampler.x), 0);
            float3 tangent_v = float3(0, (crossSampler.w - crossSampler.z), 1);
            float3 normalOut = cross(normalize(tangent_u), normalize(tangent_v));
            normalOut = normalOut.y < 0 ? -normalOut : normalOut;
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
            float2 absXZ = abs(v.vertex.xz);
            v.vertex *= (absXZ.x > 300 || absXZ.y > 300) ? (max(2 * _ProjectionParams.z, absXZ.x) / absXZ.x) : 1;
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
    SubShader
    {
        // We must be transparent, so other objects are drawn before this one.
        Tags
        {
            "RenderType"="Ocean" "Queue"="transparent-2" "LightMode" = "ForwardBase" "PerformanceChecks"="False" "DisableBatching"="true"
        }
        	ZWrite on
            Cull back
            Blend One Zero

		// Cull [_Culling]

		//ZWrite [_ZWrite]

		LOD 100
        // This pass grabs the screen behind the object into a texture.
        // We can access the result in the next pass as _RefractionTex_Ocean
        GrabPass
        {
            "_RefractionTex_Ocean"
        }
        Pass
        {	
            Tags {"IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true""LightMode" = "ForwardBase"}
            CGPROGRAM
            #pragma vertex vert
            #pragma hull HullS
            #pragma domain DomainS
            #pragma fragment frag
			#pragma multi_compile_fog
			#pragma multi_compile_fwdbase
            #pragma shader_feature _SSRENABLE_ON

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
                float4 uv1 : TEXCOORD5;
                float4 uv2 : TEXCOORD6;
                UNITY_FOG_COORDS(7)
                float depth: DEPTH;
                bool shouldInteract: INTERACT;
            };

			[domain("tri")]
			DomainOutput DomainS(TrianglePatchTess patchTess, float3 bary: SV_DomainLocation, const OutputPatch<HullOutput, 3> patch)
			{
				DomainOutput output;

				float4 positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z; 
				float4 uv = patch[0].uv * bary.x + patch[1].uv * bary.y + patch[2].uv * bary.z; 
				float4 tangentOS = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z; 
				float3 normalOS = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z; 

                float2 waveOffset = _OceanWaveSpeed.xy * _Time.x;
                float2 waveMaskOffset = _OceanWaveSpeed.zw * _Time.x;
                // output.uv.xy = TRANSFORM_TEX(uv.xy, _OceanHeightMap) + waveOffset;
                // output.uv.zw = TRANSFORM_TEX(uv.xy, _BumpMap) + waveOffset;
                // output.uv1.xy = TRANSFORM_TEX(uv.xy, _BubbleMap);
                // output.uv1.zw = TRANSFORM_TEX(uv.xy, _OceanWaveCullMap) + waveMaskOffset;
                output.worldPos = mul(unity_ObjectToWorld, positionOS).xyz;
                output.uv.xy = TRANSFORM_TEX(output.worldPos.xz, _OceanHeightMap) + waveOffset;
                output.uv.zw = TRANSFORM_TEX(output.worldPos.xz, _BumpMap) + waveOffset;
                output.uv1.xy = TRANSFORM_TEX(output.worldPos.xz, _BubbleMap);
                output.uv1.zw = TRANSFORM_TEX(output.worldPos.xz, _OceanWaveCullMap) + waveMaskOffset;
                output.uv2.xy = float2(0,0);
                output.uv2.zw = uv.zw;

                // output.shouldInteract = uv.z <= (1 - _interactFadeUV) && uv.z >= _interactFadeUV && uv.w <= (1 - _interactFadeUV) && uv.w >= _interactFadeUV;
                output.shouldInteract = abs(positionOS.x - _WorldSpaceCameraPos.x) < _interactFadeDistance && abs(positionOS.z - _WorldSpaceCameraPos.z) < _interactFadeDistance;
                if (output.shouldInteract)
                {
                    float waveMask = max(0, tex2Dlod(_OceanWaveCullMap, float4(output.uv1.zw, 0, 0)).r - _OceanWaveCullScale);
                    waveMask = smoothstep(0, 1 - _OceanWaveCullScale, waveMask) * _OceanHeightScale;
                    float height = tex2Dlod(_OceanHeightMap, float4(output.uv.xy, 0, 0)).r * waveMask;
                    positionOS.y += height;
                    output.worldPos.y += height;
                }

				output.pos = UnityObjectToClipPos(positionOS);
                output.scrPos = ComputeScreenPos(output.pos);

                output.worldNormal = UnityObjectToWorldNormal(normalize(normalOS));
                output.objectTangent = tangentOS;

        		output.depth = -mul(UNITY_MATRIX_MV, positionOS).z * _ProjectionParams.w;

				UNITY_TRANSFER_FOG(output,output.pos);
				return output;
			}

            // fixed4 texCubeBlur(float3 reflDirIn, float blurIn)
            // {
            //     float lod = blurIn / 10;
            //     fixed3 reflDir1 = fixed3(reflDirIn.z, 0, -reflDirIn.x);
            //     fixed3 reflDir2 = cross(reflDirIn, reflDir1);
            // 	fixed4 colOut = texCUBElod(_Cubemap, fixed4(reflDirIn,lod)) * 4;
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + blurIn * _Cubemap_TexelSize.x * reflDir1,lod)) * 2;
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - blurIn * _Cubemap_TexelSize.x * reflDir1,lod)) * 2;
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + blurIn * _Cubemap_TexelSize.x * reflDir2,lod)) * 2;
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - blurIn * _Cubemap_TexelSize.x * reflDir2,lod)) * 2;
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + blurIn * _Cubemap_TexelSize.x * (reflDir1 + reflDir2),lod));
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - blurIn * _Cubemap_TexelSize.x * (reflDir1 + reflDir2),lod));
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + blurIn * _Cubemap_TexelSize.x * (reflDir1 - reflDir2),lod));
            //     colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - blurIn * _Cubemap_TexelSize.x * (reflDir1 - reflDir2),lod));
            //     return colOut / 16;
            // }
            // fixed4 frag(DomainOutput i, out float depth: SV_DEPTH) : SV_Target
            fixed4 frag(DomainOutput i) : SV_Target
            {
                float2 srcPosFrac = i.scrPos.xy / i.scrPos.w;

                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));

                float waveMask = max(0, tex2Dlod(_OceanWaveCullMap, float4(i.uv1.zw, 0, 0)).r - _OceanWaveCullScale);
                waveMask = smoothstep(0, 1 - _OceanWaveCullScale, waveMask);
                float bubbleAlpha = tex2Dlod(_OceanHeightMap, float4(i.uv.xy, 0, 0)).r * waveMask;
                // waveMask = waveMask * _OceanHeightScale;

                float3 normalOS = grayToNormal(_OceanHeightMap, _OceanHeightMap_TexelSize.xy, i.uv.xy);
                // normalOS = lerp(fixed3(0,1,0), normalOS, waveMask);
				normalOS.y /= max(0.0001, _OceanHeightScale * waveMask);
                normalOS = normalize(normalOS);
				// normalOS.xz *= -1;
                // normalOS.x *= -1;
                // normalOS.z *= -1;
                // bool isUnderWater = _WorldSpaceCameraPos.y < unity_ObjectToWorld[1].w;
                bool isUnderWater = false;
                
                // float v_face = (dot(normalOS, worldViewDir) > 0);
                // float3 normalOS = grayToNormal(_OceanHeightMap, _OceanHeightMap_TexelSize.xy, i.uv.xy, 400, waveMask);
                if(i.shouldInteract)
                {
                    float2 rainUV = i.worldPos.xz;
                    float pRandX = pRand(floor(rainUV.x));
                    rainUV.y += pRandX;
                    float rainTime = floor((_Time.y + pRandX + kusaiRand(floor(rainUV.y))) * 24);
                    float rainRow = floor(rainTime / 4);
                    float rainColum = rainTime - rainRow * 4;
                    float2 rainUVMod = float2(floor(rainUV.x % 4), floor(rainUV.y % 4));
                    rainUV = ((rainUV.xy - rainUVMod) + (float2(rainColum, 1 - rainRow))) / 4;

                    fixed3 normalRain = grayToNormal(_RainMap, _RainMap_TexelSize.xy, rainUV);
                    // float3 normalRain = float3(tex2Dlod(_rainMap, float4(rainUV, 0, 0)).xy * 2 - 1, 1);
                    float3 normalAttach = grayToNormal(_AttachMap, _AttachMap_TexelSize.xy, i.uv2.zw);
                    normalOS.xz += normalRain.xz * _rainVisibility;
                    // normalOS.xz += (waveMask < _BubbleStartHeight) * normalRain.xz * _rainVisibility;
                }
                // normalOS.xz *= -1;
                float3 worldNormal = UnityObjectToWorldNormal(normalize(normalOS));
                float3 worldTangent = UnityObjectToWorldDir(i.objectTangent.xyz);
                float3 worldBinormal = cross(worldNormal, worldTangent) * i.objectTangent.w;

                float4 TtoW0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, i.worldPos.x);
                float4 TtoW1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, i.worldPos.y);
                float4 TtoW2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, i.worldPos.z);

                float2 normalFlow = 0.5 * _Time.x * _OceanWaveSpeed.xy;
                fixed4 packedNormal = tex2Dlod(_BumpMap, float4(i.uv.zw + normalFlow,0,0));
                fixed4 packedNormal_inv = tex2Dlod(_BumpMap, float4(i.uv.zw - normalFlow,0,0));
                fixed3 bump = fixed3(0,0,1);
                bump.xy = ((packedNormal.xy + packedNormal_inv.xy) - 1) * _BumpScale;
                bump.z = sqrt(1.0 - saturate(dot(bump.xy, bump.xy)));
                float2 offset = bump.xy * _Distortion * 10 * _RefractionTex_Ocean_TexelSize.xy * i.scrPos.z;
                float2 offsetSrcPosFrac = (offset.xy + i.scrPos.xy) / i.scrPos.w;

                float screenDepth = Linear01Depth(tex2Dlod(_CameraDepthTexture, float4(offsetSrcPosFrac, 0, 0)).r);
                float diff = screenDepth - i.depth;
                float intersect = 1 - smoothstep(0, _ProjectionParams.w * _EdgeScale, diff);
                offsetSrcPosFrac = screenDepth <= i.depth ? srcPosFrac : offsetSrcPosFrac;
                // if (screenDepth < i.depth) {
                    // offsetSrcPosFrac = srcPosFrac;
                // }
                // return fixed4(screenDepth <= i.depth, 0, 0, 1);
                // float2 reflScrPosFrac = srcPosFrac;
                // float2 reflOffsetScrPosFrac = offsetSrcPosFrac;

				// #if UNITY_UV_STARTS_AT_TOP 
                // if (_RefractionTex_Ocean_TexelSize.y < 0) 
                // reflScrPosFrac.y = _invY ? 1 - reflScrPosFrac.y : reflScrPosFrac.y;
                // reflOffsetScrPosFrac.y = _invY ? 1 - reflOffsetScrPosFrac.y : reflOffsetScrPosFrac.y;
                // #endif
                fixed3 refrCol = tex2Dlod(_RefractionTex_Ocean, float4(offsetSrcPosFrac, 0, 0)).rgb;
                // fixed3 refrCol = tex2Dlod(_RefractionTex_Ocean, fixed4(srcPosFrac, 0, 0)).rgb;
                //fixed3 refrColOrg = tex2Dlod(_RefractionTex_Ocean, float4(reflScrPosFrac, 0, 0)).rgb;

                //refrCol = lerp(refrCol, refrColOrg, intersect);

                float screenDepthNoLinear = tex2Dlod(_CameraDepthTexture, float4(srcPosFrac, 0, 0)).r;
                float screenDepthOrg = Linear01Depth(screenDepthNoLinear);
                float diffOrg = screenDepthOrg - i.depth;
                float densityIntersect = smoothstep(0, _ProjectionParams.w * _OceanUnderWaterVisiableDistance, diff);
                float densityIntersectOrg = smoothstep(0, _ProjectionParams.w * _OceanUnderWaterVisiableDistance, diffOrg);
                // float underWaterIntersect = smoothstep(0, _ProjectionParams.w * _OceanUnderWaterVisiableDistance, i.depth - 0);
                // densityIntersect = isUnderWater ? underWaterIntersect : lerp(densityIntersect, densityIntersectOrg, intersect);
                densityIntersect = lerp(densityIntersect, densityIntersectOrg, intersect);

                // intersect = step(0, diff) * intersect;
                intersect = (diff > -_ProjectionParams.w) * intersect;
                // intersect = (i.depth > 0) * intersect;
                
                bump = normalize(half3(dot(TtoW0.xyz, bump), dot(TtoW1.xyz, bump), dot(TtoW2.xyz, bump)));
                // bump.xz *= -1;
                // bump = normalize(half3(dot(i.TtoW0.xyz, bump), dot(i.TtoW1.xyz, bump), dot(i.TtoW2.xyz, bump)));
                fixed diffValue = lerp(1 - _OceanDensity, 1, saturate(dot(bump, worldLightDir)));
                // diffValue = lerp(0.5,1,diffValue);
                fixed3 lightCompute = (_LightColor0.rgb * diffValue + UNITY_LIGHTMODEL_AMBIENT.rgb);

                bool shouldSSR = i.depth * _ProjectionParams.z < _SSRDistance && _ProjectionParams.y == 0.3 && _ProjectionParams.z == _MainCameraFarClipPlane;
                float3 reflDir = reflect(-worldViewDir, bump);
                
                fixed4 reflCol = fixed4(0,0,0,1);
                fixed4 ssrtSpecCol = fixed4(0,0,0,1);
                fixed4 ssrtDiffCol = fixed4(0,0,0,1);

                #if _SSRENABLE_ON
                if (shouldSSR)
                {
					ssrtSpecCol = tex2Dlod(_MainCameraSSRTSpecMap, float4(offsetSrcPosFrac, 0, 0));
					ssrtDiffCol = tex2Dlod(_MainCameraSSRTDiffMap, float4(offsetSrcPosFrac, 0, 0));
                    lightCompute += ssrtDiffCol.rgb;
                    // ssrtDiffCol = screenDepth < i.depth ? tex2Dlod(_MainCameraSSRTDiffMap, float4(srcPosFrac, 0, 0)) : ssrtDiffCol;
					// ssrtSpecCol = floor(ssrtSpecCol) / 128;
                    // ssrtSpecCol.a = 1;
					reflCol = tex2DBlurLod(_MainCameraSSRMap, offsetSrcPosFrac, _MainCameraSSRMap_TexelSize, _SSRRoughness);
                    reflCol = lerp(texCubeBlur(_MainCameraReflProbe, reflDir, _MainCameraReflProbe_TexelSize.xy, _SSRRoughness), reflCol, reflCol.a);
                }
				else
				{
					// reflCol = texCUBElod(_MainCameraReflProbe, fixed4(reflDir, 0));
					reflCol = texCubeBlur(_MainCameraReflProbe, reflDir, _MainCameraReflProbe_TexelSize.xy, _SSRRoughness);
				}
                #endif

                fixed4 diffColor = lerp(_OceanSecondColor, _OceanBaseColor, min(1 - bubbleAlpha, densityIntersect)) * fixed4(lightCompute, 1);

                densityIntersect = lerp(_OceanDensityMin, 1, densityIntersect);
                densityIntersect *= _OceanDensity;
                // return fixed4(lightCompute, 1);
                // refrCol = diffColor.rgb * densityIntersect + (1 - densityIntersect) * refrCol;
                refrCol = lerp(refrCol, diffColor.rgb, densityIntersect);

                worldViewDir.y *= isUnderWater ? -1 : 1;

				fixed3 worldHalfDir = normalize(worldLightDir + worldViewDir);
				fixed spec = dot(bump, worldHalfDir);

                // fixed spec = max(0, (dot(worldViewDir, reflect(-worldLightDir, bump))));
                // spec = isUnderWater ? -spec : spec;
				fixed specular = lerp(0,1,smoothstep(-_SpecularSmoothness,_SpecularSmoothness,spec+_SpecularScale-1)) * step(0.001,_SpecularScale);
                // fixed specular = smoothstep(0, _SpecularSmoothness, pow(spec, 1 / _SpecularScale));
                fixed4 specCol = _LightColor0 * specular + ssrtSpecCol;
                // specCol *= (1 - underWaterIntersect * isUnderWater);
                
                // fixed4 reflCol = fixed4(1,1,1,1);
                // reflCol = isUnderWater ? diffColor : lerp(diffColor, reflCol, _ReflectAmount);
                //reflCol += ssrtDiffCol * (1 - underWaterIntersect * isUnderWater);
                // fixed3 refrReflColor = _LightColor0 * specular + reflCol.rgb * (1 - _RefractAmount) * lightCompute + refrCol * _RefractAmount;
                fixed3 refrReflColor = specCol + refrCol.rgb * (1 - _ReflectAmount) + reflCol * _ReflectAmount;
                bubbleAlpha = smoothstep(_BubbleStartHeight, 1, bubbleAlpha);
                bubbleAlpha = max(bubbleAlpha, intersect) * tex2Dlod(_BubbleMap, float4(i.uv1.xy,0,0)).r;
                bubbleAlpha = saturate(bubbleAlpha * _BubbleAlphaMulti);
                fixed3 bubbleColor = lightCompute;
                // bubbleAlpha = saturate(bubbleAlpha) * (1 - underWaterIntersect * isUnderWater);
                fixed3 finalColor = bubbleAlpha * bubbleColor + (1 - bubbleAlpha) * refrReflColor;

                // float faceDot = dot(fixed3(0,1,0), worldViewDir);
                // if (isUnderWater)
                // {
                //     float viewDepth = 0;
                //     float underWaterIntersect = smoothstep(0, _ProjectionParams.w * (101 - _OceanDensity), i.depth - viewDepth);
                //     // float3 underWaterSampler = (screenDepthOrg < i.depth) ? refrColOrg : finalColor;
                //     finalColor = _OceanBaseColor.rgb * underWaterIntersect + (1 - underWaterIntersect) * finalColor;
                // }
                
                fixed4 final = fixed4(finalColor, 1);
				UNITY_APPLY_FOG(i.fogCoord, final); 
                // return fixed4(_LightColor0 * specular);
                return final; 
            }
            ENDCG
        }
    }
	// FallBack "Transparent/Cutout/VertexLit"
    // FallBack "Hidden/ShadowCaster"
}