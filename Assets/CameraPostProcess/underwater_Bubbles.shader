Shader "Unlit/underwater_Bubbles"
{
	Properties
	{
		_SpecularScale ("Specular Scale", Range(0,1)) = 0.02
		_SpecularSmoothness ("Specular Smoothness", Range(0,1)) = 0.1
		_RimScale ("Rim Scale", Range(0, 10)) = 1
	}
	SubShader
	{
		Tags { "RenderType"="transparent" "QUEUE"="transparent" }
		LOD 100
		ZWrite off
		Cull back
		blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
      		#pragma multi_compile_fwdbase
			
			#include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "Lighting.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
                float3 worldPos : TEXCOORD0;
                float4 color : COLOR;
				float3 normal : NORMAL;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _OceanHeight;
			float _SpecularScale;
			float _SpecularSmoothness;
			float _RimScale;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.color = v.color;
				o.normal = UnityObjectToWorldNormal(v.normal);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				clip(_OceanHeight - i.worldPos.y);
                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
				float rim = _RimScale - abs(dot(i.normal, normalize(worldViewDir))) * 2;

				fixed3 worldHalfDir = normalize(worldLightDir + worldViewDir);
				fixed spec = dot(i.normal, worldHalfDir);
				fixed specular = lerp(0,1,smoothstep(-_SpecularSmoothness,_SpecularSmoothness,spec+_SpecularScale-1)) * step(0.001,_SpecularScale);

				fixed4 glow = fixed4(i.color.rgb, i.color.a * rim);
				fixed4 col = glow + _LightColor0 * specular;
				// float4 col = fixed4(.rgb, i.color.a * _alpha);
				return col;
			}
			ENDCG
		}
	}
}
