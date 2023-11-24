Shader "Unlit/skyboxshader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1,1,1,1)
		_HDRThreshold ("HDR Threshold", Range(0,1)) = 0
	}
	SubShader
	{
		Tags {  "QUEUE"="transparent-20" "RenderType"="Background" "PreviewType"="Skybox"}
		LOD 100
		cull off
		zwrite off

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _HDRThreshold;
			fixed4 _Color;
			
			v2f vert (appdata v)
			{
				v2f o;
				float4 worldPos = mul(UNITY_MATRIX_M, v.vertex) + float4(_WorldSpaceCameraPos.xyz, 0);
				o.vertex = mul(UNITY_MATRIX_VP, worldPos);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				return o;
			}
			
			fixed4 frag (v2f i, out float depth: SV_DEPTH) : SV_Target
			{
				depth = 1;
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
				col = pow(col, 1 - _HDRThreshold);
				col *= _Color;
				return col;
			}
			ENDCG
		}
	}
}
