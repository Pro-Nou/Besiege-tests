Shader "Blit/getDepthShader"
{
	CGINCLUDE
	inline float3 m_DecodeViewNormalStereo(float4 enc4)
	{
		// float kScale = 1;
		// float3 nn = enc4.xyz * float3(2 * kScale, 2 * kScale, 0) + float3(-kScale, -kScale, 1);
		// float g = 2.0 / dot(nn.xyz, nn.xyz);
		// float3 n;
		// n.xy = g * nn.xy;
		// n.z = g - 1;
		// return n;
		float3 n = float3((enc4.xy * 2) - 1, 1);
		n.z = sqrt(1 - dot(n.xy, n.xy));
		return n;
	}
	inline float m_DecodeFloatRG(float2 rg)
	{
		float encodeFactor = 255;
		float depth = (rg.r * encodeFactor + rg.g) / encodeFactor;
		return depth;
	}
	inline float2 m_EncodeFloatRG(float depth)
	{
		float encodeFactor = 255;
		float depth255 = depth * encodeFactor;
		float depthMod = depth255 % 1;
		float2 rg = float2((depth255 - depthMod) / encodeFactor, depthMod);
		return rg;
	}
	ENDCG
	SubShader
	{
		//get depthTexture
		Pass
		{
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
      		#include "UnityCG.cginc"
					
			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv  : TEXCOORD0;
			};

			sampler2D _MainTex;
			v2f vert(appdata_img v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv.xy = v.texcoord.xy;
				return o;
			}
			
			float4 frag(v2f i) : SV_Target
			{
				return tex2Dlod(_MainTex, float4(i.uv, 0, 0));
			}
			ENDCG
		}
		//SSR compute
		Pass
		{
			Tags{"LightMode"="Deferred"}
			ZTest off
			Cull Off
			ZWrite on
			Fog{ Mode Off }
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
      		#include "UnityCG.cginc"
			
			sampler2D _MainCameraOceanDepth;
			float4 _MainCameraOceanDepth_TexelSize;
			sampler2D _MainCameraOceanNormal;
			float4 _MainCameraOceanNormal_TexelSize;
			sampler2D _MainCameraRGBAMap;
			float4 _MainCameraRGBAMap_TexelSize;

			samplerCUBE _MainCameraReflProbe;
			sampler2D _SSRMaskTex;
			float _SSRMaskScale;
			float4 _SSRMaskTex_ST;
			float _SSRPixelBias;
			float _SSRPixelThickness;
			float _SSRCrossFadeDistance;
			float _SSRQuality;
			float _SSRDistance;
			float _SSRMaxStep;
			
			float4x4 _MainWorldToCamera;
			float4x4 _MainCameraToWorld;
			float4x4 _MainCameraProjection;
			float4x4 _MainCameraInvProjection;
					
			struct v2f
			{
				float4 pos : SV_POSITION;
				float4 uv  : TEXCOORD0;
			};

			v2f vert(appdata_img v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv.xy = v.texcoord.xy;
				o.uv.zw = v.texcoord.xy;
				o.uv.w = 1 - o.uv.w;
		
				return o;
			}
			fixed2 WorldToScreenPos(fixed3 pos){
                //pos = normalize(pos - _WorldSpaceCameraPos) * _ProjectionParams.z + _WorldSpaceCameraPos;
                // fixed3 toCam = 2 * mul(unity_WorldToCamera, float4(pos, 1)).xyz;
                fixed3 toCam = 2 * mul(_MainWorldToCamera, float4(pos, 1)).xyz;
                // fixed height = toCam.z / unity_CameraProjection._m11;
                fixed height = toCam.z / _MainCameraProjection._m11;
                fixed width = _ScreenParams.x / _ScreenParams.y * height;
                float2 uv = (float2(toCam.x / width, toCam.y / height) + 1) / 2;
                // float2 uv = 0;
                // uv.x = 2 * toCam.x / width;
                // uv.y = 2 * toCam.y / height;
				// uv = (uv + 1) / 2;
                return uv;
            }
			float3 getCross(float3 pos1, float3 dir1, float3 pos2, float3 dir2)
			{
				float a = dir1.x;
				float b = -dir2.x;
				float c = pos2.x - pos1.x;
				float d = dir1.y;
				float e = -dir2.y;
				float f = pos2.y - pos1.y;
				float l = (a*f - d*c)/(a*e - b*d);
				return l * dir2 + pos2;
			}
			float4 tex2DBlurLod(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn, float blurScaleIn)
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
			float4 frag(v2f i) : SV_Target
			{
				// return float4(1, 0, 0, 1);
				fixed4 packedSSROffset = tex2Dlod(_SSRMaskTex, float4((_ScreenParams.xy / 256) * i.uv.xy,0,0));
      			fixed3 SSROffset = float3(packedSSROffset.xy * 2 - 1, 1);
                SSROffset.z = sqrt(1.0 - saturate(dot(SSROffset.xy, SSROffset.xy)));
				
                float3 viewNormal = (tex2Dlod(_MainCameraOceanNormal, float4(i.uv.xy, 0, 0)).xyz) * 2 - 1;
                // float depth = DecodeFloatRG(tex2Dlod(_MainCameraOceanDepth, float4(i.uv.xy, 0, 0)).xy);
				// if (depth >= _SSRDistance || depth <= 0)
				// {
				// 	return fixed4(0, 0, 0, 0);
				// }
				// depth /= _SSRDistance;

                float depth = m_DecodeFloatRG(tex2Dlod(_MainCameraOceanDepth, float4(i.uv.xy, 0, 0)).xy);
				if (depth >= 1)
				{
					return fixed4(0, 0, 0, 0);
				}
                // float depth = (tex2Dlod(_MainCameraOceanDepth, float4(i.uv.xy, 0, 0)).x - 1);
				
				
				float2 ndcPos = i.uv.xy * 2 - 1;
				float3 clipVec = float3(ndcPos.x, ndcPos.y, -1);
				// float3 viewVec = mul(unity_CameraInvProjection, clipVec.xyzz).xyz;
				float3 viewVec = mul(_MainCameraInvProjection, clipVec.xyzz).xyz;
				// float3 viewPos = viewVec * _ProjectionParams.z * depth; 
				float3 viewPos = viewVec * _SSRDistance * depth; 

				// float3 worldPos = mul(unity_CameraToWorld, float4(viewPos, 1)).xyz;
				float3 worldPos = mul(_MainCameraToWorld, float4(viewPos, 1)).xyz;
				float3 worldViewDir = normalize(_WorldSpaceCameraPos.xyz - worldPos);
				// return float4(viewNormal, 1);

                float3 reflViewDir = reflect(normalize(viewVec), normalize(viewNormal));
				// return float4(reflDir, 1);
				reflViewDir +=  SSROffset * _SSRMaskScale;
				float3 reflViewPos = viewPos + reflViewDir;
				reflViewPos = reflViewPos.z < 0.5 * 0.3 ? viewPos + reflViewDir * ((viewPos.z - 0.5 * 0.3) / (viewPos.z - reflViewPos.z)) : reflViewPos;
				reflViewPos *= 2;
                // fixed height = reflViewPos.z / unity_CameraProjection._m11;
                fixed height = reflViewPos.z / _MainCameraProjection._m11;
                fixed width = _ScreenParams.x / _ScreenParams.y * height;
                float2 reflUV = (float2(reflViewPos.x / width, reflViewPos.y / height) + 1) / 2;

                float2 srcReflDir = normalize(reflUV - i.uv.xy);
				// return float4(srcReflDir.xy, 0, 1);
				float2 absDepth_TexelSize = float2(abs(_MainCameraOceanDepth_TexelSize.x), abs(_MainCameraOceanDepth_TexelSize.y));

				
				// return float4(srcReflDir, 0, 1);

				// srcReflDir.x += abs(srcReflDir.x) < 0.0001 ? 0.0001 : 0;
				// srcReflDir.y += abs(srcReflDir.y) < 0.0001 ? 0.0001 : 0;
				// srcReflDir.x += abs(srcReflDir.x) < 0.0001 ? 0.0001 : 0;
				// srcReflDir += SSROffset.xy * _SSRMaskScale;

				bool xLarger = abs(srcReflDir.x) > abs(srcReflDir.y);
				srcReflDir /= xLarger ? abs(srcReflDir.x) : abs(srcReflDir.y);
				srcReflDir *= xLarger ? absDepth_TexelSize.x : absDepth_TexelSize.y;
				
				float reflLod = 7 - floor(_SSRQuality);
                float reflSampleLength = pow(2, reflLod);
                float2 reflSampleBase = i.uv.xy;
                float reflValid = false;
                float lastScrDepth = depth;
                float lastDepth = depth;
                float thisScrDepth = depth;
                float thisDepth = depth;
                // float SSRlength0 = length(worldPos - _WorldSpaceCameraPos.xyz);
				float SSRlength0 = length(viewPos);
                // float SSRlength0 = length(i.worldPos - _WorldSpaceCameraPos.xyz);
                float SSRcount = 0;
                while (reflLod >= 0 && SSRcount < _SSRMaxStep)
                {
                	float2 reflSamplePos = reflSampleBase + reflSampleLength * srcReflDir;
                	if (reflSamplePos.x > 1 || reflSamplePos.x < 0 || reflSamplePos.y > 1 || reflSamplePos.y < 0)
                	{
                		reflLod -= 1;
                		reflSampleLength /= 2;
                		continue;
                	}
                	float2 ndcPos0 = reflSamplePos.xy * 2 - 1;
                	float3 clipVec0 = float3(ndcPos0.x, ndcPos0.y, -1) * _SSRDistance;
                	// float3 viewVec0 = mul(unity_CameraInvProjection, clipVec0.xyzz).xyz;
                	float3 viewVec0 = mul(_MainCameraInvProjection, clipVec0.xyzz).xyz;
					float3 viewPos1 = getCross(viewPos, reflViewDir, float3(0, 0, 0), viewVec0);
                	float SSRlength1 = length(viewPos1 - viewPos) + SSRlength0;
                	float depth0 = viewPos1 / viewVec0;
                	if (depth0 < 0 || depth0 > 1)
                	{
                		break;
                	}
					
					// float screenDepth0 = DecodeFloatRG(tex2Dlod(_MainCameraOceanDepth, float4(reflSamplePos, 0, 0)).xy);
					float screenDepth0 = m_DecodeFloatRG(tex2Dlod(_MainCameraOceanDepth, float4(reflSamplePos, 0, reflLod)).xy);
					// float screenDepth0 = (tex2Dlod(_MainCameraOceanDepth, float4(reflSamplePos, 0, 0)).x - 1) / _SSRDistance;

                	if (screenDepth0 + reflSampleLength * _SSRPixelBias * SSRlength1 * 0.01 < depth0 && depth0 < screenDepth0 + reflSampleLength * max(abs(lastDepth - depth0), _SSRPixelThickness))
                	{
                		reflValid = (reflLod == 0);
                		thisScrDepth = screenDepth0;
                		thisDepth = depth0;
                		reflLod -= 1;
                		reflSampleLength /= 2;
                	}
                	else
                	{
                		reflSampleBase = reflSamplePos;
                		lastDepth = depth0;
                		lastScrDepth = screenDepth0;
                	}
                    SSRcount += 1;
                }
				float2 reflSamplefinal = reflSampleBase + reflSampleLength * srcReflDir;
                reflSampleBase = lerp(reflSamplefinal, reflSampleBase, (thisDepth - thisScrDepth)/(thisDepth - thisScrDepth + lastScrDepth - lastDepth));
                
                float reflLerpx = min(smoothstep(0, _SSRCrossFadeDistance * absDepth_TexelSize.x, reflSampleBase.x), smoothstep(1, 1 - _SSRCrossFadeDistance * absDepth_TexelSize.x, reflSampleBase.x));
                float reflLerpy = min(smoothstep(0, _SSRCrossFadeDistance * absDepth_TexelSize.y, reflSampleBase.y), smoothstep(1, 1 - _SSRCrossFadeDistance * absDepth_TexelSize.y, reflSampleBase.y));
                
                fixed4 reflCol = lerp(fixed4(0, 0, 0, 0), tex2Dlod(_MainCameraRGBAMap, float4(reflSampleBase.x, reflSampleBase.y,0,0)), min(reflValid, min(reflLerpx, reflLerpy)));
            	// float4 reflEncoded = float4(floor(reflCol.r * 255) + (reflCol.g / 2), floor(reflCol.b * 255) + (reflCol.a / 2), 1, 1);
				// return reflDecoded;
				// return float4((reflCol.x << 16 + reflCol.y), (reflCol.z << 16 + reflCol.w), 1, 1);
				return reflCol;
				}
			ENDCG
		}
		//SSR last frame uv compute
		pass
		{
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
      		#include "UnityCG.cginc"

			float4x4 _MainWorldToCamera;
			float4x4 _MainCameraToWorld;
			float4x4 _MainCameraProjection;
			float4x4 _MainCameraInvProjection;
			sampler2D _MainCameraRGBAPre;
			float4 _MainCameraRGBAPre_TexelSize;
			sampler2D _MainCameraOceanDepth;
			float _SSRDistance;
			
			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv  : TEXCOORD0;
			};
			
			v2f vert(appdata_img v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv.xy = v.texcoord.xy;
		
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				float thisDepth = m_DecodeFloatRG(tex2Dlod(_MainCameraOceanDepth, float4(i.uv.xy, 0, 0)).xy);
				// float thisDepth = (tex2Dlod(_MainCameraOceanDepth, float4(i.uv.xy, 0, 0)).x - 1) / _SSRDistance;
				float2 thisNdcPos = i.uv.xy * 2 - 1;
				float3 thisClipVec = float3(thisNdcPos.x, thisNdcPos.y, -1);
				float3 thisViewVec = mul(_MainCameraInvProjection, thisClipVec.xyzz).xyz;
				float3 thisViewPos = thisViewVec * _SSRDistance * thisDepth;
				float3 thisWroldPos = mul(_MainCameraToWorld, float4(thisViewPos, 1)).xyz;
				// thisWroldPos = thisWroldPos - _WorldSpaceCameraPos.xyz;
				float3 lastViewVec = 2 * mul(_MainWorldToCamera, float4(thisWroldPos, 1)).xyz;
				// lastViewVec.z *= -1;
                fixed height = lastViewVec.z / _MainCameraProjection._m11;
                fixed width = _ScreenParams.x / _ScreenParams.y * height;
                float2 lastUV = float2(lastViewVec.x / width, lastViewVec.y / height);
				if (abs(lastUV.x) > 1 || abs(lastUV.y) > 1)
				{
					return fixed4(0, 0, 0, 0);
				}
				lastUV = (lastUV.xy + 1) / 2;
				fixed4 final = tex2Dlod(_MainCameraRGBAPre, float4(lastUV, 0, 0));
				// float4 final = float4(1, finalEncoded.x % 1, 1, finalEncoded.y % 1);
				// final.x = (finalEncoded.x - final.y) / 255;
				// final.z = (finalEncoded.z - final.w) / 255;
				// final.yw *= 2;
				return final;
			}
			ENDCG
		}
		//Hi-Z blur
		pass
		{
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			
			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv  : TEXCOORD0;
			};
			
			v2f vert(appdata_img v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv.xy = v.texcoord.xy;
		
				return o;
			}

			sampler2D _SourceDepthTexture;
			float4 _SourceDepthTexture_TexelSize;
			fixed4 frag(v2f i) : SV_Target
			{
				float2 samplerTexelSize = float2(abs(_SourceDepthTexture_TexelSize).x, abs(_SourceDepthTexture_TexelSize.y)) / 2;
				float depth1 = m_DecodeFloatRG(tex2Dlod(_SourceDepthTexture, float4(i.uv.xy + float2(1,1) * samplerTexelSize, 0, 0)).xy);
				float depth2 = m_DecodeFloatRG(tex2Dlod(_SourceDepthTexture, float4(i.uv.xy + float2(1,-1) * samplerTexelSize, 0, 0)).xy);
				float depth3 = m_DecodeFloatRG(tex2Dlod(_SourceDepthTexture, float4(i.uv.xy + float2(-1,-1) * samplerTexelSize, 0, 0)).xy);
				float depth4 = m_DecodeFloatRG(tex2Dlod(_SourceDepthTexture, float4(i.uv.xy + float2(-1,1) * samplerTexelSize, 0, 0)).xy);
				float depthFinal = min(min(depth1, depth2), min(depth3, depth4));
				return fixed4(m_EncodeFloatRG(depthFinal), 0, 1);
				// return fixed4(0, 0, 0, 0);
			}
			ENDCG
		}
		// voronoi
		pass
		{
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			
			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv  : TEXCOORD0;
			};
			
			v2f vert(appdata_img v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv.xy = v.texcoord.xy;
		
				return o;
			}

			inline float2 voronoi_noise_randomVector (float2 UV, float offset)
			{
				float2x2 m = float2x2(15.27, 47.63, 99.41, 89.98);
				UV = frac(sin(mul(UV, m)) * 46839.32);
				return float2(sin(UV.y*+offset)*0.5+0.5, cos(UV.x*offset)*0.5+0.5);
			}

			void Voronoi_float(float2 UV, float AngleOffset, float CellDensity, out float Out, out float Cells)
			{
				float2 g = floor(UV * CellDensity);
				float2 f = frac(UV * CellDensity);
				float t = 8.0;
				float3 res = float3(8.0, 0.0, 0.0);

				for(int y=-1; y<=1; y++)
				{
					for(int x=-1; x<=1; x++)
					{
						float2 lattice = float2(x,y);
						float2 offset = voronoi_noise_randomVector(lattice + g, AngleOffset);
						float d = distance(lattice + offset, f);
						if(d < res.x)
						{
							res = float3(d, offset.x, offset.y);
							Out = res.x;
							Cells = res.y;
						}
					}
				}
			}
			fixed4 frag(v2f i) : SV_Target
			{
				float noise;
				float cell;
				float noise0;
				float cell0;
				Voronoi_float(i.uv.xy, _Time.y, 10, noise, cell);
				Voronoi_float(i.uv.xy, 16 + _Time.x * 2, 10, noise0, cell0);
				float largeStep = smoothstep(0, noise, 0.5);
				float smallStep = smoothstep(0, noise0, 0.08);
				fixed final = smallStep * largeStep * cell - 0.3;
				return fixed4(final, 0, 0, 1);
				// return fixed4(step(noise, 0.03), 0, 0, 1);
				// return fixed4(noise, 0, 0, 0);
			}
			ENDCG
		}
		// grayToNormal
		pass
		{
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			
			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv  : TEXCOORD0;
			};
			
			sampler2D _VoronoiMap;
			float4 _VoronoiMap_TexelSize;
			v2f vert(appdata_img v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv.xy = v.texcoord.xy;
		
				return o;
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
				float3 tangent_u = float3(1, (crossSampler.y - crossSampler.x), 0);
				float3 tangent_v = float3(0, (crossSampler.w - crossSampler.z), 1);
				float3 normalOut = cross(normalize(tangent_u), normalize(tangent_v));
				return normalize(normalOut);
			}

			fixed4 frag(v2f i) : SV_Target
			{
				// return fixed4(tex2Dlod(_VoronoiMap, float4(i.uv.xy, 0, 0)).r,0,0,1);
				float3 normal = grayToNormal(_VoronoiMap, _VoronoiMap_TexelSize.xy, i.uv.xy);
				normal = (-normal + 1) / 2;
				return fixed4(normal.xz, 1, 1);
				// return fixed4(step(noise, 0.03), 0, 0, 1);
				// return fixed4(noise, 0, 0, 0);
			}
			ENDCG
		}
	}
}
