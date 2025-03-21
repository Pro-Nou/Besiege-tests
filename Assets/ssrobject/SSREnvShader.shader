﻿Shader "Unlit/SSREnvShader"
{
//  _IceMap ("Ice Map", 2D) = "cyan" { }
//  _FreezeAmount ("Freeze Amount", Range(0.000000,1.000000)) = 0.000000
//  _BloodMap ("Blood Map", 2D) = "" { }
//  _BloodColor ("Blood Color", Color) = (1.000000,0.000000,0.000000,1.000000)
//  _BloodAmount ("Blood Amount", Range(0.000000,1.000000)) = 0.000000
//  _DamageMap ("Damage Map", 2D) = "white" { }
//  _DamageAmount ("Damage Amount", Range(0.000000,1.000000)) = 0.000000
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1,1,1,1)

 		_EmissMap ("Emiss Map", 2D) = "black" { }
		_EmissCol ("Emiss Color", Color) = (0.0,0.0,0.0,1.0)
		
		_RimColor ("Rim Color", Color) = (0.0,0.0,0.0,1.0)

		// [KeywordEnum(On, Off)]_SSREnable ("SSR Enable", Float) = 0
		[KeywordEnum(normal, bump )]_NormalType ("Normal Type", Float) = 0
		_NormalMap ("Normal Map", 2D) = "" { }
		_NormalScale ("Normal Scale", Range(0, 1)) = 0.0
		[KeywordEnum(on, off )]_RcvRain ("Rcv Rain", Float) = 0
		_Metallic ("Metallic", Range(0,1)) = 0
		_Smoothness ("Smoothness", Range(0,1)) = 0
		_ClearCoatAmount ("Clear Coat Amount", Range(0, 1)) = 0
		_Cutoff  ("Alpha Cutoff" , Range(0 , 1)) = 0.4
		
		_PondingCull  ("Ponding Cull" , Range(-1, 1)) = 0
		_PondingPower  ("Ponding Power" , Range(0, 10)) = 0
		_RainClearCoat  ("Rain Clear Coat" , Range(0, 1)) = 0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" "QUEUE"="geometry" "IGNOREPROJECTOR"="true"}
		LOD 100

		Pass
		{	
			Tags{"LightMode"="ForwardBase" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" "RenderType"="Opaque"}
        	ZWrite on
            Cull back
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			#pragma multi_compile_fwdbase
			#pragma shader_feature _RCVRAIN_ON
			#pragma shader_feature _NORMALTYPE_NORMAL
			#pragma shader_feature _SSRENABLE_ON
			
			#include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "Lighting.cginc"

			float kusaiRand(float valueIn)
			{
				return frac(((valueIn * 11451.419198) + 10114.514191) % 9.810);
			}
			float pRand(float valueIn)
			{
				return (((valueIn * 12345.580078) + 18374.109289) % 8.759766);
				// return frac(sin(floor(valueIn)*12345.580078)*7658.759766);
			}
			float4 crossGraySample(sampler2D texIn, float2 texelSizeIn, float2 samplerPos)
			{
				float2 deltaU = float2(texelSizeIn.x, 0);
				float2 deltaV = float2(0, texelSizeIn.y);
				float h1_u = tex2Dlod(texIn, float4(samplerPos.xy - deltaU, 0, 0)).r;
				float h2_u = tex2Dlod(texIn, float4(samplerPos.xy, 0, 0)).r;
				float h1_v = tex2Dlod(texIn, float4(samplerPos.xy - deltaV, 0, 0)).r;
				float h2_v = tex2Dlod(texIn, float4(samplerPos.xy, 0, 0)).r;
				return float4(h1_u, h2_u, h1_v, h2_v);
			}
			float3 grayToNormal(sampler2D texIn, float2 texelSizeIn, float2 samplerPos)
			{
				float4 crossSampler = crossGraySample(texIn, texelSizeIn, samplerPos);
				float3 tangent_u = float3(1, (crossSampler.x - crossSampler.y), 0);
				float3 tangent_v = float3(0, (crossSampler.z - crossSampler.w), 1);
				float3 normalOut = cross(normalize(tangent_u), normalize(tangent_v));
				normalOut = normalOut.y < 0 ? -normalOut : normalOut;
				return normalize(normalOut);
			}
			
			fixed4 tex2DBlurLod(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn, float blurScaleIn)
			{
				float lod = blurScaleIn / 10;
				float2 blurDir1 = float2(abs(texelSizeIn.x), 0) * blurScaleIn;
				float2 blurDir2 = float2(0, abs(texelSizeIn.y)) * blurScaleIn;
				float4 colOut = tex2Dlod(texIn, float4(scrPosIn, 0, lod)) * 4;
				colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir1, 0, lod)) * 2;
				colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir2, 0, lod)) * 2;
				colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir1, 0, lod)) * 2;
				colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir2, 0, lod)) * 2;
				colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir1 + blurDir2, 0, lod));
				colOut += tex2Dlod(texIn, float4(scrPosIn + blurDir1 - blurDir2, 0, lod));
				colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir1 + blurDir2, 0, lod));
				colOut += tex2Dlod(texIn, float4(scrPosIn - blurDir1 - blurDir2, 0, lod));
				return colOut / 16;
			}
			fixed4 texCubeBlur(samplerCUBE texIn, float3 reflDirIn, float2 texelSizeIn, float blurIn)
            {
                float lod = blurIn / 10;
                fixed3 reflDir1 = fixed3(reflDirIn.z, 0, -reflDirIn.x);
                fixed3 reflDir2 = cross(reflDirIn, reflDir1);
            	float4 colOut = texCUBElod(texIn, float4(reflDirIn,lod)) * 4;
                colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * reflDir1,lod)) * 2;
                colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * reflDir1,lod)) * 2;
                colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * reflDir2,lod)) * 2;
                colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * reflDir2,lod)) * 2;
                colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * (reflDir1 + reflDir2),lod));
                colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * (reflDir1 + reflDir2),lod));
                colOut += texCUBElod(texIn, float4(reflDirIn + blurIn * texelSizeIn.x * (reflDir1 - reflDir2),lod));
                colOut += texCUBElod(texIn, float4(reflDirIn - blurIn * texelSizeIn.x * (reflDir1 - reflDir2),lod));
                return colOut / 16;
            }
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
				float4 scrPos : TEXCOORD1;
				// float3 worldPos : TEXCOORD2;
				SHADOW_COORDS(2)
				UNITY_FOG_COORDS(3)
				float4 uv2 : TEXCOORD4;
				float4 TtoW0 : TEXCOORD5;
				float4 TtoW1 : TEXCOORD6;
				float4 TtoW2 : TEXCOORD7;
				float3 worldPosOnlyRot : TEXCOORD8;
				float4 pos : SV_POSITION;
				// float3 normal : NORMAL;
				float depth : DEPTH;
			};

			sampler2D _CameraDepthTexture;
			samplerCUBE _MainCameraReflProbe;
			float4 _MainCameraReflProbe_TexelSize;
			sampler2D _MainCameraSSRMap;
			float4 _MainCameraSSRMap_TexelSize;
			sampler2D _MainCameraSSRTSpecMap;
			sampler2D _MainCameraSSRTDiffMap;

			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _EmissMap;
			float4 _EmissMap_ST;
			sampler2D _NormalMap;
			float4 _NormalMap_ST;
			float4 _NormalMap_TexelSize;
			sampler2D _RainDropMap;
			fixed4 _Color;
			sampler2D _RainDropNormalMap;
			sampler2D _VoronoiNormal;
			sampler2D _PondingMap;
			sampler2D _PondingMapCull;
			sampler2D _PondingWaveMap;
			sampler2D _RainMap;
			float4 _RainMap_ST;
			float4 _RainMap_TexelSize;
			fixed4 _EmissCol;
			fixed4 _BloodColor;

			fixed4 _RimColor;

			fixed _Cutoff;
			fixed _FreezeAmount;
			fixed _BloodAmount;
			fixed _DamageAmount;
			fixed _NormalScale;
			float4 _RainUVTile;
			float _RainDropScale;
			float _OceanHeight;
			float _rainVisibility;
			float _AfterRainAmount;
			float _RainDropDistortion;
			float4 _RainDropDistortionTile;
			float4 _PondingUVTile;
			float _PondingCull;
			float _PondingPower;
			float _RainClearCoat;

			float _MainCameraFarClipPlane;
			float _Metallic;
			float _Smoothness;
			float _ClearCoatAmount;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv.xy = TRANSFORM_TEX(v.uv, _MainTex);
				o.uv.zw = TRANSFORM_TEX(v.uv, _EmissMap);
				o.uv2.xy = float2(0, 0);
				o.uv2.zw = TRANSFORM_TEX(v.uv, _NormalMap);
				o.scrPos = ComputeScreenPos(o.pos);
				o.worldPosOnlyRot = mul((float3x3)unity_ObjectToWorld, v.vertex.xyz).xyz;

				// o.normal = UnityObjectToWorldNormal(v.normal);
				o.depth = -mul(UNITY_MATRIX_MV, v.vertex).z *_ProjectionParams.w;
                // o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;

				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				float3 worldNormal = UnityObjectToWorldNormal(normalize(v.normal));
                float3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
                float3 worldBinormal = cross(worldNormal, worldTangent) * v.tangent.w;

                o.TtoW0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
                o.TtoW1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
                o.TtoW2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				UNITY_TRANSFER_FOG(o,o.pos);
				TRANSFER_SHADOW(o);
				return o;
			}

			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = _Color * tex2Dlod(_MainTex, float4(i.uv.xy, 0, 0));
				// col.a = max(col.a, 0.1);
				clip(col.a - _Cutoff);
				// sample the texture
				// fixed4 col = tex2D(_MainTex, i.uv);

				float3 bump = float3(0, 0, 1);
				#if _NORMALTYPE_NORMAL
				fixed4 packedNormal = tex2Dlod(_NormalMap, float4(i.uv2.zw,0,0));
                bump.xy = (packedNormal.xy * 2 - 1 ) * _NormalScale;
				#else
				float3 grayNormal = grayToNormal(_NormalMap, _NormalMap_TexelSize.xy, i.uv2.zw);
                bump.xy = grayNormal.xz * _NormalScale;
				#endif
                bump.z = sqrt(1.0 - saturate(dot(bump.xy, bump.xy)));

				float3 worldPos = float3(i.TtoW0.w, i.TtoW1.w, i.TtoW2.w);
				float3 worldNormal = normalize(float3(i.TtoW0.z, i.TtoW1.z, i.TtoW2.z));

				fixed rainSmooth = _Smoothness;
				fixed rainClearCoatAmount = _ClearCoatAmount;
				fixed rainMetallic = _Metallic;
				fixed ponding = 0;
				fixed3 normalRain = fixed3(0, 1, 0);
				#if _RCVRAIN_ON

				float2 worldNormalRot45 = float2(worldNormal.x * 0.707106 + worldNormal.z * 0.707106, worldNormal.x * 0.707106 - worldNormal.z * 0.707106);
				float3 worldPosRot45 = float3(i.worldPosOnlyRot.x * 0.707106 + i.worldPosOnlyRot.z * 0.707106, i.worldPosOnlyRot.y, i.worldPosOnlyRot.x * 0.707106 - i.worldPosOnlyRot.z * 0.707106);

				float3 absWorldNormal = saturate(abs(worldNormal) - 0.55);
				absWorldNormal = smoothstep(0, 0.1, absWorldNormal);
				float2 absWorldNormalRot45 = saturate(abs(worldNormalRot45) - 0.62);
				absWorldNormalRot45 = smoothstep(0, 0.1, absWorldNormalRot45);

				float2 rainDropNormal0 = tex2Dlod(_RainDropNormalMap, float4(_RainDropDistortionTile.xy * i.worldPosOnlyRot.xy,0,0)).xy;
				float2 rainDropNormal1 = tex2Dlod(_RainDropNormalMap, float4(_RainDropDistortionTile.xy * i.worldPosOnlyRot.zy,0,0)).xy;
				float2 rainDropNormal2 = tex2Dlod(_RainDropNormalMap, float4(_RainDropDistortionTile.xy * worldPosRot45.xy,0,0)).xy;
				float2 rainDropNormal3 = tex2Dlod(_RainDropNormalMap, float4(_RainDropDistortionTile.xy * worldPosRot45.zy,0,0)).xy;
				float2 offset0 = lerp(0, rainDropNormal0, absWorldNormal.z).xy;
				float2 offset1 = lerp(0, rainDropNormal1, absWorldNormal.x).xy;
				float2 offset2 = lerp(0, rainDropNormal2, absWorldNormalRot45.y).xy;
				float2 offset3 = lerp(0, rainDropNormal3, absWorldNormalRot45.x).xy;
				float2 offsetFinal = (offset0 + offset1 + offset2 + offset3) / 2;
				float2 uvOffset = float2((offsetFinal.x * 2 - 1) * _RainDropDistortion, _Time.x * 8);

				float4 col0 = tex2Dlod(_RainDropMap, float4(i.worldPosOnlyRot.xy * _RainUVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float4 col1 = tex2Dlod(_RainDropMap, float4(i.worldPosOnlyRot.zy * _RainUVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float4 col2 = tex2Dlod(_RainDropMap, float4(worldPosRot45.xy * _RainUVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float4 col3 = tex2Dlod(_RainDropMap, float4(worldPosRot45.zy * _RainUVTile.xy + uvOffset, 0, 0)) * 2 - 1;
				float2 Value0 = lerp(0, col0, absWorldNormal.z).xy;
				float2 Value1 = lerp(0, col1, absWorldNormal.x).xy;
				float2 Value2 = lerp(0, col2, absWorldNormalRot45.y).xy;
				float2 Value3 = lerp(0, col3, absWorldNormalRot45.x).xy;
				float3 streak0 = (float3((Value0 + Value1 + Value2 + Value3) / 2, 1));
				// float3 streak0 = (float3(Value0 + Value1, 1));

				float shouldRainDrop = (worldPos.y > _OceanHeight);
				streak0.xy *= shouldRainDrop * _RainDropScale * _rainVisibility;
				streak0 = normalize(streak0);

				ponding = tex2Dlod(_PondingMap, float4(worldPos.xz * _PondingUVTile.xy, 0, 0)).r - _PondingCull - tex2Dlod(_PondingMapCull, float4(worldPos.xz * _PondingUVTile.zw, 0, 0)).r;
				ponding = smoothstep(0.9, 1, worldNormal.y) * shouldRainDrop * _AfterRainAmount * saturate(ponding);
				// return fixed4(ponding > 0.2,0,0,1);
				
				float3 rainDropVoronoi = float3(tex2Dlod(_VoronoiNormal, float4(_RainUVTile.zw * i.worldPosOnlyRot.xz ,0,0)).xy * 2 - 1, 1);
				rainDropVoronoi.z = sqrt(1.0 - saturate(dot(rainDropVoronoi.xy, rainDropVoronoi.xy)));
				rainDropVoronoi.xy *=  max(0, worldNormal.y) * shouldRainDrop * _AfterRainAmount * _RainDropScale * smoothstep(0.2, 0, ponding);
				rainDropVoronoi = normalize(rainDropVoronoi);

				rainSmooth = (rainDropVoronoi.z < 0.99 || streak0.z < 0.99) ? 0 : _Smoothness;
				rainClearCoatAmount = max(_RainClearCoat * shouldRainDrop * _AfterRainAmount, rainClearCoatAmount);
				bump = bump.z < streak0.z ? bump : streak0;
				bump = bump.z < rainDropVoronoi.z ? bump : rainDropVoronoi;

				float2 rainUV = worldPos.xz;
				float pRandX = pRand(floor(rainUV.x));
				rainUV.y += pRandX;
				float rainTime = floor((_Time.y + pRandX + kusaiRand(floor(rainUV.y))) * 24);
				float rainRow = floor(rainTime / 4);
				float rainColum = rainTime - rainRow * 4;
				float2 rainUVMod = float2(floor(rainUV.x % 4), floor(rainUV.y % 4));
				rainUV = ((rainUV.xy - rainUVMod) + (float2(rainColum, 1 - rainRow))) / 4;
				normalRain = grayToNormal(_RainMap, _RainMap_TexelSize.xy, rainUV);
				normalRain = lerp(fixed3(0, 1, 0), normalRain, _rainVisibility);

				float3 pondingNormal = float3(tex2Dlod(_PondingWaveMap, float4(worldPos.xz * 0.1,0,0)).xy, 1);
				pondingNormal.xz = (pondingNormal.xy * 2 - 1) * 0.15;
				pondingNormal.y = sqrt(1.0 - saturate(dot(pondingNormal.xz, pondingNormal.xz)));
				normalRain = normalRain.y < pondingNormal.y ? normalRain : pondingNormal;
				// return fixed4(abs(normalRain.z) > 0.01, 0, 0, 1);
				
				#endif
				// bump = rainDropVoronoi;

                float2 offset = bump.xy * 100 * _MainCameraSSRMap_TexelSize.xy;
                float4 offsetScrPos = float4(offset * i.scrPos.z + i.scrPos.xy, i.scrPos.zw);
                float2 srcPosFrac = offsetScrPos.xy / offsetScrPos.w;
                float screenDepth = Linear01Depth(tex2Dlod(_CameraDepthTexture, float4(srcPosFrac, 0, 0)).r);
				srcPosFrac = screenDepth <= i.depth ? i.scrPos.xy / i.scrPos.w : srcPosFrac;

				bump = normalize(half3(dot(i.TtoW0.xyz, bump), dot(i.TtoW1.xyz, bump), dot(i.TtoW2.xyz, bump)));
				
                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				float3 reflDir = reflect(-worldViewDir, bump);
				// return float4(motionVector, 0, 1);

				bool shouldSSR = _ProjectionParams.y == 0.3 && _ProjectionParams.z == _MainCameraFarClipPlane;

                fixed3 worldHalfDir = normalize(worldLightDir + worldViewDir);
				fixed spec = dot(bump, worldHalfDir);
                // spec = isUnderWater ? -spec : spec;
				fixed clearCoatSmoothness = lerp(_Smoothness, 0.85, min(rainClearCoatAmount * 5, 1));
				fixed specSmoothness = lerp(0.0001, 0.5, 1 - clearCoatSmoothness);
				fixed specCularScale = lerp(0.0001, 0.1, 1 - clearCoatSmoothness);
				fixed specular = smoothstep(-specSmoothness, specSmoothness, spec+specCularScale-1);
				// fixed specularClearCoat = lerp(0,1,smoothstep(-0.001, 0.001, spec+0.002-1));

                fixed diffValue = dot(bump, worldLightDir);
				fixed rim = (1 - dot(bump, worldViewDir)) * (1 - rainSmooth);
				rim = saturate(-diffValue * rim);
				// fixed4 glow = rim * _RimColor * _LightColor0;
				fixed rcvShadow = SHADOW_ATTENUATION(i);
				specular *= rcvShadow;
				fixed pondingSpecular = rcvShadow * lerp(0,1,smoothstep(-0.05, 0.05, spec+0.0025-1)) * 0.75;
				// fixed pondingSpecular = rcvShadow * lerp(0,1,smoothstep(-0.0002, 0.0002, spec+0.0005-1));

				// return fixed4(rcvShadow, 0, 0, 1);

                diffValue = min(rcvShadow, saturate(diffValue));
                float3 lightCompute = (_LightColor0 * (diffValue + rim));

				fixed4 ssrtSpecCol = fixed4(0,0,0,1);
				fixed4 ssrtDiffCol = fixed4(0,0,0,1);
                fixed4 reflCol = fixed4(0,0,0,1);
				fixed4 reflPonding = fixed4(0,0,0,1);

				#if _SSRENABLE_ON
				float SSRRoughness = lerp(0, 7, (1 - clearCoatSmoothness));
                if (shouldSSR)
                {
					float2 pondingUV = (i.scrPos.xy + _MainCameraSSRMap_TexelSize.xy * 200 * i.scrPos.z * normalRain.xz) / i.scrPos.w;
					reflPonding = tex2Dlod(_MainCameraSSRMap, float4(pondingUV, 0, 0));
					reflPonding = lerp(texCUBElod(_MainCameraReflProbe, float4(reflect(-worldViewDir, normalRain), 0)), reflPonding, reflPonding.a);
                   
					ssrtSpecCol = tex2Dlod(_MainCameraSSRTSpecMap, float4(srcPosFrac, 0, 0));
					ssrtDiffCol = tex2Dlod(_MainCameraSSRTDiffMap, float4(srcPosFrac, 0, 0));
					// ssrtDiffCol *= (1 - rainMetallic);
                    // ssrtSpecCol.a = 1;
					reflCol = tex2DBlurLod(_MainCameraSSRMap, srcPosFrac, _MainCameraSSRMap_TexelSize, SSRRoughness);
                    // reflCol = lerp(texCUBElod(_MainCameraReflProbe, fixed4(reflDir, 0)), reflCol, reflCol.a);
					 reflCol = lerp(texCubeBlur(_MainCameraReflProbe, reflDir, _MainCameraReflProbe_TexelSize.xy, SSRRoughness), reflCol, reflCol.a);
                }
				else
				{
					// reflCol = texCUBElod(_MainCameraReflProbe, fixed4(reflDir, 0));
					reflPonding = texCUBElod(_MainCameraReflProbe, float4(reflect(-worldViewDir, normalRain), 0));
					reflCol = texCubeBlur(_MainCameraReflProbe, reflDir, _MainCameraReflProbe_TexelSize.xy, SSRRoughness);
				}
				#endif
                // fixed4 final = max(fixed4(0.1,0.1,0.1,1), col) * (reflCol * _ReflectAmount + fixed4(1, 1, 1, 1) * (1 - _ReflectAmount));
				// fixed4 final = col;
				// final = final * _ReflectAmount + col * (1 - _ReflectAmount);
				fixed4 emiss = _EmissCol * tex2Dlod(_EmissMap, float4(i.uv.zw, 0, 0));
				fixed4 final = col;
				// final = lerp(final, lerp(col * reflCol, reflCol, _ReflectPower), _ReflectAmount);
				// final *= (1 - rainMetallic);
				// fixed4 finalAmbient = final;
				final *= float4(lightCompute + UNITY_LIGHTMODEL_AMBIENT.rgb + ssrtDiffCol.rgb, 1);
				// reflCol *= rainMetallic;
				// fixed fresnel = (1 - _Smoothness) + (_Smoothness) * pow((1 - dot(-worldViewDir, worldNormal)), 5);
				final = lerp(final, reflCol * col * (1 - rainClearCoatAmount), rainMetallic);
				fixed4 specCol = _LightColor0 * specular + ssrtSpecCol;
				fixed4 finalSpec = specCol * clearCoatSmoothness * (1 - rainClearCoatAmount) + specCol * rainClearCoatAmount;
				final += emiss;
				final += rainClearCoatAmount * reflCol + finalSpec;
				fixed4 pondingCol = reflPonding + specCol;
				final = lerp(final, pondingCol, saturate(ponding * _PondingPower));
				// fixed4 clearCoat = rainClearCoatAmount * (reflClearCoat + _LightColor0 * specularClearCoat);
				// apply fog
				UNITY_APPLY_FOG(i.fogCoord, final);
				return final;
			}
			ENDCG
		}
	}
	// Fallback "Diffuse"
	FallBack "Transparent/Cutout/VertexLit"
}
