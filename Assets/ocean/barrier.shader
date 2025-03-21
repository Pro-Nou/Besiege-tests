﻿Shader "Unlit/WinstonBarrier"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_FractureTex("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (0,0,0,0)
		_RimAlpha("Rim Alpha", Range(0,1)) = 0
		_CrackAlpha("Crack Alpha", Range(0,1)) = 0
	}
	SubShader
	{
		Blend srcalpha Oneminussrcalpha
		ZWrite on
		ZTest less
		Cull off

        Tags
        {
            "RenderType"="transparent"
			"Queue"="Transparent+3"
        }
		Pass
		{
			CGPROGRAM
			#pragma target 3.0
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				float2 uv2 : TEXCOORD1;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float2 uv2 : TEXCOORD1;
				float4 scrPos:TEXCOORD2;
				float3 viewDir : TEXCOORD3;
				float3 objectPos : TEXCOORD4;
				float3 worldPos : TEXCOORD5;

				float4 vertex : SV_POSITION;
				float depth : DEPTH;
				float3 normal : NORMAL;
			};

			sampler2D _MainTex;
			sampler2D _FractureTex;
			float4 _MainTex_ST;
			float4 _FractureTex_ST;
			float _CrackAlpha;
			float _RimAlpha;

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.uv2 = TRANSFORM_TEX(v.uv2, _FractureTex);
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.scrPos = ComputeScreenPos(o.vertex);

				o.depth = -mul(UNITY_MATRIX_MV, v.vertex).z *_ProjectionParams.w;
				o.objectPos = v.vertex.xyz;		
				o.normal = UnityObjectToWorldNormal(v.normal);
				o.viewDir = normalize(UnityWorldSpaceViewDir(mul(unity_ObjectToWorld, v.vertex)));

				return o;
			}
			
			sampler2D _CameraDepthTexture;

			fixed4 _Color;

			float triWave(float t, float offset, float yOffset)
			{
				return saturate(abs(frac(offset + t) * 2 - 1) + yOffset);
			}

			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 fracture = tex2D(_FractureTex, i.uv2);
				
				float screenDepth = Linear01Depth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.scrPos)).r);
				float diff = screenDepth - i.depth;
				float intersect = 1 - smoothstep(0, _ProjectionParams.w*0.5, diff);
				float rim = 1 - abs(dot(i.normal, normalize(i.viewDir))) * 2;
				float glow = max(intersect, rim) + _CrackAlpha * fracture;

				fixed4 glowColor = fixed4(lerp(_Color.rgb, fixed3(1, 1, 1), pow(glow, 2)), 1);

				fixed4 col = _Color * _Color.a + glowColor * glow * _RimAlpha;

				return col;
			}
			ENDCG
		}
	}
    FallBack "Diffuse"
}