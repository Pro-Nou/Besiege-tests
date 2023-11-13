Shader "Custom/NewVertexShader" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma geometry geom

            #include "UnityCG.cginc"

            struct appdata {
                float4 vertex : POSITION;
            };

            struct v2f {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert (appdata v) {
                v2f o;
                o.vertex = (v.vertex);
                o.uv = v.vertex.xy;
                return o;
            }

            [maxvertexcount(9)]
            void geom(triangle appdata v[3], inout TriangleStream<v2f> triStream) {
                // Vertex 1
                v2f o1;
                o1.vertex = UnityObjectToClipPos(v[0].vertex + fixed4(1,0,0,0));
                o1.uv = v[0].vertex.xy;
                triStream.Append(o1);

                // Vertex 2
                v2f o2;
                o2.vertex = UnityObjectToClipPos(v[1].vertex + fixed4(1,0,0,0));
                o2.uv = v[1].vertex.xy;
                triStream.Append(o2);

                // Vertex 3
                v2f o3;
                o3.vertex = UnityObjectToClipPos(v[2].vertex + fixed4(1,0,0,0));
                o3.uv = v[2].vertex.xy;
                triStream.Append(o3);

                // Vertex 1
                v2f o4;
                o4.vertex = UnityObjectToClipPos(v[0].vertex + fixed4(1,1,0,0));
                o4.uv = v[0].vertex.xy;
                triStream.Append(o4);

                // Vertex 2
                v2f o5;
                o5.vertex = UnityObjectToClipPos(v[1].vertex + fixed4(1,1,0,0));
                o5.uv = v[1].vertex.xy;
                triStream.Append(o5);

                // Vertex 3
                v2f o6;
                o6.vertex = UnityObjectToClipPos(v[2].vertex + fixed4(1,1,0,0));
                o6.uv = v[2].vertex.xy;
                triStream.Append(o6);
            }

            sampler2D _MainTex;
            fixed4 frag (v2f i) : SV_Target {
                return tex2D(_MainTex, i.uv);
            }
            ENDCG
        }
    }
}
