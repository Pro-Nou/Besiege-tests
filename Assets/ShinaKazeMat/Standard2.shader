Shader "Custom/Standard (Surface)" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0.000000,1.000000)) = 0.500000
 _Glossiness ("Smoothness", Range(0.000000,1.000000)) = 0.500000
 _GlossMapScale ("Smoothness Scale", Range(0.000000,1.000000)) = 1.000000
[Enum(Metallic Alpha,0,Albedo Alpha,1)]  _SmoothnessTextureChannel ("Smoothness texture channel", Float) = 0.000000
[Gamma]  _Metallic ("Metallic", Range(0.000000,1.000000)) = 0.000000
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
[ToggleOff]  _SpecularHighlights ("Specular Highlights", Float) = 1.000000
[ToggleOff]  _GlossyReflections ("Glossy Reflections", Float) = 1.000000
 _BumpScale ("Scale", Float) = 1.000000
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005000,0.080000)) = 0.020000
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0.000000,1.000000)) = 1.000000
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissCol ("Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _EmissionMap ("Emission", 2D) = "black" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1.000000
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[ToggleOff]  _ShadowCaster ("Enable Shadow Casting", Float) = 1.000000
[ToggleOff]  _UseReflectionCube ("Enable Reflection Cube", Float) = 1.000000
 _ReflectionCube ("Reflection Map", CUBE) = "" { }
 _reflectionAmount ("Reflection Amount", Range(0.000000,3.000000)) = 0.750000
 _IceMap ("Ice Map", 2D) = "cyan" { }
 _FreezeAmount ("Freeze Amount", Range(0.000000,1.000000)) = 0.000000
 _BloodMap ("Blood Map", 2D) = "" { }
 _BloodColor ("Blood Color", Color) = (1.000000,0.000000,0.000000,1.000000)
 _BloodAmount ("Blood Amount", Range(0.000000,1.000000)) = 0.000000
 _DamageMap ("Damage Map", 2D) = "white" { }
 _DamageAmount ("Damage Amount", Range(0.000000,1.000000)) = 0.000000
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0.000000
 _HSVEnabled ("Use HSV Mask", Float) = 0.000000
 _TintMask ("Tint Mask", 2D) = "" { }
 _TintColor ("Tint Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _TintMatte ("Tint Matte Amount", Range(0.000000,2.000000)) = 1.000000
[HideInInspector]  _Mode ("__mode", Float) = 0.000000
[HideInInspector]  _SrcBlend ("__src", Float) = 1.000000
[HideInInspector]  _DstBlend ("__dst", Float) = 0.000000
[HideInInspector]  _ZWrite ("__zw", Float) = 1.000000
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 45741
Program "vp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_USEREFLECTIONCUBE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 94134
Program "vp" {
SubProgram "d3d9 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 182966
Program "vp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "UNITY_HDR_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 310059
Program "vp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "VERTEXLIGHT_ON" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_GLOSSYREFLECTIONS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "FOG_LINEAR" "_EMISSION" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 332108
Program "vp" {
SubProgram "d3d9 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_DETAIL_MULX2" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A" "_METALLICGLOSSMAP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" "_NORMALMAP" "_METALLICGLOSSMAP" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 440323
Program "vp" {
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" "_ALPHAPREMULTIPLY_ON" }
"// shader disassembly not supported on DXBC"
}
}
 }
}
CustomEditor "BesiegeShaderGUI"
Fallback "VertexLit"
}