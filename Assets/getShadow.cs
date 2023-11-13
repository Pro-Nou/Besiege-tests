using UnityEngine;
using UnityEngine.Rendering;
using System.Collections;

public class getShadow : MonoBehaviour {
	public Camera mainCamera;
	public Light m_light;
	RenderTexture m_shadowCopy;
	RenderTexture rt_shadow;
	public Material[] mats;
	// Use this for initialization
	void Start () {

		mainCamera = GameObject.Find("Camera").GetComponent<Camera> ();
		m_light = GameObject.Find("Directional light").GetComponent<Light> ();
		mats = GetComponent<SkinnedMeshRenderer> ().materials;
		RenderTargetIdentifier shadowmap = BuiltinRenderTextureType.CurrentActive;
		m_shadowCopy = new RenderTexture (4096, 4096, 0);
		CommandBuffer cb = new CommandBuffer ();
		QualitySettings.shadowProjection = ShadowProjection.StableFit;
		cb.SetShadowSamplingMode (shadowmap, ShadowSamplingMode.RawDepth);
		RenderTargetIdentifier shadowmap1 = new RenderTargetIdentifier (m_shadowCopy);
		cb.Blit (shadowmap, shadowmap1);


		//cb.SetGlobalTexture ("_ShadowMapTexture", shadowmap1);
		//cb.SetRenderTarget (shadowmap, RenderBufferLoadAction.DontCare, RenderBufferStoreAction.Store);
		m_light.AddCommandBuffer (LightEvent.AfterShadowMap, cb);


		RenderTextureFormat rtFormat = RenderTextureFormat.Default;
		if(!SystemInfo.SupportsRenderTextureFormat(rtFormat))
			rtFormat = RenderTextureFormat.Default;
		int shadowResolutionInt = 4096 * (int)Mathf.Pow(2, 4);
		rt_shadow = new RenderTexture(shadowResolutionInt, shadowResolutionInt, 24, rtFormat);
		rt_shadow.hideFlags = HideFlags.DontSave;

		//rt_shadow = new RenderTexture(4096, 4096, 0);
		//Camera.main.targetTexture = rt_shadow;
		foreach (var a in mats) {
			a.SetTexture ("_ShadowMapTexture", m_shadowCopy);
			//a.GetMatrix ("unity_WorldToShadow");
			//Debug.Log("")
		}
		//Shader.SetGlobalTexture("_ShadowMapTexture", m_shadowCopy);
		//Shader.SetGlobalTexture ;
	}
	void OnRenderImage(RenderTexture src,RenderTexture dst)
	{
		//Camera.main.rect = new Rect (0, 0, 0.5f, 0.5f);
		//Graphics.Blit (m_shadowCopy, dst);
		//Camera.main.rect = new Rect (0, 0, 1, 1);

	}
	// Update is called once per frame
	void Update () {
		Matrix4x4 matrixCam = mainCamera.transform.localToWorldMatrix;
		Matrix4x4 matrixLight = m_light.transform.worldToLocalMatrix;
		Debug.Log (matrixCam * matrixLight);
		foreach (var a in mats) {
			//a.SetTexture ("_ShadowMapTexture", m_shadowCopy);
			a.SetMatrix ("unity_WorldToShadow",matrixCam * matrixLight);
			//Debug.Log("")
		}
		//Debug.Log ();
		//Graphics.Blit (m_shadowCopy, rt_shadow);
	}
	void OnGUI()
	{
		GUI.DrawTexture(new Rect(0,0, 256, 256), m_shadowCopy);
		//Debug.Log (m_shadowCopy.width);
	}
}
