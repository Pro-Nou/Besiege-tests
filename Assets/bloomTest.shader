Shader "BloomEffect" {
 
	Properties
	{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_BlurMask("Blur Mask", 2D) = "white"{}
		_BlurTex("Blur", 2D) = "white"{}
		_BlurMaskScale ("Mask scale", Range(0,1)) = 1
		_BlurStrenth ("Blur strenth", Range(1,10)) = 1
		_BlurOffset ("Blur Offset", Range(1,10)) = 1
		_BlurSkip ("Blur skip", Range(1,10)) = 1
		_ThresHoldTex("Threshold Tex", 2D) = "white"{}
		_Threshold ("Threshold", Range(0,3)) = 0.3
		_ThresholdOffset ("Threshold Offset", Range(-3,3)) = 0
	}
		CGINCLUDE
#include "UnityCG.cginc"
 
	//用于阈值提取高亮部分
	struct v2f_threshold
	{
		float4 pos : SV_POSITION;
		float2 uv : TEXCOORD0;
	};
 
	//用于blur
	struct v2f_blur
	{
		float4 pos : SV_POSITION;
		float2 uv  : TEXCOORD0;
		//float4 uv01 : TEXCOORD1;
		//float4 uv23 : TEXCOORD2;
		//float4 uv45 : TEXCOORD3;
	};
 
	//用于bloom
	struct v2f_bloom
	{
		float4 pos : SV_POSITION;
		float2 uv  : TEXCOORD0;
		float2 uv1 : TEXCOORD1;
	};
 
	sampler2D _MainTex;
	float4 _MainTex_TexelSize;
	sampler2D _BlurTex;
	float4 _BlurTex_TexelSize;
	sampler2D _BlurMask;
	fixed4 _BlurMask_TexelSize;
	sampler2D _ThresHoldTex;
	fixed4 _ThresHoldTex_TexelSize;
	fixed _BlurMaskScale;
	fixed _BlurStrenth;
	fixed _BlurOffset;
	fixed _BlurSkip;
	float4 _offsets;
	float4 _colorThreshold;
	float4 _bloomColor;
	float _bloomFactor;
	float _Threshold;
	float _ThresholdOffset;

	fixed luminance(fixed4 color) 
 	{
 		return 0.2125 * color.r + 0.7154 * color.g + 0.0721 * color.b ;
 	}
 	fixed luminanceCheck(fixed4 color) 
 	{
 		return (color.r + color.g + color.b) /  3;
 	}
 	fixed luminanceCheck2(fixed4 color) 
 	{
 		return max(color.r, max(color.g, color.b));
 	}
	//高亮部分提取shader
	v2f_threshold vert_threshold(appdata_img v)
	{
		v2f_threshold o;
		o.pos = UnityObjectToClipPos(v.vertex);
		o.uv = v.texcoord.xy;
		//dx中纹理从左上角为初始坐标，需要反向
//#if UNITY_UV_STARTS_AT_TOP
//		if (_MainTex_TexelSize.y < 0)
//			o.uv.y = 1 - o.uv.y;
//#endif	
		return o;
	}
 
	fixed4 frag_threshold(v2f_threshold i) : SV_Target
	{
		//fixed4 color = tex2D(_MainTex, i.uv + float2(_offsets.x,0));
		fixed4 color = tex2D(_MainTex, i.uv);
		fixed4 colorCheck = fixed4(0,0,0,0);
		fixed4 final = fixed4(color.rgb,1);
		//仅当color大于设置的阈值的时候才输出
		//return (1,1,1,color.a);
		float _Toffet = _Threshold + _ThresholdOffset;
		if(luminanceCheck2(color) > _Threshold)
		{
			colorCheck = tex2D(_MainTex, i.uv + float2(_MainTex_TexelSize.x, 0));
			if(luminanceCheck2(colorCheck) <= _Toffet)
			{
				return final;
			}
			colorCheck = tex2D(_MainTex, i.uv + float2(-_MainTex_TexelSize.x, 0));
			if(luminanceCheck2(colorCheck) <= _Toffet)
			{
				return final;
			}
			colorCheck = tex2D(_MainTex, i.uv + float2(0, -_MainTex_TexelSize.y));
			if(luminanceCheck2(colorCheck) <= _Toffet)
			{
				return final;
			}
			colorCheck = tex2D(_MainTex, i.uv + float2(0, _MainTex_TexelSize.y));
			if(luminanceCheck2(colorCheck) <= _Toffet)
			{
				return final;
			}
		}
		//return colorCheck;
		//return colorCheck / count;
		return fixed4(0,0,0,0);
	}


		//高斯模糊 vert shader（上一篇文章有详细注释）
	v2f_blur vert_blur(appdata_img v)
	{
		v2f_blur o;
		//_offsets *= _MainTex_TexelSize.xyxy;
		o.pos = UnityObjectToClipPos(v.vertex);
		o.uv = v.texcoord.xy;
 	
		//o.uv01 = v.texcoord.xyxy + _offsets.xyxy * float4(1, 1, -1, -1);
		//o.uv23 = v.texcoord.xyxy + _offsets.xyxy * float4(1, 1, -1, -1) * 2.0;
		//o.uv45 = v.texcoord.xyxy + _offsets.xyxy * float4(1, 1, -1, -1) * 3.0;
 
		return o;
	}
 
	//高斯模糊 pixel shader（上一篇文章有详细注释）
	fixed4 frag_blur(v2f_blur i) : SV_Target
	{
		fixed2 maskTexelSize = fixed2(_BlurMask_TexelSize.x * (1 /_BlurMaskScale), _BlurMask_TexelSize.y * (1 / _BlurMaskScale));
		fixed2 maskTexelSize2 = fixed2(maskTexelSize.x * _BlurSkip, maskTexelSize.y * _BlurSkip);
		fixed2 maskSize = fixed2(1 / maskTexelSize.x, 1 / maskTexelSize.y);
		fixed2 loopOffset = fixed2(maskSize.x * _MainTex_TexelSize.x * _BlurOffset, maskSize.y * _MainTex_TexelSize.y * _BlurOffset);
		fixed strenthAVG = _BlurStrenth * 10 *  (pow(_BlurSkip, 2) / (maskSize.x * maskSize.y));
		fixed4 final = fixed4(0,0,0,0);
		for(fixed j = 0; j <= 1; j+=maskTexelSize2.x)
		{
			for(fixed k = 0; k <= 1; k+=maskTexelSize2.y)
			{
				final += strenthAVG * tex2D(_BlurMask, fixed2(j,k)).a * tex2D(_MainTex, i.uv + fixed2((j - 0.5) * loopOffset.x, (k - 0.5) * loopOffset.y));
			}
		}
		return final;
	}
 
	//Bloom效果 vertex shader
	v2f_bloom vert_bloom(appdata_img v)
	{
		v2f_bloom o;
		//mvp矩阵变换
		o.pos = UnityObjectToClipPos(v.vertex);
		//uv坐标传递
		o.uv.xy = v.texcoord.xy;
		o.uv1.xy = v.texcoord.xy;
		#if UNITY_UV_STARTS_AT_TOP
			if (_MainTex_TexelSize.y < 0)
				o.uv1.y = 1 - o.uv1.y;
		#endif	
		return o;
	}
 
	fixed4 frag_bloom(v2f_bloom i) : SV_Target
	{
		//取原始清晰图片进行uv采样
		//取模糊普片进行uv采样
		fixed4 input = tex2D(_MainTex, i.uv);
		fixed4 mask = tex2D(_ThresHoldTex, i.uv1);
		fixed4 blur = tex2D(_BlurTex, i.uv1);
		if(luminanceCheck2(mask) > _Threshold) 
		{
			return input;
		}
		//输出= 原始图像，叠加bloom权值*bloom颜色*泛光颜色
		return blur * blur + input;
	}
 
	ENDCG
 
	SubShader
	{
		//pass 0: 提取高亮部分
		Pass
		{
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
 
			CGPROGRAM
#pragma vertex vert_threshold
#pragma fragment frag_threshold
			ENDCG
		}
 
		//pass 1: 高斯模糊
		Pass
		{
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
 
			CGPROGRAM
#pragma vertex vert_blur
#pragma fragment frag_blur
			ENDCG
		}
 
		//pass 2: Bloom效果
		Pass
		{
 
			ZTest Off
			Cull Off
			ZWrite Off
			Fog{ Mode Off }
 
			CGPROGRAM
#pragma vertex vert_bloom
#pragma fragment frag_bloom
			ENDCG
		}
 
	}
	Fallback Off
}