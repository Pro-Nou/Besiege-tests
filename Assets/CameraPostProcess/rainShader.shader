Shader "Particles/rainShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", color) = (1, 1, 1, 1)
		_Scale ("Scale", vector) = (1, 1, 1, 1)
		_DeploySize ("Deploy Size", range(8, 64)) = 16.0
		_Duration ("Duration", float) = 5
		_StartSpeed ("Start Speed", Vector) = (0, 0, 0, 0)
		_AlphaCurve ("Alpha Curve", 2D) = "white" {}
		_totalCount("Total Count", float) = 512
	}
	CGINCLUDE
		#include "UnityCG.cginc"
		#include "AutoLight.cginc"
		#include "Lighting.cginc"

		struct v2g
		{
			float4 vertex : POSITION;
			float lifetime : LIFETIME;
		};
		struct g2f
		{
			float4 vertex : SV_POSITION;
			float lifetime : LIFETIME;
            float2 uv: TEXCOORD0;
            float3 wordPos: TEXCOORD1;
		};
		struct particleData
		{
			float3 pos;
		};

		StructuredBuffer<particleData> _particleDataBuffer;
		sampler2D _MainTex;
		float4 _MainTex_ST;
		sampler2D _AlphaCurve;
		float4 _Color;
		float _OceanHeight;
		float _CloudHeight;
		float4 _Scale;
		float _DeploySize;
		float _Duration;
		float4 _StartSpeed;
		float _totalCount;
		float _rainVisibility;
		float _AfterRainAmount;

		[maxvertexcount(6)]
		void geomSrcSprite(point v2g v[1], inout TriangleStream<g2f> triStream) {
			float4 clipPos = UnityObjectToClipPos(v[0].vertex);
			if (clipPos.z > 0)
			{
				g2f o1;
				float4 screenOffset = float4(1 / _ScreenParams.x, 1 / _ScreenParams.y, 0, 0) * clipPos.w;
				// o1.uv = v[0].uv;
				// o1.uv2 = v[0].uv2;
				float4 p1 = clipPos + screenOffset * float4(-_Scale.x,_Scale.y,0,0);
				float4 p2 = clipPos + screenOffset * float4(-_Scale.x,-_Scale.y,0,0);
				float4 p3 = clipPos + screenOffset * float4(_Scale.x,-_Scale.y,0,0);
				float4 p4 = clipPos + screenOffset * float4(_Scale.x,_Scale.y,0,0);
				float2 uv1 = fixed2(0, 1);
				float2 uv2 = fixed2(0, 0);
				float2 uv3 = fixed2(1, 0);
				float2 uv4 = fixed2(1, 1);
				o1.wordPos = v[0].vertex;
				o1.lifetime = v[0].lifetime;
				o1.vertex = p3;
				o1.uv.xy = uv3;
				triStream.Append(o1);
				o1.vertex = p4;
				o1.uv.xy = uv4;
				triStream.Append(o1);
				o1.vertex = p1;
				o1.uv.xy = uv1;
				triStream.Append(o1);
				o1.vertex = p1;
				o1.uv.xy = uv1;
				triStream.Append(o1);
				o1.vertex = p3;
				o1.uv.xy = uv3;
				triStream.Append(o1);
				o1.vertex = p2;
				o1.uv.xy = uv2;
				triStream.Append(o1);
			}
		}

		[maxvertexcount(6)]
		void geomVBillboard(point v2g v[1], inout TriangleStream<g2f> triStream) {
			float4 clipPos = UnityObjectToClipPos(v[0].vertex);
			if (clipPos.z > 0)
			{
				g2f o1;

				float3 worldPos = v[0].vertex.xyz;
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				float3 left = normalize(cross(fixed3(0, 1, 0), worldViewDir));
				// float3 up = normalize(cross(worldViewDir, left));
				float3 up = fixed3(0, 1, 0);

				float3 wp1 = worldPos + (_Scale.x * left + _Scale.y * up);
				float3 wp2 = worldPos + (_Scale.x * left - _Scale.y * up);
				float3 wp3 = worldPos + (-_Scale.x * left - _Scale.y * up);
				float3 wp4 = worldPos + (-_Scale.x * left + _Scale.y * up);
				float4 p1 = UnityObjectToClipPos(wp1);
				float4 p2 = UnityObjectToClipPos(wp2);
				float4 p3 = UnityObjectToClipPos(wp3);
				float4 p4 = UnityObjectToClipPos(wp4);
				float2 uv1 = fixed2(0, 1);
				float2 uv2 = fixed2(0, 0);
				float2 uv3 = fixed2(1, 0);
				float2 uv4 = fixed2(1, 1);
				// o1.uv = v[0].uv;
				// o1.uv2 = v[0].uv2;
				o1.lifetime = v[0].lifetime;
				o1.vertex = p1;
				o1.uv.xy = uv1;
				o1.wordPos = wp1;
				triStream.Append(o1);
				o1.vertex = p4;
				o1.uv.xy = uv4;
				o1.wordPos = wp4;
				triStream.Append(o1);
				o1.vertex = p3;
				o1.uv.xy = uv3;
				o1.wordPos = wp3;
				triStream.Append(o1);
				o1.vertex = p3;
				o1.uv.xy = uv3;
				o1.wordPos = wp3;
				triStream.Append(o1);
				o1.vertex = p1;
				o1.uv.xy = uv1;
				o1.wordPos = wp1;
				triStream.Append(o1);
				o1.vertex = p2;
				o1.uv.xy = uv2;
				o1.wordPos = wp2;
				triStream.Append(o1);
			}
		}
	ENDCG
	SubShader
	{
		Tags { "RenderType"="Transparent" "QUEUE"="transparent" }
		LOD 100
		ZWrite off
		Cull back
		blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
            #pragma geometry geomVBillboard
			#pragma fragment frag
      		#pragma multi_compile_fwdbase
			
			v2g vert (uint id : SV_VertexID)
			{
				v2g o;

				float4 worldpos = (float4(_particleDataBuffer[id].pos, 1) * _DeploySize) / 8;
				o.lifetime = ((_Time.y % _Duration) + (id * (_Duration / _totalCount))) % _Duration;
				worldpos.xyz += o.lifetime * _StartSpeed.xyz;
				float4 vertexOffset = float4(0, 0, 0, 0);
				float halfSize = _DeploySize / 2;
				vertexOffset.x = (abs(worldpos.x - _WorldSpaceCameraPos.x) > halfSize) ? (_DeploySize * floor((_WorldSpaceCameraPos.x - worldpos.x + halfSize) / _DeploySize)) : 0;
				vertexOffset.y = (abs(worldpos.y - _WorldSpaceCameraPos.y) > halfSize) ? (_DeploySize * floor((_WorldSpaceCameraPos.y - worldpos.y + halfSize) / _DeploySize)) : 0;
				vertexOffset.z = (abs(worldpos.z - _WorldSpaceCameraPos.z) > halfSize) ? (_DeploySize * floor((_WorldSpaceCameraPos.z - worldpos.z + halfSize) / _DeploySize)) : 0;
				
                o.vertex = worldpos + vertexOffset;
				return o;
			}
			fixed4 frag (g2f i) : SV_Target
			{
				clip(min(i.wordPos.y - _OceanHeight, _CloudHeight - i.wordPos.y));
				float alpha = tex2Dlod(_AlphaCurve, fixed4(i.lifetime / _Duration, 0, 0, 0)).r;
				float crossfade = max(abs(i.wordPos.x - _WorldSpaceCameraPos.x), abs(i.wordPos.y - _WorldSpaceCameraPos.y));
				crossfade = (_DeploySize / 2) - max(abs(i.wordPos.z - _WorldSpaceCameraPos.z), crossfade);
				crossfade = smoothstep(0, 1, crossfade);
				// float alpha = i.uv.x;
				fixed4 col = tex2Dlod(_MainTex, fixed4(i.uv.xy, 0, 0)) * _Color;
				col.a *= min(alpha, crossfade) * _rainVisibility * _AfterRainAmount;
				return col;
			}
			ENDCG
		}
	}
}
