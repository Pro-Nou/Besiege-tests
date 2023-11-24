Shader "Unlit/underWaterMask"
{
	Properties
	{
    	_baseColor ("base color", Color) = (1.0,1.0,1.0,1.0)
	}
	SubShader
	{
		Tags { "RenderType"="volum" "Queue"="transparent-10" "LightMode" = "ForwardBase" "PerformanceChecks"="False"}
			ZWrite on
			Cull off
			blend SrcAlpha OneMinusSrcAlpha
		LOD 100
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
      		#pragma multi_compile_fwdbase
			
			#include "UnityCG.cginc"

			float4 _baseColor;
			float _OceanDensity;
			float _OceanHeight;
			float _OceanUnderWaterVisiableDistance;
			sampler2D _CameraDepthTexture;
			float4 _CameraDepthTexture_TexelSize;

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
                float4 scrPos : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
                fixed3 worldNormal : TEXCOORD2;
				float depth : DEPTH;
			};

			
			v2f vert (appdata v)
			{
				v2f o;
				float3 localScale = float3(length(float3(unity_ObjectToWorld[0].x, unity_ObjectToWorld[1].x, unity_ObjectToWorld[2].x)),
											length(float3(unity_ObjectToWorld[0].y, unity_ObjectToWorld[1].y, unity_ObjectToWorld[2].y)),
											length(float3(unity_ObjectToWorld[0].z, unity_ObjectToWorld[1].z, unity_ObjectToWorld[2].z)));
				float4 cameraOffset = float4(_WorldSpaceCameraPos / localScale.xyz, 0);
				float4 offsetVertex = v.vertex + cameraOffset;
				o.pos = mul(UNITY_MATRIX_MVP, offsetVertex);
                o.scrPos = ComputeScreenPos(o.pos);
                o.worldPos = mul(unity_ObjectToWorld, offsetVertex).xyz;
                o.worldNormal = UnityObjectToWorldNormal(normalize(v.normal));
        		o.depth = -mul(UNITY_MATRIX_MV, offsetVertex).z * _ProjectionParams.w;
				return o;
			}
			
			fixed4 frag (v2f i, out float depth: SV_DEPTH) : SV_Target
			{	
				// float3 localCameraPos = mul(unity_WorldToObject, float4(_WorldSpaceCameraPos,1)).xyz;
				// bool CameraInside = (localCameraPos.y < 0);
                float2 srcPosFrac = i.scrPos.xy / i.scrPos.w;
                float screenDepthNoLinear = tex2Dlod(_CameraDepthTexture, fixed4(srcPosFrac, 0, 0)).r;
                float screenDepthOrg = Linear01Depth(screenDepthNoLinear);

				float2 ndcPos = srcPosFrac.xy * 2 - 1;
				float3 clipVec = float3(ndcPos.x, ndcPos.y, -1) * _ProjectionParams.z;
				float3 viewVec = mul(unity_CameraInvProjection, clipVec.xyzz).xyz;
				float3 viewPos = viewVec * screenDepthOrg;
				float3 worldPos0 = mul(unity_CameraToWorld, float4(viewPos, 1)).xyz;
				clip(_OceanHeight - worldPos0.y);
				bool isUnderWater = (_WorldSpaceCameraPos.y < _OceanHeight);
				// float3 objectPos = mul(unity_WorldToObject, float4(worldPos0,1)).xyz;
				// bool worldPosInside = (objectPos.y < 0);

				float viewDepth = 0;
				float depthCompute = isUnderWater ? screenDepthOrg : screenDepthOrg * (abs(_OceanHeight - worldPos0.y) / abs(_WorldSpaceCameraPos.y - worldPos0.y));
                // float viewDepth = -mul(UNITY_MATRIX_MV, fixed4(_WorldSpaceCameraPos.xyz, 1)).z * _ProjectionParams.w;
                float underWaterIntersect = _OceanDensity * smoothstep(0, _ProjectionParams.w * _OceanUnderWaterVisiableDistance, screenDepthOrg);

				// float4 clipPos = mul(UNITY_MATRIX_VP, float4(i.worldPos, 1));
            	// depth = clipPos.z / clipPos.w  - (_ProjectionParams.y * _ProjectionParams.w);

                // fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
				depth = screenDepthNoLinear;
				return fixed4(_baseColor.rgb, underWaterIntersect);
			}
			ENDCG
		}
	}
	// fallback "Diffuse"
	// FallBack "Transparent/Cutout/VertexLit"
}
