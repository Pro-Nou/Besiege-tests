Shader "Unlit/lightningShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1,1,1,1)
		_ColorInside ("Color Inside", Color) = (1,1,1,1)
		_Progress ("Progress", Range(0, 1)) = 0
		_ProgressCurv ("Progress Curv", 2D) = "white" {}
        _Distortion ("Distortion", Range(0, 1)) = 0.5
        _DistortionMap ("Distortion Map", 2D) = "" {}
		_DissolveMap ("Dissolve Map", 2D) = "" {}
		_ColorMult ("Color Mult", Range(0, 4)) = 1
	}
	SubShader
	{
		Tags { "RenderType"="transparent" "Queue"="transparent"}
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
			};

			struct v2f
			{
				float4 uv : TEXCOORD0;
				float4 uv2 : TEXCOORD1;
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _ProgressCurv;
			sampler2D _DistortionMap;
			float4 _DistortionMap_ST;
			sampler2D _DissolveMap;
			float4 _DissolveMap_ST;
			float _Distortion;
			fixed4 _Color;
			fixed4 _ColorInside;
			float _ColorMult;
			float _Progress;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv.xy = TRANSFORM_TEX(v.uv, _MainTex);
				o.uv.zw = TRANSFORM_TEX(v.uv, _DistortionMap);
				o.uv2.xy = TRANSFORM_TEX(v.uv, _DissolveMap);
				o.uv2.zw = v.uv;
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
				float Distortion = tex2Dlod(_DistortionMap, float4(i.uv.z, 0.5, 0, 0)).r;
				Distortion = _Distortion * _Progress * (Distortion * 2 - 1);
				float alpha = tex2Dlod(_MainTex, float4(i.uv.x, i.uv.y + Distortion, 0, 0)).r;
				float progressAlpha = tex2Dlod(_ProgressCurv, float4(_Progress, 0, 0, 0)).r;
				float cutoff = 1 - progressAlpha;
				cutoff = max(i.uv2.zw.x - saturate(_Progress * 2), cutoff);
				cutoff = max(tex2Dlod(_DissolveMap, float4(i.uv2.xy, 0, 0)).r - (1 - _Progress), cutoff);
				alpha -= saturate(cutoff);
				// col.a = col.a;
				// clip(alpha - cutoff);

				fixed3 col = max(0.4, alpha) * (_ColorMult - cutoff) * lerp(_Color.rgb, _ColorInside.rgb, smoothstep(0, 1, alpha));
				return fixed4(col, alpha);
			}
			ENDCG
		}
	}
}
