Shader "Custom/CheapGlow" {

	Properties {
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTestMode ("ZTestMode", float) = 4
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", float) = 10
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1,0.6,0,1)
		_GlowColor("Glow Color", Color) = (1,1,0,1)
		_Strength("Glow Strength", Range(0.0, 10.0)) = 0.2
		_GlowRange("Glow Range", Range(0.1,1)) = 0.6
		_BloomColor("Bloom Color", Color) = (1,1,1,1)
		_BloomTex ("Bloom Tex", 2D) = "white" {}
	}

	SubShader {


		Tags {"queue"="alphatest" "PerformanceChecks"="False" "RenderType" = "Opaque"}
		LOD 100
		Pass {
			Cull back
			ZWrite off
			ZTest less
			Blend [_SrcBlend] [_DstBlend]

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			float4 _GlowColor;
			float _Strength;
			float _GlowRange;

			struct a2v {
				float4 vertex : POSITION;
				float4 normal : NORMAL;
			};

			struct v2f {
				float4 position : SV_POSITION;
				float texelStrenth : TEXCOORD0;
				float4 col : COLOR;
			};

			v2f vert(a2v a) {
				v2f o;

				float3 normalDirection = normalize(UnityObjectToWorldNormal(a.normal));
				fixed3 clipDirection = fixed3(mul((float3x3)UNITY_MATRIX_MVP, a.normal).xyz);

				float3 worldPos = mul(unity_ObjectToWorld, a.vertex).xyz;
				float3 viewDirection = normalize(UnityWorldSpaceViewDir(worldPos));

				o.position = UnityObjectToClipPos(a.vertex) + _GlowRange * fixed4(clipDirection.xy,0,0);
				float strength = pow(dot(viewDirection, normalDirection), 2) + pow(dot(fixed3(0,0,1), clipDirection), 2);
				o.col = _GlowColor;
				o.texelStrenth = strength * _Strength;
				return o;
			}

			fixed4 frag(v2f i) : COLOR {
				return fixed4(i.col.rgb, i.texelStrenth);
			}

			ENDCG
		}

		Pass {

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			float4 _Color;

			float4 vert(float4 vertexPos : POSITION) : SV_POSITION {
				return UnityObjectToClipPos(vertexPos);
			}

			float4 frag(void) : COLOR {
				return _Color;
			}

			ENDCG
		}
	}
	FallBack "Diffuse"
}
