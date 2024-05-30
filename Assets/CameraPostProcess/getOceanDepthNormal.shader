Shader "Hidden/getOceanDepthNormal"
{
	CGINCLUDE
	inline float2 m_EncodeViewNormalStereo( float3 n )
	{
		// float kScale = 1;
		// float2 enc;
		// enc = n.xy / (n.z+1);
		// enc /= kScale;
		// enc = enc*0.5+0.5;
		// return enc;
		return ((n + 1) / 2).xy;
	}
	inline float3 m_EncodeFloatRG(float depth)
	{
		// float encodeFactor = 128;

		// float depthMod0 = (depth * encodeFactor); 
		// float depthMod1 = depthMod0 % 1;
		// depthMod0 -= depthMod1;
		// depthMod0 /= encodeFactor;

		// depthMod1 *= encodeFactor;
		// float depthMod2 = depthMod1 % 1;
		// depthMod1 -= depthMod2;
		// depthMod1 /= encodeFactor;
		// float3 rgb = float3(depthMod0, depthMod1, depthMod2);
		// return rgb;
		return float3(depth, 0, 0);
	}
	ENDCG
	SubShader
	{
		Tags{"QUEUE"="geometry" "RenderType" = "Opaque" }
        Blend  SrcAlpha OneMinusSrcAlpha 
		Cull back 
		Lighting Off 
		ZTest less
		ZWrite on
		Blend one Zero
		Fog{ Mode Off }
		Pass
		{
			Tags{"LightMode"="ForwardBase"}
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
      		#pragma multi_compile_fwdbase
			#pragma shader_feature _RCVRAIN_ON
			#include "UnityCG.cginc"
 
			sampler2D _MainTex;
			float4 _MainTex_ST;
			half4 _Color;
			fixed _Cutoff;

			float _ClearCoatAmount;
			float _OceanHeight;
			float _RainClearCoat;
			float _AfterRainAmount;
			float _Smoothness;

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float2 uv : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				float depth : DEPTH;
				float3 normal : NORMAL;
				float2 uv : TEXCOORD0;
				float3 worldPos : TEXCOORD1;
			};

			struct finalOutPut
			{
				float4 depth : SV_Target0;
				float4 normal : SV_Target1;
				float4 specPre : SV_Target2;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.depth = -mul(UNITY_MATRIX_MV, v.vertex).z * _ProjectionParams.w;
				o.normal = UnityObjectToWorldNormal(v.normal);
				o.uv.xy = TRANSFORM_TEX(v.uv, _MainTex);
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;

				return o;
			}
			finalOutPut frag(v2f i)
			{
				fixed4 col = _Color * tex2Dlod(_MainTex, float4(i.uv.xy, 0, 0));
				clip(col.a - _Cutoff);
				float3 viewNormal = normalize(mul((float3x3)unity_WorldToCamera, i.normal));
				// viewNormal.xy = 0;
				// viewNormal.z *= -1;

				finalOutPut o;
				// o.depth = float4(EncodeFloatRG(i.depth),  0, 1);
				o.depth = float4(m_EncodeFloatRG(i.depth), 1);
				// o.depth = float4(i.depth + 1, 0, 0, 1);
				o.normal = float4((viewNormal + 1) / 2, 1);
				
				fixed rainClearCoatAmount = _ClearCoatAmount;
				#if _RCVRAIN_ON
				float shouldRainDrop = (i.worldPos.y > _OceanHeight);
				rainClearCoatAmount = max(_RainClearCoat * shouldRainDrop * _AfterRainAmount, rainClearCoatAmount);
				#endif
				fixed clearCoatSmoothness = lerp(_Smoothness, 0.85, min(rainClearCoatAmount * 5, 1));
				fixed specSmoothness = lerp(0.0001, 0.2, 1 - clearCoatSmoothness);
				fixed specCularScale = lerp(0.0005, 0.1, 1 - clearCoatSmoothness);
				
				o.specPre = float4(specCularScale, specSmoothness, 0, 1);
				return o;
			}
			ENDCG
		}
	}
	SubShader
	{
		Tags {"QUEUE"="geometry" "RenderType" = "Ocean"}
		Blend One Zero
		Cull off
		LOD 100
		ZWrite on

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

			#define _HeightBump 200

			sampler2D _OceanHeightMap;
			float4 _OceanHeightMap_ST;
			float4 _OceanHeightMap_TexelSize;
			sampler2D _OceanWaveCullMap;
			float4 _OceanWaveCullMap_ST;
			// float _interactFadeUV;
			float _interactFadeDistance;

			float _OceanWaveCullScale;
			float _OceanHeightScale;
			// float _HeightBump;
			float4 _OceanWaveSpeed;

			float _TessFadeDist;
			float _TessMinDist;
			float _TessFactor;

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
				float3 tangent_u = float3(1, (crossSampler.x - crossSampler.y), 0);
				float3 tangent_v = float3(0, (crossSampler.z - crossSampler.w), 1);
				float3 normalOut = cross(normalize(tangent_u), normalize(tangent_v));
				normalOut = normalOut.y < 0 ? -normalOut : normalOut;
				return normalize(normalOut);
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
			struct DomainOutput
            {
                float4 pos : SV_POSITION;
                float4 scrPos : TEXCOORD0;
                float4 uv : TEXCOORD1;
                float3 worldPos : TEXCOORD2;
                float depth: DEPTH;
            };
			struct finalOutPut
			{
				float4 depth : SV_Target0;
				float4 normal : SV_Target1;
				float4 specPre : SV_Target2;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _SpecularScale;
			float _SpecularSmoothness;
			
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
			
			[domain("tri")]
			DomainOutput DomainS(TrianglePatchTess patchTess, float3 bary: SV_DomainLocation, const OutputPatch<HullOutput, 3> patch)
			{
				DomainOutput output;

				float4 positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z; 
				float4 uv = patch[0].uv * bary.x + patch[1].uv * bary.y + patch[2].uv * bary.z; 
				float4 tangentOS = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z; 
				//float3 normalOS = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z; 

                float2 waveOffset = _OceanWaveSpeed.xy * _Time.x;
                float2 waveMaskOffset = _OceanWaveSpeed.zw * _Time.x;
                output.worldPos = mul(unity_ObjectToWorld, positionOS).xyz;
                // output.uv.xy = TRANSFORM_TEX(uv.xy, _OceanHeightMap) + waveOffset;
                // output.uv.zw = TRANSFORM_TEX(uv.xy, _OceanWaveCullMap) + waveMaskOffset;
                output.uv.xy = TRANSFORM_TEX(output.worldPos.xz, _OceanHeightMap) + waveOffset;
                output.uv.zw = TRANSFORM_TEX(output.worldPos.xz, _OceanWaveCullMap) + waveMaskOffset;
                // bool shouldInteract = uv.z <= (1 - _interactFadeUV) && uv.z >= _interactFadeUV && uv.w <= (1 - _interactFadeUV) && uv.w >= _interactFadeUV;
                bool shouldInteract = abs(positionOS.x - _WorldSpaceCameraPos.x) < _interactFadeDistance && abs(positionOS.z - _WorldSpaceCameraPos.z) < _interactFadeDistance;
                
                if (shouldInteract)
                {
					float waveMask = max(0, tex2Dlod(_OceanWaveCullMap, float4(output.uv.zw, 0, 0)).r - _OceanWaveCullScale);
					waveMask = smoothstep(0, 1 - _OceanWaveCullScale, waveMask) * _OceanHeightScale;
                    float height = tex2Dlod(_OceanHeightMap, float4(output.uv.xy, 0, 0)).r * waveMask;
                    positionOS.y += height;
					output.worldPos.y += height;
                }

				output.pos = UnityObjectToClipPos(positionOS);
                output.scrPos = ComputeScreenPos(output.pos);

        		output.depth = -mul(UNITY_MATRIX_MV, positionOS).z * _ProjectionParams.w;
				return output;
			}
			finalOutPut frag(DomainOutput i)
			{
				float2 srcPosFrac = i.scrPos.xy / i.scrPos.w;

                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
                float waveMask = max(0, tex2Dlod(_OceanWaveCullMap, float4(i.uv.zw, 0, 0)).r - _OceanWaveCullScale);
                waveMask = smoothstep(0, 1 - _OceanWaveCullScale, waveMask);// * _OceanHeightScale;

                float3 normalOS = grayToNormal(_OceanHeightMap, _OceanHeightMap_TexelSize.xy, i.uv.xy);
				// normalOS = lerp(fixed3(0,1,0), normalOS, waveMask);
				normalOS.y /= max(0.0001, _OceanHeightScale * waveMask);
				normalOS = normalize(normalOS);
				// normalOS = float3(0, 1, 0);

                // float3 worldNormal = UnityObjectToWorldNormal(normalize(normalOS));
				float3 viewNormal = normalize(mul((float3x3)unity_WorldToCamera, normalOS));
				// viewNormal.x *= -1;
				// viewNormal.xy = 0;
				// viewNormal.z *= -1;
				finalOutPut o;
				// o.depth = float4(EncodeFloatRG(i.depth), 0, 1);
				o.depth = float4(m_EncodeFloatRG(i.depth), 1);
				// o.depth = float4(i.depth + 1, 0, 0, 1);
				o.normal = float4((viewNormal + 1) / 2, 1);
				o.specPre = float4(_SpecularScale, _SpecularSmoothness, 1, 1);
				return o;
			}
			ENDCG
		}
	}
	Fallback off
}
