Shader "Particles/bubbleShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", color) = (1, 1, 1, 1)
		_SpecularScale ("Specular Scale", Range(0,1)) = 0.02
		_SpecularSmoothness ("Specular Smoothness", Range(0,1)) = 0.1
		_RimScale ("Rim Scale", Range(0, 10)) = 1
        _density ("Density", range(0, 100)) = 10
		_Scale ("Scale", vector) = (1, 1, 1, 1)
		_DeploySize ("Deploy Size", range(8, 64)) = 16.0
		_Duration ("Duration", float) = 5
		_StartSpeed ("Start Speed", Vector) = (0, 0, 0, 0)
		_ShakeSpeed ("Shake Speed", Range(0, 128)) = 8
		_ShakeScale("Shake Scale", Range(0, 1)) = 0.5
		_AlphaCurve ("Alpha Curve", 2D) = "white" {}
		_totalCount ("Total Count", float) = 64
		_countPerBubble ("Count Per Bubble", float) = 4
	}
	CGINCLUDE
		#include "UnityCG.cginc"
		#include "AutoLight.cginc"
		#include "Lighting.cginc"

		struct v2g
		{
			float4 vertex : POSITION;
			float lifetime : LIFETIME;
			float scale : SCALE;
		};
		struct g2f
		{
			float4 vertex : SV_POSITION;
			float lifetime : LIFETIME;
            float2 uv: TEXCOORD0;
            float3 worldPos: TEXCOORD1;
			float3 worldViewDir: TEXCOORD2;
			float3 worldUp: TEXCOORD3;
			float3 worldLeft: TEXCOORD4;
		};
		struct particleData
		{
			float3 pos;
			float3 offsetDir;
		};

		StructuredBuffer<particleData> _particleDataBuffer;
		sampler2D _MainTex;
		float4 _MainTex_ST;
		sampler2D _AlphaCurve;
		float4 _Color;
		float _SpecularScale;
		float _SpecularSmoothness;
		float _RimScale;
		float _OceanHeight;
		float _density;
		float4 _Scale;
		float _DeploySize;
		float _Duration;
		float4 _StartSpeed;
		float _ShakeSpeed;
		float _ShakeScale;
		float _totalCount;
		float _countPerBubble;

		[maxvertexcount(6)]
		void geomBillboard(point v2g v[1], inout TriangleStream<g2f> triStream) {
			float4 clipPos = UnityObjectToClipPos(v[0].vertex);
			if (clipPos.z > 0)
			{
				g2f o1;

				float3 worldPos = v[0].vertex.xyz;
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				float3 left = normalize(cross(fixed3(0, 1, 0), worldViewDir));
				float3 up = normalize(cross(worldViewDir, left));
				// float3 up = fixed3(0, 1, 0);

				float3 wp1 = worldPos + v[0].scale * (_Scale.x * left + _Scale.y * up);
				float3 wp2 = worldPos + v[0].scale * (_Scale.x * left - _Scale.y * up);
				float3 wp3 = worldPos + v[0].scale * (-_Scale.x * left - _Scale.y * up);
				float3 wp4 = worldPos + v[0].scale * (-_Scale.x * left + _Scale.y * up);
				float4 p1 = UnityObjectToClipPos(wp1);
				float4 p2 = UnityObjectToClipPos(wp2);
				float4 p3 = UnityObjectToClipPos(wp3);
				float4 p4 = UnityObjectToClipPos(wp4);
				float2 uv1 = fixed2(-1, 1);
				float2 uv2 = fixed2(-1, -1);
				float2 uv3 = fixed2(1, -1);
				float2 uv4 = fixed2(1, 1);
				// o1.uv = v[0].uv;
				// o1.uv2 = v[0].uv2;
				o1.lifetime = v[0].lifetime;
				o1.worldViewDir = worldViewDir;
				o1.worldUp = up;
				o1.worldLeft = left;
				o1.vertex = p1;
				o1.uv.xy = uv1;
				o1.worldPos = wp1;
				triStream.Append(o1);
				o1.vertex = p4;
				o1.uv.xy = uv4;
				o1.worldPos = wp4;
				triStream.Append(o1);
				o1.vertex = p3;
				o1.uv.xy = uv3;
				o1.worldPos = wp3;
				triStream.Append(o1);
				o1.vertex = p3;
				o1.uv.xy = uv3;
				o1.worldPos = wp3;
				triStream.Append(o1);
				o1.vertex = p1;
				o1.uv.xy = uv1;
				o1.worldPos = wp1;
				triStream.Append(o1);
				o1.vertex = p2;
				o1.uv.xy = uv2;
				o1.worldPos = wp2;
				triStream.Append(o1);
			}
		}
	ENDCG
	SubShader
	{
		Tags { "RenderType"="Transparent" "QUEUE"="transparent" }
		LOD 100
		ZWrite on
		Cull back
		blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
            #pragma geometry geomBillboard
			#pragma fragment frag
      		#pragma multi_compile_fwdbase
			
			v2g vert (uint id : SV_VertexID)
			{
				v2g o;

				float4 worldpos = (float4(_particleDataBuffer[id].pos, 1) * _DeploySize) / 8;
				o.lifetime = ((_Time.y % _Duration) + (floor(id / _countPerBubble) * (_Duration / _totalCount))) % _Duration;
				worldpos.xyz += o.lifetime * _StartSpeed.xyz;
				float4 vertexOffset = float4(0, 0, 0, 0);
				float halfSize = _DeploySize / 2;
				vertexOffset.x = (abs(worldpos.x - _WorldSpaceCameraPos.x) > halfSize) ? (_DeploySize * floor((_WorldSpaceCameraPos.x - worldpos.x + halfSize) / _DeploySize)) : 0;
				vertexOffset.y = (abs(worldpos.y - _WorldSpaceCameraPos.y) > halfSize) ? (_DeploySize * floor((_WorldSpaceCameraPos.y - worldpos.y + halfSize) / _DeploySize)) : 0;
				vertexOffset.z = (abs(worldpos.z - _WorldSpaceCameraPos.z) > halfSize) ? (_DeploySize * floor((_WorldSpaceCameraPos.z - worldpos.z + halfSize) / _DeploySize)) : 0;
				
				float idMod = (id % _countPerBubble);
				o.scale = 0.1 + (idMod + 1) * 0.15;
                o.vertex = worldpos + vertexOffset;
				o.vertex.xz += (abs((((_Time.y * _ShakeSpeed) % 4) - 2)) - 1) * ((idMod % 2) - 0.5) * _Scale.x * _particleDataBuffer[id].offsetDir.xz * _ShakeScale;
				return o;
			}
			fixed4 frag (g2f i) : SV_Target
			{
				clip(_OceanHeight - i.worldPos.y);
				clip(1 - length(i.uv.xy));

				float3 bump = float3(i.uv, 1);
                bump.z = sqrt(1.0 - pow(bump.x, 2) - pow(bump.y, 2));
				bump = -bump.x * i.worldLeft + bump.y * i.worldUp + bump.z * i.worldViewDir;

				fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
				fixed rim = _RimScale * (1 - dot(bump, worldViewDir));

				fixed3 worldHalfDir = normalize(worldLightDir + worldViewDir);
				fixed spec = dot(bump, worldHalfDir);
				fixed specular = lerp(0,1,smoothstep(-_SpecularSmoothness,_SpecularSmoothness,spec+_SpecularScale-1)) * step(0.001,_SpecularScale);

				float crossfade = max(abs(i.worldPos.x - _WorldSpaceCameraPos.x), abs(i.worldPos.y - _WorldSpaceCameraPos.y));
				crossfade = (_DeploySize / 2) - max(abs(i.worldPos.z - _WorldSpaceCameraPos.z), crossfade);
				crossfade = smoothstep(0, 1, crossfade);
				// float alpha = i.uv.x;

				// fixed4 glow = fixed4(_Color.rgb, _Color.a * rim);
				fixed4 glow = _Color * rim;
				fixed4 col = glow + _LightColor0 * specular;

				float alpha = tex2Dlod(_AlphaCurve, fixed4(i.lifetime / _Duration, 0, 0, 0)).r;

				col.a *= min(alpha, crossfade);
				return col;
			}
			ENDCG
		}
	}
}
