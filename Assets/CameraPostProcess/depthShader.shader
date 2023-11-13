Shader "Hidden/depthShader"
{
	SubShader 
	{
        Tags {"RenderType" = "Opaque" "QUEUE" = "transparent" "LightMode"="ForwardBase"}
        Pass 
		{    
			ZWrite on
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
			#pragma multi_compile_fwdbase
            #include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				float depth : DEPTH;
			};

			float _depthRTTransferFactor;
			v2f vert(appdata v)
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.depth = (-mul(UNITY_MATRIX_MV, v.vertex).z * _ProjectionParams.w) * _depthRTTransferFactor;
				return o;
			}

            float4 frag(v2f i) : COLOR
            {
				float depthFrac = i.depth % 1;
				float depthFloor = (i.depth - depthFrac) / _depthRTTransferFactor;
                return float4(depthFloor, depthFrac, 0, 1);
                // return float4(i.depth, 0, 0, 1);
            }
            ENDCG
        }
    }   
	Fallback Off
}
