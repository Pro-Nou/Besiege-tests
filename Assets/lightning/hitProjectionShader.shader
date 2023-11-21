Shader "Unlit/hitProjectionShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1,1,1,1)
		_ColorInside ("Color Inside", Color) = (1,1,1,1)
		_ColorMult ("Color Mult", Range(0, 4)) = 1
		_Progress ("Progress", Range(0, 1)) = 0
	}
	SubShader
	{
		Tags { "RenderType"="transparent" "Queue"="geometry+1" "LightMode"="ForwardBase" "DisableBatching"="true"}
		ztest off
		zwrite off
		cull front
		blend SrcAlpha OneMinusSrcAlpha
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				float4 scrPos : TEXCOORD0;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _CameraDepthTexture;
			float4 _CameraDepthTexture_TexelSize;
			fixed4 _Color;
			fixed4 _ColorInside;
			float _ColorMult;
			float _Progress;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.scrPos = ComputeScreenPos(o.pos);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
                float2 srcPosFrac = i.scrPos.xy / i.scrPos.w;
                float screenDepth = Linear01Depth(tex2Dlod(_CameraDepthTexture, float4(srcPosFrac, 0, 0)).r);

				float2 ndcPos = srcPosFrac.xy * 2 - 1;
				float3 clipVec = float3(ndcPos.x, ndcPos.y, -1);
				float3 viewVec = mul(unity_CameraInvProjection, clipVec.xyzz).xyz;
				float3 viewPos = viewVec * _ProjectionParams.z * screenDepth; 
				float3 worldPos = mul(unity_CameraToWorld, float4(viewPos, 1)).xyz;
				float3 objectPos = mul(unity_WorldToObject, float4(worldPos, 1)).xyz;

				clip(0.5 - abs(objectPos));
				float2 projUV = objectPos.xz + 0.5;

				fixed alpha = tex2Dlod(_MainTex, float4(projUV, 0, 0)).r;
				float cutoff = _Progress;
				alpha -= cutoff;
				fixed alphaFinal = pow(alpha, 0.5);
				clip(alphaFinal - 0.3);
				fixed3 col = alpha > 0.5 ? lerp(_Color.rgb, _ColorInside.rgb, alpha * 2 - 1) : lerp(fixed3(0, 0, 0), _Color.rgb, alpha * 2);
				col *= max(0.4, alpha) * (_ColorMult - cutoff);
				return fixed4(col, alphaFinal);
			}
			ENDCG
		}
	}
}
