Shader "Unlit/raymarchingOcean"
{
	Properties{
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}

		[HeaderHelpURL(Rendering)]
		[Enum(UnityEngine.Rendering.CullMode)] _Culling ("Cull Mode", Int) = 2
		[Enum(Off,0,On,1)] _ZWrite("ZWrite", Int) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Int) = 4

		[HeaderHelpURL(Blending)]
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc ("Blend mode Source", Int) = 5 // SrcAlpha
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendDst ("Blend mode Destination", Int) = 6 //OneMinusSrcAlpha
	}
	SubShader {
		Tags { "RenderType"="volum" "Queue"="Transparent+1" "LightMode" = "ForwardBase" "PerformanceChecks"="False"}

		Cull [_Culling]

		ZWrite [_ZWrite]
		ZTest [_ZTest]

		Blend [_BlendSrc] [_BlendDst]
		LOD 100

		GrabPass
        {
            "_CameraOpaqueTexture1"
        }

		Pass{
			CGPROGRAM
		
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
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
				float4 scrPos : TEXCOORD1;
				float4 grabPos : TEXCOORD2;
			};
        
			fixed4 _Color;
			sampler2D _MainTex;
			float4 _MainTex_ST;

			sampler2D _CameraOpaqueTexture1;
			float4 _CameraOpaqueTexture1_ST;
			sampler2D _CameraDepthTexture;
			

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.scrPos = ComputeScreenPos(o.vertex);
				o.grabPos = ComputeGrabScreenPos(o.vertex);
				#if UNITY_UV_STARTS_AT_TOP
					o.scrPos.y = o.scrPos.w - o.scrPos.y;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{

				// float4 grabTex = tex2Dproj(_CameraOpaqueTexture1, i.grabPos + fixed4(1,1,0,0));

				// fixed4 scrSamplePos = fixed4((i.scrPos.x / i.scrPos.w), (i.scrPos.y / i.scrPos.w),0,0);
				// float4 grabTex = tex2Dlod(_CameraOpaqueTexture1, scrSamplePos);

				float4 grabTex = tex2Dlod(_CameraOpaqueTexture1, fixed4(i.uv,0,0));

				fixed4 col;
				col.rgb = grabTex.aaa;
				col.a = 1;
				return col;
			}
			ENDCG
		} // Pass
	} // SubShader
	FallBack "Diffuse"
}
