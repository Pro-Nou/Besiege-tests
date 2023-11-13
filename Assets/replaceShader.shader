Shader "Hidden/Bloom Replace" 
{
	//替换标签是Bloom的shader
    SubShader
	{
        Tags {"QUEUE"="Transparent" "RenderType" = "Bloom" }
        Blend  SrcAlpha OneMinusSrcAlpha 
		Cull back 
		Lighting Off 
		ZTest less
		ZWrite on
		Fog{ Mode Off }
        Pass {
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			#pragma fragmentoption ARB_precision_hint_fastest
			#include "UnityCG.cginc"
 
			//uniform sampler2D _BloomTex;
 			sampler2D _BloomTex;
			half4 _BloomColor;
			half4 frag(v2f_img i) : COLOR
			{
				//return tex2D(_BloomTex,i.uv);
				return _BloomColor * tex2D(_BloomTex,i.uv);
			}
			ENDCG
        } 
    }
 
	//替换标签是BloomTransparent的shader
	SubShader
	{
		Tags{"QUEUE"="Transparent" "RenderType" = "Transparent" }
        Blend  SrcAlpha OneMinusSrcAlpha 
		Cull back 
		Lighting Off 
		ZTest less
		ZWrite off
		Fog{ Mode Off }
		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			#pragma fragmentoption ARB_precision_hint_fastest
			#include "UnityCG.cginc"
 
			//uniform sampler2D _BloomTex;
			sampler2D _MainTex;
			half4 _Color;
			half4 frag(v2f_img i) : COLOR
			{
				half4 final = tex2D(_MainTex,i.uv);
				final.rgb = 0;
				return final;
			}
			ENDCG
		}
	}
    
	//替换标签是Opaque的shader，这里直接渲染为黑色
    SubShader 
	{
        Tags {"RenderType" = "Opaque" }
        Pass 
		{    
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest
            #include "UnityCG.cginc"
            half4 frag(v2f_img i) : COLOR
            {
                return half4(0,0,0,1);
            }
            ENDCG
        }
    }   
	Fallback Off
}