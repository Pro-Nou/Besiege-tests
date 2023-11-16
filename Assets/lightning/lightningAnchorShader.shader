Shader "Unlit/lightningAnchorShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1,1,1,1)
		_ColorInside ("Color Inside", Color) = (1,1,1,1)
		_ColorMult ("Color Mult", Range(0, 4)) = 1
		_Progress ("Progress", Range(0, 1)) = 0
		_ProgressCurv ("Progress Curv", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="transparent" "Queue"="transparent" "LightMode"="ForwardBase"}
		zwrite off
		cull off
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
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _CameraDepthTexture;
			float4 _CameraDepthTexture_TexelSize;
			fixed4 _Color;
			fixed4 _ColorInside;
			float _ColorMult;
			float _Progress;
			sampler2D _ProgressCurv;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv.xy = TRANSFORM_TEX(v.uv, _MainTex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed alpha = tex2Dlod(_MainTex, float4(i.uv.xy, 0, 0)).a;
				float progressAlpha = tex2Dlod(_ProgressCurv, float4(_Progress, 0.5, 0, 0)).r;
				alpha *= progressAlpha;
				fixed3 col = lerp(_Color.rgb, _ColorInside.rgb, alpha);
				return fixed4(col, alpha);
			}
			ENDCG
		}
	}
}
