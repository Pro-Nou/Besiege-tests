Shader "Unlit/glassReflect_old"
{
    Properties
    {
		[HeaderHelpURL(Rendering)]
		[Enum(UnityEngine.Rendering.CullMode)] _Culling ("Cull Mode", Int) = 2
		[Enum(Off,0,On,1)] _ZWrite("ZWrite", Int) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Int) = 4
		[Enum(Off,0,On,1)] _invY("inv Y", int) = 0

		[HeaderHelpURL(Blending)]
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc ("Blend mode Source", Int) = 5 // SrcAlpha
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendDst ("Blend mode Destination", Int) = 6 //OneMinusSrcAlpha

    	[NoScaleOffset]_SSRMaskTex ("SSR mask", 2D) = "white" {}
    	_SSRscale ("SSR Mask Scale", range(0, 0.1)) = 1
    	_SSRPixelBias ("SSR Pixel Bias", range(-0.0001, 0.0001)) = 0
    	_SSRPixelThickness ("SSR Pixel Thickness", range(-0.0001, 0.0001)) = 0
    	_SSRDistance ("SSR Distance", range(0, 128)) = 64
        _MainTex ("Main Tex", 2D) = "white" {}
        _BumpMap ("Normal Map", 2D) = "bump" {}
        _Cubemap ("Environment Cubemap", Cube) = "_Skybox" {}
        _BumpScale ("Bump Scale", range(0,1)) = 1
        _BlurScale ("Blur Scale", range(0,70)) = 0
        _EdgeScale ("Edge Scale", range(0,10)) = 1
		_SpecularScale ("Specular Scale", Range(0,1)) = 0.02
		_SpecularSmoothness ("Specular Smoothness", Range(0,1)) = 0.1
        _Distortion ("Distortion", Range(0, 100)) = 10
        _RefractAmount ("Refract Amount", Range(0.0, 1.0)) = 1.0
    }
    SubShader
    {
        // We must be transparent, so other objects are drawn before this one.
        Tags
        {
            "RenderType"="Opaque" "Queue"="Transparent" "LightMode" = "ForwardBase" 
        }

		Cull [_Culling]

		ZWrite [_ZWrite]
		ZTest [_ZTest]

		Blend [_BlendSrc] [_BlendDst]
		LOD 100
        // This pass grabs the screen behind the object into a texture.
        // We can access the result in the next pass as _RefractionTex

        GrabPass
        {
			Tags
			{
				"RenderType"="Opaque" "Queue"="Transparent"
			}
            "_RefractionTex"
        }
        Pass
        {
			Tags
			{
				"RenderType"="Opaque" "Queue"="Transparent"
			}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
      		#pragma multi_compile_fwdbase

            #include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "Lighting.cginc"

            sampler2D _MainTex;
            float4 _MainTex_ST;
            sampler2D _BumpMap;
            float4 _BumpMap_ST;
            samplerCUBE _Cubemap;
            float4 _Cubemap_TexelSize;
      		sampler2D _SSRMaskTex;
      		float4 _SSRMaskTex_ST;
      		float _SSRDistance;
      		float _SSRscale;
      		float _SSRPixelBias;
      		float _SSRPixelThickness;
            float _BumpScale;
            float _BlurScale;
            float _EdgeScale;
            float _Distortion;
            float _SpecularScale;
            float _SpecularSmoothness;
            float _invY;
            fixed _RefractAmount;
            sampler2D _RefractionTex;
            float4 _RefractionTex_TexelSize;
      		sampler2D _CameraDepthTexture;
            float4 _CameraDepthTexture_TexelSize;
            struct a2v
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord: TEXCOORD0;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float4 scrPos : TEXCOORD0;
                float4 uv : TEXCOORD1;
                float4 TtoW0 : TEXCOORD2;
                float4 TtoW1 : TEXCOORD3;
                float4 TtoW2 : TEXCOORD4;
        		float depth: DEPTH;
            };

            v2f vert(a2v v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);

                o.scrPos = ComputeScreenPos(o.pos);

                o.uv.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
                o.uv.zw = TRANSFORM_TEX(v.texcoord, _BumpMap);

                float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
                fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
                fixed3 worldBinormal = cross(worldNormal, worldTangent) * v.tangent.w;

                o.TtoW0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
                o.TtoW1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
                o.TtoW2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

        		o.depth = -mul(UNITY_MATRIX_MV, v.vertex).z * _ProjectionParams.w;

                return o;
            }

            fixed4 texCubeBlur(float3 reflDirIn)
            {
                float lod = _BlurScale / 10;
                fixed3 reflDir1 = fixed3(reflDirIn.z, 0, -reflDirIn.x);
                fixed3 reflDir2 = cross(reflDirIn, reflDir1);
            	fixed4 colOut = texCUBElod(_Cubemap, fixed4(reflDirIn,lod)) * 4;
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + _BlurScale * _Cubemap_TexelSize.x * reflDir1,lod)) * 2;
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - _BlurScale * _Cubemap_TexelSize.x * reflDir1,lod)) * 2;
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + _BlurScale * _Cubemap_TexelSize.x * reflDir2,lod)) * 2;
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - _BlurScale * _Cubemap_TexelSize.x * reflDir2,lod)) * 2;
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + _BlurScale * _Cubemap_TexelSize.x * (reflDir1 + reflDir2),lod));
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - _BlurScale * _Cubemap_TexelSize.x * (reflDir1 + reflDir2),lod));
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn + _BlurScale * _Cubemap_TexelSize.x * (reflDir1 - reflDir2),lod));
                colOut += texCUBElod(_Cubemap, fixed4(reflDirIn - _BlurScale * _Cubemap_TexelSize.x * (reflDir1 - reflDir2),lod));
                return colOut / 16;
            }
            fixed4 tex2DBlur(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn, float blurScaleIn)
            {
                float lod = blurScaleIn / 10;
                float2 blurDir1 = float2(abs(texelSizeIn.x), 0) * blurScaleIn;
                float2 blurDir2 = float2(0, abs(texelSizeIn.y)) * blurScaleIn;
            	fixed4 colOut = tex2Dlod(texIn, fixed4(scrPosIn, 0, lod)) * 4;
                colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1, 0, lod)) * 2;
                colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir2, 0, lod)) * 2;
                colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1, 0, lod)) * 2;
                colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir2, 0, lod)) * 2;
                colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1 + blurDir2, 0, lod));
                colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1 - blurDir2, 0, lod));
                colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1 + blurDir2, 0, lod));
                colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1 - blurDir2, 0, lod));
                return colOut / 16;
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
            fixed4 frag(v2f i) : SV_Target
            {
            	fixed4 packedSSROffset = tex2Dlod(_SSRMaskTex, float4((_ScreenParams.xy / 256) * (i.scrPos.xy / i.scrPos.w),0,0));
      			fixed3 SSROffset = fixed3(0,0,1);
      			SSROffset.xy = (packedSSROffset.xy * 2 - 1 );
      			SSROffset.z = sqrt(1.0 - saturate(dot(SSROffset.xy, SSROffset.xy)));
      			SSROffset = normalize(half3(dot(i.TtoW0.xyz, SSROffset), dot(i.TtoW1.xyz, SSROffset), dot(i.TtoW2.xyz, SSROffset)));
            	//return tex2Dlod(_MainTex, fixed4(i.uv.zw,0,0));
                float3 worldPos = float3(i.TtoW0.w, i.TtoW1.w, i.TtoW2.w);
                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
                float SSRlength0 = length(worldPos - _WorldSpaceCameraPos.xyz);

                // Get the normal in tangent space
                fixed4 packedNormal = tex2Dlod(_BumpMap, fixed4(i.uv.zw,0,0));
                fixed3 bump = fixed3(0,0,1);
                bump.xy = (packedNormal.xy * 2 - 1 ) * _BumpScale;
                bump.z = sqrt(1.0 - saturate(dot(bump.xy, bump.xy)));
                //fixed3 bump = UnpackNormal(tex2D(_BumpMap, i.uv.zw));

                // Compute the offset in tangent space
                float2 offset = bump.xy * _Distortion * 10 * _RefractionTex_TexelSize.xy;
                float4 offsetScrPos = float4(offset * i.scrPos.z + i.scrPos.xy, i.scrPos.zw);
                //i.scrPos.xy = offset * i.scrPos.z + i.scrPos.xy;

                fixed3 refrCol = tex2Dlod(_RefractionTex, float4(offsetScrPos.x / i.scrPos.w, abs(_invY - offsetScrPos.y / i.scrPos.w), 0, 0)).rgb;

                //float screenDepth = Linear01Depth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(offsetScrPos)).r);
                float screenDepth = Linear01Depth(tex2Dlod(_CameraDepthTexture, fixed4(offsetScrPos.xy / offsetScrPos.w, 0, 0)).r);
                float diff = screenDepth - i.depth;
                float intersect = 1 - smoothstep(0, _ProjectionParams.w * _EdgeScale, diff);
                refrCol = lerp(refrCol, tex2Dlod(_RefractionTex, fixed4(i.scrPos.xy / i.scrPos.w, 0, 0)).rgb, intersect);
                intersect = step(0, diff) * intersect;

                // Convert the normal to world space
                bump = normalize(half3(dot(i.TtoW0.xyz, bump), dot(i.TtoW1.xyz, bump), dot(i.TtoW2.xyz, bump)));

				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				fixed3 worldHalfDir = normalize(worldLightDir + worldViewDir);
				fixed4 spec = dot(bump, worldHalfDir);
				fixed4 specular = (1 - _RefractAmount) * fixed4(1,1,1,1) * _LightColor0 * lerp(0,1,smoothstep(-_SpecularSmoothness,_SpecularSmoothness,spec+_SpecularScale-1)) * step(0.001,_SpecularScale);

                //fixed4 texColor = tex2Dlod(_MainTex, fixed4(i.uv.xy,0,0));
                fixed3 reflDir = reflect(-worldViewDir, normalize(bump + SSROffset * _SSRscale));
                fixed3 reflWorldPos = worldPos + reflDir;
                float4 reflObjPos = mul(unity_WorldToObject, float4(reflWorldPos, 1));
                float4 reflClipPos = UnityObjectToClipPos(reflObjPos);
                float4 reflScrPos = ComputeScreenPos(reflClipPos);
                float2 srcReflDir = normalize((reflScrPos.xy / reflScrPos.w) - (i.scrPos.xy / i.scrPos.w));

                if (abs(srcReflDir.x) > abs(srcReflDir.y))
                {
                	srcReflDir /= abs(srcReflDir.x);
                	srcReflDir *= abs(_RefractionTex_TexelSize.x);
                }
                else
                {
                	srcReflDir /= abs(srcReflDir.y);
                	srcReflDir *= abs(_RefractionTex_TexelSize.y);
                }
                //return fixed4(srcReflDir.xy, 0, 1);

                float reflLod = 0;
                float reflSampleLength = pow(2, reflLod);
                float2 reflSampleBase = i.scrPos.xy / i.scrPos.w;
                float reflValid = false;
                float lastScrDepth = screenDepth;
                float lastDepth = i.depth;
                float thisScrDepth = screenDepth;
                float thisDepth = i.depth;
                while (reflLod >= 0)
                {
                	float2 reflSamplePos = reflSampleBase + reflSampleLength * srcReflDir;
                	if (reflSamplePos.x > 1 || reflSamplePos.x < 0 || reflSamplePos.y > 1 || reflSamplePos.y < 0)
                	{
                		reflLod -= 1;
                		reflSampleLength /= 2;
                		continue;
                	}
                	float2 ndcPos = reflSamplePos.xy * 2 - 1;
                	float3 clipVec = float3(ndcPos.x, ndcPos.y, -1) * _ProjectionParams.z;
                	float3 viewVec = mul(unity_CameraInvProjection, clipVec.xyzz).xyz;
                	float3 viewPos = viewVec * i.depth;
                	float3 worldPos0 = mul(unity_CameraToWorld, float4(viewPos, 1)).xyz;
                	float3 worldDir0 = normalize(worldPos0 - _WorldSpaceCameraPos.xyz);
                	float3 worldPos1 = getCross(worldPos, reflDir, _WorldSpaceCameraPos.xyz, worldDir0);
                	float SSRlength1 = length(worldPos1 - worldPos);
                	float3 viewPos1 = mul(unity_WorldToCamera, float4(worldPos1, 1)).xyz;
                	float depth0 = viewPos1 / viewVec;
                	if (depth0 < 0 || depth0 > 1 || SSRlength1 > _SSRDistance)
                	{
                		break;
                	}

                	float screenDepth0 = Linear01Depth(tex2Dlod(_CameraDepthTexture, fixed4(reflSamplePos, 0, reflLod)).r);
                	//float screenDepth0 = Linear01Depth(tex2DBlur(_CameraDepthTexture, reflSamplePos, _CameraDepthTexture_TexelSize, 0).r);
                	//if (screenDepth0 <= max(lastDepth, depth0) + _SSRMinOffset && screenDepth0 >= min(lastDepth, depth0) - _SSRMinOffset )
                	//if (screenDepth0 + _SSRPixelBias < depth0 && depth0 < screenDepth0 + _SSRPixelThickness)
                	if (screenDepth0 + _SSRPixelBias < depth0 && depth0 < screenDepth0 + max(abs(lastDepth - depth0), _SSRPixelThickness))
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
                }
                float2 reflSamplefinal = reflSampleBase + reflSampleLength * srcReflDir;
                reflSampleBase = lerp(reflSamplefinal, reflSampleBase, (thisDepth - thisScrDepth)/(thisDepth - thisScrDepth + lastScrDepth - lastDepth));

                //fixed4 reflCol = texCubeBlur(reflDir);
                fixed4 reflCol = lerp(texCubeBlur(reflDir), tex2Dlod(_RefractionTex, float4(reflSampleBase,0,0)), reflValid);


                fixed3 refrReflColor = reflCol.rgb * (1 - _RefractAmount) + refrCol * _RefractAmount;
                fixed3 finalColor = lerp(refrReflColor + specular.rgb, fixed3(1,1,1), intersect);
                //return fixed4(reflValid * fixed3(1,1,1), 1);
                return fixed4(finalColor, 1);

                //float4 ndcPos = (i.scrPos / i.scrPos.w) * 2 - 1;
                //float3 clipVec = float3(ndcPos.x, ndcPos.y, -1) * _ProjectionParams.z;
                //float3 viewVec = mul(unity_CameraInvProjection, clipVec.xyzz).xyz;
                //float3 viewPos = viewVec * i.depth;
                //float3 worldPos0 = mul(unity_CameraToWorld, float4(viewPos, 1)).xyz;

                //float3 viewPos1 = mul(unity_WorldToCamera, float4(worldPos0, 1)).xyz;
                //float depth1 = viewPos1 / viewVec;

                //float4 objPos0 = mul(unity_WorldToObject, float4(worldPos0, 1));
                //float4 clipPos0 = UnityObjectToClipPos(objPos0);
                //float4 scrPos0 = ComputeScreenPos(clipPos0);
                //return fixed4(reflScrPos.xyz, 1);
            }
            ENDCG
        }
    }
}