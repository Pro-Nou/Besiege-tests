Shader "Custom/tessSurf" {
	Properties {
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc ("Blend mode Source", Int) = 5 // SrcAlpha
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendDst ("Blend mode Destination", Int) = 6 //OneMinusSrcAlpha

    	[NoScaleOffset]_SSRMaskTex ("SSR mask", 2D) = "white" {}
    	_SSRRoughness ("SSR Roughness", range(0, 0.02)) = 0
    	_SSRPixelBias ("SSR Pixel Bias", range(-0.0001, 0.0001)) = 0
    	_SSRPixelThickness ("SSR Pixel Thickness", range(-0.0001, 0.0001)) = 0
    	_SSRDistance ("SSR Distance", range(0, 128)) = 64
    	_SSRCrossFadeDistance("SSR Cross fade distance", range(0, 128)) = 32
    	_SSRQuality("SSR Quality", range(0, 7)) = 7
        _HeightMap ("Height Map", 2D) = "white" {}
    	_baseColor ("base color", Color) = (1.0,1.0,1.0,1.0)
        _BubbleMap ("Bubble Map", 2D) = "white" {}
        _BubbleMask ("Bubble Mask", 2D) = "white" {}
        _BumpMap ("Normal Map", 2D) = "bump" {}
        _Cubemap ("Environment Cubemap", Cube) = "_Skybox" {}
        _BumpScale ("Bump Scale", range(0,10)) = 1
        _EdgeScale ("Edge Scale", range(0,10)) = 1
        _density ("Density", range(0, 100)) = 10
		_SpecularScale ("Specular Scale", Range(0,1)) = 0.02
		_SpecularSmoothness ("Specular Smoothness", Range(0,1)) = 0.1
        _Distortion ("Distortion", Range(0, 100)) = 10
        _RefractAmount ("Refract Amount", Range(0.0, 1.0)) = 1.0

		_Tess ("Tessellation", Range(1,256)) = 4
		_TessMaxDist("Tessellation Max Distance", Range(1,1000)) = 128
		_TessMinDist("Tessellation Min Distance", Range(0.1, 10)) = 1
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_DispTex ("Disp Texture", 2D) = "gray" {}
		_NormalMap ("Normalmap", 2D) = "bump" {}
		_Displacement ("Displacement", Range(0, 1.0)) = 0.3
		_Color ("Color", color) = (1,1,1,0)
		_SpecColor ("Spec color", color) = (0.5,0.5,0.5,0.5)
	}
    CGINCLUDE
	#include "UnityCG.cginc"
    	fixed4 tex2DBlurLod(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn, float blurScaleIn)
        {
            float lod = blurScaleIn / 10;
            float2 blurDir1 = float2(abs(texelSizeIn.x), 0) * blurScaleIn;
            float2 blurDir2 = float2(0, abs(texelSizeIn.y)) * blurScaleIn;
          	fixed4 colOut = tex2Dlod(texIn, fixed4(scrPosIn, 0, lod)) * 4;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir2, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir2, lod, lod)) * 2;
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1 + blurDir2, lod, lod));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir1 - blurDir2, lod, lod));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1 + blurDir2, lod, lod));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1 - blurDir2, lod, lod));
            return colOut / 16;
        }
    	fixed4 tex2DBlur(sampler2D texIn, float2 scrPosIn, float2 texelSizeIn)
        {
            float2 blurDir1 = float2(abs(texelSizeIn.x), 0);
            float2 blurDir2 = float2(0, abs(texelSizeIn.y));
            fixed4 colOut = tex2Dlod(texIn, fixed4(scrPosIn + blurDir1, 0, 0));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn + blurDir2, 0, 0));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir1, 0, 0));
            colOut += tex2Dlod(texIn, fixed4(scrPosIn - blurDir2, 0, 0));
            return colOut / 4;
        }
	ENDCG
	SubShader {
		cull off
		Tags { "RenderType"="Opaque" "QUEUE"="alphatest+1"}
		Blend [_BlendSrc] [_BlendDst]
		LOD 100
        GrabPass
        {
            "_RefractionTex"
        }
		Pass
        {
        	Tags{"LightMode"="ForwardBase"}
        	ZWrite off
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
      		#pragma multi_compile_fwdbase

            #include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "Lighting.cginc"

            sampler2D _HeightMap;
            float4 _HeightMap_ST;
            sampler2D _BumpMap;
            float4 _BumpMap_ST;
            samplerCUBE _Cubemap;
            float4 _Cubemap_TexelSize;
      		sampler2D _SSRMaskTex;
      		float4 _SSRMaskTex_ST;

      		float _SSRDistance;
      		float _SSRRoughness;
      		float _SSRPixelBias;
      		float _SSRPixelThickness;
      		float _SSRCrossFadeDistance;
      		float _SSRQuality;
            float _BumpScale;
            float _Distortion;
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

                o.uv.xy = TRANSFORM_TEX(v.texcoord, _HeightMap);
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
            	//return fixed4(1,1,1,1);
            	fixed4 packedSSROffset = tex2Dlod(_SSRMaskTex, float4((_ScreenParams.xy / 256) * (i.scrPos.xy / i.scrPos.w),0,0));
      			fixed3 SSROffset = fixed3(0,0,1);
      			SSROffset.xy = (packedSSROffset.xy * 2 - 1 ) * _SSRRoughness;
      			SSROffset.z = sqrt(1.0 - saturate(dot(SSROffset.xy, SSROffset.xy)));

                fixed4 packedNormal = tex2Dlod(_BumpMap, fixed4(i.uv.zw,0,0));
                fixed3 bump = fixed3(0,0,1);
                bump.xy = (packedNormal.xy * 2 - 1 ) * _BumpScale;
                bump.z = sqrt(1.0 - saturate(dot(bump.xy, bump.xy)));
                bump = normalize(bump + SSROffset);
                bump = normalize(half3(dot(i.TtoW0.xyz, bump), dot(i.TtoW1.xyz, bump), dot(i.TtoW2.xyz, bump)));
                float3 worldPos = float3(i.TtoW0.w, i.TtoW1.w, i.TtoW2.w);
                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
                float screenDepth = Linear01Depth(tex2Dlod(_CameraDepthTexture, fixed4((i.scrPos.xy / i.scrPos.w), 0, 0)).r);

                fixed3 reflDir = reflect(-worldViewDir, bump);
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

                float reflLod = 7 - floor(_SSRQuality);
                float reflSampleLength = pow(2, reflLod);
                float2 reflSampleBase = i.scrPos.xy / i.scrPos.w;
                float reflValid = false;
                float lastScrDepth = screenDepth;
                float lastDepth = i.depth;
                float thisScrDepth = screenDepth;
                float thisDepth = i.depth;
                float SSRlength0 = length(worldPos - _WorldSpaceCameraPos.xyz);
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
                	float SSRlength1 = length(worldPos1 - worldPos) + SSRlength0;
                	float SSRlength2 = length(worldPos1 - _WorldSpaceCameraPos.xyz);
                	float3 viewPos1 = mul(unity_WorldToCamera, float4(worldPos1, 1)).xyz;
                	float depth0 = viewPos1 / viewVec;
                	if (depth0 < 0 || depth0 > 1 || SSRlength2 > _SSRDistance)
                	{
                		break;
                	}

                	float screenDepth0 = Linear01Depth(tex2Dlod(_CameraDepthTexture, fixed4(reflSamplePos, 0, reflLod)).r);
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
                }
                float2 reflSamplefinal = reflSampleBase + reflSampleLength * srcReflDir;
                reflSampleBase = lerp(reflSamplefinal, reflSampleBase, (thisDepth - thisScrDepth)/(thisDepth - thisScrDepth + lastScrDepth - lastDepth));
                float reflLerpx = min(smoothstep(0, _SSRCrossFadeDistance * _RefractionTex_TexelSize.x, reflSampleBase.x), smoothstep(1, 1 - _SSRCrossFadeDistance * _RefractionTex_TexelSize.x, reflSampleBase.x));
                float reflLerpy = min(smoothstep(0, _SSRCrossFadeDistance * abs(_RefractionTex_TexelSize.y), reflSampleBase.y), smoothstep(1, 1 - _SSRCrossFadeDistance * abs(_RefractionTex_TexelSize.y), reflSampleBase.y));

                fixed4 reflCol = lerp(texCUBElod(_Cubemap, fixed4(reflDir, 0)), tex2Dlod(_RefractionTex, float4(reflSampleBase,0,0)), min(reflValid, min(reflLerpx, reflLerpy)));
            	return fixed4(reflCol.rgb, 1);
            }
            ENDCG
        }
        GrabPass
        {
            "_ReflectionTex"
        }
		CGPROGRAM
		#pragma surface surf BlinnPhong addshadow fullforwardshadows vertex:vert nolightmap //tessellate:tessDistance 
		#pragma target 3.0
		#include "Tessellation.cginc"

		sampler2D _DispTex;
		float4 _DispTex_ST;
		sampler2D _MainTex;
		sampler2D _NormalMap;
		sampler2D _ReflectionTex;
		sampler2D _RefractionTex;

		float _Tess;
		float _TessMaxDist;
		float _TessMinDist;
		float _Displacement;
		struct appdata {
			float4 vertex : POSITION;
			float4 tangent : TANGENT;
			float3 normal : NORMAL;
			float2 texcoord : TEXCOORD0;
		};
		struct Input {
			float2 uv_MainTex;
			float2 uv_DispTex;
			float2 uv_NormalMap;
			float4 vertex;
			float4 screenPos;
		};
		float4 tessDistance (appdata v0, appdata v1, appdata v2) {
			return UnityDistanceBasedTess(v0.vertex, v1.vertex, v2.vertex, _TessMinDist, _TessMaxDist, _Tess);
		}
		// void disp (inout appdata v)
		// {
		// 	float d = tex2Dlod(_DispTex, float4(TRANSFORM_TEX(v.texcoord.xy, _DispTex),0,0)).r * _Displacement;
		// 	v.vertex.xyz += v.normal * d;
		// }
		void vert (inout appdata v, out Input o)
		{
			float d = tex2Dlod(_DispTex, float4(TRANSFORM_TEX(v.texcoord.xy, _DispTex),0,0)).r * _Displacement;
			v.vertex.xyz += v.normal * d;
			o.vertex = v.vertex;
			o.uv_MainTex = v.texcoord;
			o.uv_NormalMap = v.texcoord;
			o.uv_DispTex = v.texcoord;
			o.screenPos = ComputeScreenPos(UnityObjectToClipPos(v.vertex));
		}
		fixed4 _Color;
		void surf (Input IN, inout SurfaceOutput o) {
			//half4 c = tex2Dlod(_MainTex, float4(IN.uv_MainTex, 0, 0)) * _Color;
			//half4 c = tex2Dlod(_RefractionTex, float4(IN.uv_MainTex, 0, 0)) * _Color;
			//half4 c = half4(screenPos);
			//half4 c = half4(0,0,0,0);
			// half4 c = half4(IN.screenPos.xy / IN.screenPos.w, 0, 1);
			half4 c = tex2Dlod(_ReflectionTex, half4(IN.screenPos.xy / IN.screenPos.w, 0, 0));
			o.Albedo = c.rgb;
			o.Specular = 0.2;
			o.Gloss = 1.0;
			o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
		}
		ENDCG
	}
	//FallBack "Diffuse"
}
