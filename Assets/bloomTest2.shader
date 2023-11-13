Shader "Custom/BloomTest2" {

	Properties {
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTestMode ("ZTestMode", float) = 4
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", float) = 10
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Texture", 2D) = "white" {}
		_Cutoff  ("Alpha Cutoff" , Range(0 , 1)) = 0.4
		_BloomColor("Bloom Color", Color) = (1,1,1,1)
		_BloomTex ("Bloom Tex", 2D) = "white" {}
	}
	SubShader {
		Tags {"Queue" = "AlphaTest" "RenderType"="Opaque"  "IgnoreProjector" = "True" }
		LOD 100
		
		Pass {
			
			Cull back
			ZWrite off
			ZTest [_ZTestMode]
			Blend [_SrcBlend] [_DstBlend]
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			
			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float4 pos : SV_POSITION;
			};

			struct f2o
			{
				fixed4 col : SV_TARGET;
				fixed depth : SV_DEPTH;
			};
			float4 _MainTex_ST;
			float4 _Color;
			fixed _Cutoff;
			float4 _BloomColor;
			sampler2D _MainTex;
			sampler2D _BloomTex;

			v2f vert (appdata v)
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.worldNormal = mul(v.normal,(float3x3)unity_WorldToObject);
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				return o;
			}

			f2o frag(v2f i) {
				fixed4 col = _Color * tex2D(_MainTex, i.uv);
				// col.a = max(col.a, 0.1);
				clip(col.a-_Cutoff);
				f2o o;
				o.col = col;
				o.depth = i.pos.z;
				return o;
			}
			ENDCG
		}
	}
    // FallBack "Diffuse"
	FallBack "Transparent/Cutout/VertexLit"
}
