Shader "Custom/NewUnlitShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" "Queue"="geometry"}
		LOD 100

		Pass
		{
			Tags{"LightMode"="Deferred"}
        	zwrite on
        	cull off
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
				float3 worldPos : TEXCOORD1;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				return o;
			}
			
			fixed4 frag (v2f i, out float depth: SV_DEPTH0) : SV_Target
			//fixed4 frag (v2f i) : SV_Target
			{
				float4 clipPos = mul(UNITY_MATRIX_VP, float4(i.worldPos, 1));
            	depth = clipPos.z / clipPos.w - (_ProjectionParams.y * _ProjectionParams.w);
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
				return fixed4(1,0,1,1);
			}
			ENDCG
		}
	}
}
