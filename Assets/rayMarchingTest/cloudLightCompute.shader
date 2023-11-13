Shader "Unlit/cloudLightCompute"
{
	Properties
	{
    _baseColor ("front color", Color) = (1.0,1.0,1.0,1.0)
    _backColor ("back color", Color) = (1.0,1.0,1.0,1.0)
    [NoScaleOffset]_RayMaskTex ("ray mask", 2D) = "white" {}
    _BlueNoiseScale ("BlueNoiseScale", Range(0, 1)) = 1

    _Density ("Density", range(0.0,1.0)) = 0.4
    _StepSize ("Step Size", range(0.001,0.1)) = 0.01
    _max_count ("Step Count", range(1,256)) = 12
    _heightCullThreshold ("HeightCullThreshold ", range(0,0.5)) = 0.05

    _NoiseCullThreshold ("NoiseCullThreshold", Range(0.001, 1)) = 0.1
    _w ("_w",range(0,1)) = 0.001
    _positionOffset ("Position offset", Vector) = (0, 0, 0, 0)
    [NoScaleOffset]_Noise3DA ("Noise3D A", 3D) = "white" {}
	_Noise3DATile ("Noise3D Tile A", Vector) = (1, 1, 1, 1)
    [NoScaleOffset]_Noise3DB ("Noise3D B", 3D) = "white" {}
	_Noise3DBTile ("Noise3D Tile B", Vector) = (1, 1, 1, 1)
   	[NoScaleOffset]_Noise2DA ("Noise mask A", 2D) = "white" {}
    _Noise2DATile ("Noise Tile A", Vector) = (0, 0, 0, 0)
    [NoScaleOffset]_Noise2DB ("Noise mask B", 2D) = "white" {}
    _Noise2DBTile ("Noise Tile B", Vector) = (0, 0, 0, 0)

    _light_damper ("Light Damper", range(0,1)) = 0.05
    _LightStepSize ("Light Step Size", range(0.001,1)) = 0.01
    _light_max_count ("Light Step Count", range(1,64)) = 16
	}
	SubShader
	{
		Tags { "Queue" = "Transparent" "RenderType" = "volum" "LightMode" = "ForwardBase" "PerformanceChecks"="False" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			

      		#include "UnityCG.cginc"
	    	#include "AutoLight.cginc"
	    	#include "Lighting.cginc"


      		fixed4 _baseColor;
      		fixed4 _backColor;
      		sampler3D _MainTex;
      		float4 _positionOffset;

      		sampler3D _Noise3DA;
      		float4 _Noise3DATile;

      		sampler3D _Noise3DB;
      		float4 _Noise3DBTile;

      		float _NoiseCullThreshold;
      		float _w;

      		sampler2D _RayMaskTex;
      		float4 _RayMaskTex_ST;
      		float _BlueNoiseScale;

      		sampler2D _Noise2DA;
      		float4 _Noise2DATile;

      		sampler2D _Noise2DB;
      		float4 _Noise2DBTile;

      		float _Density;
      		float _StepSize;
      		int _max_count;
      		float _heightCullThreshold;

      		float _LightStepSize;
      		int _light_max_count;
      		float _light_damper;

			struct appdata
			{
				float4 vertex : POSITION;
			};


      		struct v2f{
        		float4 vertex : SV_POSITION;
		    	float3 localLightDir: TEXCOORD5;
				float2 uv : TEXCOORD6;
      		};

			
			v2f vert (appdata_img v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = v.texcoord.xy;
				o.localLightDir = normalize(UnityWorldSpaceLightDir(float3(0,0,0)));
				return o;
			}

      		float getNoise(float3 samplePosition){
            	float heightA = tex2Dlod(_Noise2DA, float4(samplePosition.xz * _Noise2DATile.xz, 0, 0)).r * _Noise2DATile.y + _Noise2DATile.w;
            	float heightB = (tex2Dlod(_Noise2DB, float4(samplePosition.xz * _Noise2DBTile.xz, 0, 0)).r) * _Noise2DBTile.y + _Noise2DBTile.w;
            	float noiseBase = heightA / 2 - abs(samplePosition.y + heightB);
            	float noise3D = tex3Dlod(_Noise3DA, float4(samplePosition.xyz * _Noise3DATile.xyz,1)).a * _Noise3DATile.w + 
            					tex3Dlod(_Noise3DB, float4(samplePosition.xyz * _Noise3DBTile.xyz,1)).a * _Noise3DBTile.w;

          		return smoothstep(_NoiseCullThreshold - _w, _NoiseCullThreshold + _w, saturate(noiseBase + noise3D));
      		}
			fixed4 frag (v2f i) : SV_Target
			{
				float3 org_light = float3((i.uv.x * 128) % 1,  (floor(i.uv.x * 128) / 128 - 0.5) * (_heightCullThreshold * 2), i.uv.y);
				float lightDepth = 0;

        		for (int j = 0; j < _light_max_count; j++)
        		{
        			org_light += _LightStepSize * i.localLightDir;
        			if(abs(org_light.y) > _heightCullThreshold)
        			{
        				break;
        			}
        			lightDepth += getNoise(org_light);
        		}

				return fixed4(lightDepth / _light_max_count,0,0,1);
			}
			ENDCG
		}
	}
}
