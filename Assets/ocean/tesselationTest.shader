Shader "Custom/TessellationShader" {
    Properties {
        _TessFactor("Tessellation Base Factor", Range(1,256)) = 10
        _TessFadeDist("Tessellation Fade Distance", Range(1,1000)) = 5
        _TessMinDist("Tessellation Min Distance", Range(0.1, 10)) = 1

        _MainTex("Height Map", 2D) = "white" {}
        _HeightScale("Height Scale", Range(0,10)) = 1
    }
    SubShader {
        Tags { "Queue"="Geometry" "RenderType"="Opaque" }
		cull off
		ZWrite on
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma hull HullS
            #pragma domain DomainS
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct Attribute
			{
    			float4 positionOS : POSITION;
    			float2 uv : TEXCOORD0;
			};
			struct Varings
			{
    			float4 positionCS : SV_POSITION;
    			float2 uv : TEXCOORD0;
			};
			struct TrianglePatchTess
			{
    			float edgeTess[3] : SV_TessFactor; 
    			float insideTess : SV_InsideTessFactor;
			};
			struct HullOutput
			{
    			float3 positionOS : TEXCOORD0;
    			float2 uv : TEXCOORD1;
			};
			struct DomainOutput
			{
    			float4 positionCS : SV_POSITION;
    			float2 uv : TEXCOORD0;
				float3 worldPos : TEXCOORD1;
			};

			float _TessFadeDist;
			float _TessMinDist;
			float _TessFactor;
			float _HeightScale;
			
			sampler2D _MainTex;
            float4 _MainTex_ST;

			[domain("tri")] 
			[partitioning("integer")] 
			[outputtopology("triangle_cw")]  
			[outputcontrolpoints(4)] 
			[patchconstantfunc("ComputeTessFactor")] 
			[maxtessfactor(64.0)] 
			HullOutput HullS(InputPatch<Attribute, 3> input, uint controlPointId : SV_OutputControlPointID, uint patchId : SV_PrimitiveID)
			{
				HullOutput output;

				output.positionOS = input[controlPointId].positionOS;
				// output.uv = input[controlPointId].uv;
				output.uv = TRANSFORM_TEX(input[controlPointId].uv, _MainTex);
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
				float3 p0 = mul(unity_ObjectToWorld, patch[0].positionOS).xyz;
				float3 p1 = mul(unity_ObjectToWorld, patch[1].positionOS).xyz;
				float3 p2 = mul(unity_ObjectToWorld, patch[2].positionOS).xyz;

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

				float3 positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z; 
				float2 uv = patch[0].uv * bary.x + patch[1].uv * bary.y + patch[2].uv * bary.z; 

				float height = tex2Dlod(_MainTex, float4(uv, 0, 0)).r * _HeightScale;
				positionOS.y += height;

				output.positionCS = UnityObjectToClipPos(positionOS);
				// output.uv = TRANSFORM_TEX(uv, _MainTex);
				output.uv = uv;
				output.worldPos = mul(unity_ObjectToWorld, float4(positionOS, 1)).xyz;
				return output;
			}

			Attribute vert(Attribute input)
			{
				return input;
			}

			half4 frag(DomainOutput input, out float depth: SV_DEPTH0) : SV_Target
			{
				float4 clipPos = mul(UNITY_MATRIX_VP, float4(input.worldPos, 1));
            	depth = clipPos.z / clipPos.w - (_ProjectionParams.y * _ProjectionParams.w);
				return tex2Dlod(_MainTex, float4(input.uv, 0, 0));
			}
			ENDCG
        }
    }
    fallback "Alphatest"
}
