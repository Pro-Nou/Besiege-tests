using UnityEngine;
using System.Collections;

public class ShadowTest : MonoBehaviour {
	RenderTexture rt_shadow;
	public int shadowResolution = 0;
	private int shadowResolution1 = 0;
	// Use this for initialization
	void Start () {
		//Shader.SetGlobalTexture ("_ShadowMap", rt_shadow);

	}
	// Update is called once per frame
	void Update () {
		if (shadowResolution != shadowResolution1) {
			RenderTextureFormat rtFormat = RenderTextureFormat.Default;
			if (!SystemInfo.SupportsRenderTextureFormat (rtFormat))
				rtFormat = RenderTextureFormat.Default;
			int shadowResolutionInt = 4096 * (int)Mathf.Pow (2, shadowResolution - 3);
			rt_shadow = new RenderTexture (shadowResolutionInt, shadowResolutionInt, 24, rtFormat);
			rt_shadow.hideFlags = HideFlags.DontSave;

			int resourceID=Shader.PropertyToID ("_ShadowMapTexture");

			Shader.SetGlobalTexture (resourceID, Texture2D.blackTexture);
			//Shader.SetGlobalFloat ("unity_LightShadowBias", shadowResolution * 0.1f);

			shadowResolution1 = shadowResolution;
			Debug.Log (shadowResolution1);
		}
	}
}
