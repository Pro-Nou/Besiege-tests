Shader "Unlit/subLightningPSShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1,1,1,1)
		_ColorInside ("Color Inside", Color) = (1,1,1,1)
		_ColorMult ("Color Mult", Range(0, 4)) = 1
	}
	SubShader
	{
		Tags { "RenderType"="transparent" "Queue"="transparent" "LightMode"="ForwardBase"}
		LOD 100
		cull off
		zwrite off
		// blendop add
		blend SrcAlpha OneMinusSrcAlpha

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
				fixed4 color : COLOR;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
				fixed4 color : COLOR;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			fixed4 _Color;
			fixed4 _ColorInside;
			float _ColorMult;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.color = v.color;
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
				fixed alpha = tex2Dlod(_MainTex, float4(i.uv, 0, 0)).r;
				float cutoff = abs(abs(i.uv.x) - i.color.a);
				alpha -= saturate(cutoff * 1.5 - 0.5);
				fixed3 col = max(0.4, alpha) * (_ColorMult - cutoff) * lerp(_Color.rgb, _ColorInside.rgb, alpha);
				// fixed4 col = fixed4(lerp(_Color.rgb, _ColorInside.rgb, alpha), alpha);
				return fixed4(col, alpha);
			}
			ENDCG
		}
	}
}
