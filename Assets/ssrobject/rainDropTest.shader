Shader "Unlit/rainDropTest"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_UVTile ("UV Tile", Vector) = (1,1,0,0)
		_NormalMap ("Normal Map", 2D) = "" {}
		_NormalScale ("Normal Scale", Range(0, 1)) = 0.0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" "LightMode"="ForwardBase"}
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			#pragma multi_compile_fwdbase
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
			};

			struct v2f
			{
				float4 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				// float3 worldPos : TEXCOORD2;
				// float3 worldNormal : TEXCOORD3;
				float4 TtoW0 : TEXCOORD2;
				float4 TtoW1 : TEXCOORD3;
				float4 TtoW2 : TEXCOORD4;
				float3 worldPosOnlyRot : TEXCOORD5;
				float4 pos : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _NormalMap;
			float4 _NormalMap_ST;
			float4 _UVTile;
			float _NormalScale;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv.xy = TRANSFORM_TEX(v.uv, _MainTex);
				o.uv.zw = TRANSFORM_TEX(v.uv, _NormalMap);

				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				float3 worldNormal = UnityObjectToWorldNormal(normalize(v.normal));
                float3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
                float3 worldBinormal = cross(worldNormal, worldTangent) * v.tangent.w;
				o.worldPosOnlyRot = mul((float3x3)unity_ObjectToWorld, v.vertex.xyz).xyz;

                o.TtoW0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
                o.TtoW1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
                o.TtoW2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
				UNITY_TRANSFER_FOG(o,o.pos);
				return o;
			}
			
			float4 crossGraySample(sampler2D texIn, float2 texelSizeIn, float2 samplerPos)
			{
				float2 deltaU = float2(texelSizeIn.x, 0);
				float2 deltaV = float2(0, texelSizeIn.y);
				float h1_u = tex2Dlod(texIn, float4(samplerPos.xy - deltaU, 0, 0)).r;
				float h2_u = tex2Dlod(texIn, float4(samplerPos.xy + deltaU, 0, 0)).r;
				float h1_v = tex2Dlod(texIn, float4(samplerPos.xy - deltaV, 0, 0)).r;
				float h2_v = tex2Dlod(texIn, float4(samplerPos.xy + deltaV, 0, 0)).r;
				return float4(h1_u, h2_u, h1_v, h2_v);
			}

			float3 grayToNormal(sampler2D texIn, float2 texelSizeIn, float2 samplerPos, float xzScale, float yScale)
			{
				float4 crossSampler = crossGraySample(texIn, texelSizeIn, samplerPos);
				float3 tangent_u = float3(texelSizeIn.x * xzScale, (crossSampler.y - crossSampler.x) * yScale, 0);
				float3 tangent_v = float3(0, (crossSampler.w - crossSampler.z) * yScale, texelSizeIn.y * xzScale);
				float3 normalOut = cross(normalize(tangent_u), normalize(tangent_v));
				normalOut.y *= -1;
				return normalize(normalOut);
			}

			fixed getStreak(float3 worldPos, float3 absWorldNormal, float2 uvOffset)
			{
				fixed4 col0 = tex2Dlod(_MainTex, float4(worldPos.xy * _UVTile.xy + uvOffset, 0, 0));
				fixed4 col1 = tex2Dlod(_MainTex, float4(worldPos.zy * _UVTile.xy + uvOffset, 0, 0));
				fixed Value0 = lerp(0, col0.r, absWorldNormal.z);
				fixed Value1 = lerp(0, col1.r, absWorldNormal.x);
				fixed streak = saturate(Value0 + Value1);
				return streak;
			}
			fixed4 frag (v2f i) : SV_Target
			{
				float3 worldPos = float3(i.TtoW0.w, i.TtoW1.w, i.TtoW2.w);
				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				worldPos = i.worldPosOnlyRot;
				float3 worldNormal = normalize(float3(i.TtoW0.z, i.TtoW1.z, i.TtoW2.z));
				float2 worldNormalRot45 = float2(worldNormal.x * 0.707106 + worldNormal.z * 0.707106, worldNormal.x * 0.707106 - worldNormal.z * 0.707106);
				float3 worldPosRot45 = float3(worldPos.x * 0.707106 + worldPos.z * 0.707106, worldPos.y, worldPos.x * 0.707106 - worldPos.z * 0.707106);
				// float3 worldTangent = normalize(float3(i.TtoW0.x, i.TtoW1.x, i.TtoW2.x));
				// float3 worldBiTangent = normalize(cross(worldNormal, worldTangent));
				
				fixed4 packedNormal = tex2Dlod(_NormalMap, fixed4(i.uv.zw,0,0));
				float3 unPackedNormal = float3(0, 0, 1);
                unPackedNormal.xy = (packedNormal.xy * 2 - 1 ) * _NormalScale;
                // unPackedNormal.z = sqrt(1.0 - saturate(dot(unPackedNormal.xy, unPackedNormal.xy)));
				// float3 bump = float3(0, 0, 1);
				// bump = normalize(half3(dot(i.TtoW0.xyz, bump), dot(i.TtoW1.xyz, bump), dot(i.TtoW2.xyz, bump)));

				// sample the texture
				float3 absWorldNormal = saturate(abs(worldNormal) - 0.5);
				float2 absWorldNormalRot45 = saturate(abs(worldNormalRot45) - 0.5);
				float2 uvOffset = unPackedNormal.xy + float2(0, _Time.x * 8);

				float4 col0 = tex2Dlod(_MainTex, float4(worldPos.xy * _UVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float4 col1 = tex2Dlod(_MainTex, float4(worldPos.zy * _UVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float4 col2 = tex2Dlod(_MainTex, float4(worldPosRot45.xy * _UVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float4 col3 = tex2Dlod(_MainTex, float4(worldPosRot45.zy * _UVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float2 Value0 = lerp(0, col0, absWorldNormal.z).xy;
				float2 Value1 = lerp(0, col1, absWorldNormal.x).xy;
				float2 Value2 = lerp(0, col2, absWorldNormalRot45.y).xy;
				float2 Value3 = lerp(0, col3, absWorldNormalRot45.x).xy;
				float3 streak0 = normalize(float3(Value0 + Value1 + Value2 + Value3, 1));

				streak0 = normalize(half3(dot(i.TtoW0.xyz, streak0), dot(i.TtoW1.xyz, streak0), dot(i.TtoW2.xyz, streak0)));
				fixed diffValue = dot(streak0, worldLightDir);
				diffValue = lerp(0.5,1,diffValue);
				// return fixed4(diffValue, 0, 0, 1);
				// fixed streak = streak1;
				// fixed streak = getStreak(worldPos, absWorldNormal, uvOffset);

				// float samplerScale = 0.1;
				// float3 worldPos1 = worldPos + worldTangent * samplerScale;
				// float3 worldPos2 = worldPos - worldTangent * samplerScale;
				// float3 worldPos3 = worldPos + worldBiTangent * samplerScale;
				// float3 worldPos4 = worldPos - worldBiTangent * samplerScale;

				// fixed streak1 = getStreak(worldPos1, absWorldNormal, uvOffset);
				// fixed streak2 = getStreak(worldPos2, absWorldNormal, uvOffset);
				// fixed streak3 = getStreak(worldPos3, absWorldNormal, uvOffset);
				// fixed streak4 = getStreak(worldPos4, absWorldNormal, uvOffset);

				
				// float3 tangent_u = float3(samplerScale * 2, 0, streak1 - streak2);
				// float3 tangent_v = float3(streak3 - streak4, 0, samplerScale * 2);
				// float3 streakBump = normalize(cross(normalize(tangent_v), normalize(tangent_u)));
				// streakBump.z *= -1;

				return fixed4(fixed3(1,1,1) * diffValue, 1);
			}
			ENDCG
		}
	}
}
