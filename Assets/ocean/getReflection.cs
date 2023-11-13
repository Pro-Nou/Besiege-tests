using UnityEngine;
using System.Collections;

public class getReflection : MonoBehaviour {

	public ReflectionProbe _reflectionProbe;
	public Material _reflectionMat;
	// Use this for initialization
	void OnEnable () {
		_reflectionMat.SetTexture ("_Cubemap", _reflectionProbe.texture);
		//_reflectionMat.SetTexture ("_Cubemap", _reflectionProbe.texture);
		/*
		Debug.Log(_reflectionProbe.texture as RenderTexture);
		Debug.Log((_reflectionProbe.texture as RenderTexture).depthBuffer.GetNativeRenderBufferPtr());
		Debug.Log((_reflectionProbe.texture as RenderTexture).filterMode);
		Debug.Log((_reflectionProbe.texture as RenderTexture).antiAliasing);
		Debug.Log((_reflectionProbe.texture as RenderTexture).wrapMode);
		Debug.Log((_reflectionProbe.texture as RenderTexture).depthBuffer);
		*/
		//Debug.Log(_reflectionProbe.texture.filterMode);
		//Debug.Log(_reflectionProbe.texture.);
	}
	void Start () {
		//_reflectionMat.SetTexture ("_Cubemap", _reflectionProbe.texture);
		/*
		(_reflectionProbe.texture as RenderTexture).Release ();
		(_reflectionProbe.texture as RenderTexture).antiAliasing = 8;
		(_reflectionProbe.texture as RenderTexture).Create ();
		*/
		//_reflectionMat.SetTexture ("_Cubemap", _reflectionProbe.texture);
	//	_reflectionMat.SetTexture ("_Cubemap", _reflectionProbe.texture);
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void FixedUpdate () {
	//	_reflectionProbe.RenderProbe ();
	//	_reflectionMat.SetTexture ("_Cubemap", _reflectionProbe.texture);
	}
}
