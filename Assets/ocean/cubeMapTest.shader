Shader "Unlit/cubeMapTest"
{
	Properties
	{
		_Cubemap ("Texture", Cube) = "_Skybox" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		ZWrite on
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
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
				float4 vertex : SV_POSITION;
                float3 worldNormal : TEXCOORD2;
			};

			samplerCUBE _Cubemap;
			float4 _Cubemap_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _Cubemap);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
				fixed4 col = texCUBElod(_Cubemap, fixed4(i.worldNormal.xyz,0));
				return col;
			}
			ENDCG
		}
	}
    FallBack "Diffuse"
}
