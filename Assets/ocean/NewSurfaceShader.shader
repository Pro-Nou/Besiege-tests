Shader "Custom/NewSurfaceShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" "Queue" = "alphatest+1"}
		LOD 200
		zwrite on
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows vertex:vert


			sampler2D _MainTex;
			struct appdata
			{
				float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
				float2 texcoord : TEXCOORD0;
			};

			struct Input
			{
				float2 uv_MainTex;
				float z;
				//float4 vertex : SV_POSITION;
				//float3 worldPos : TEXCOORD1;
			};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;
			void vert (inout appdata v, out Input o)
			{
				//o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv_MainTex = v.texcoord;
				o.z = 1;
                //o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
			}

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			//fixed4 c = fixed4(IN.z,1,1,1);
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
}
