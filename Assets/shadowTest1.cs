using UnityEngine;
using System.Collections;

public class shadowTest1 : MonoBehaviour {
	public Material[] materials;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		materials = GetComponent<SkinnedMeshRenderer> ().materials;
		foreach (var a in materials) {
			//RenderTextureFormat rtFormat = RenderTextureFormat.Default;
			//if (!SystemInfo.SupportsRenderTextureFormat (rtFormat))
			//	rtFormat = RenderTextureFormat.Default;
			//int shadowResolutionInt = 4096 * (int)Mathf.Pow (2, shadowResolution - 3);
			//rt_shadow = new RenderTexture (shadowResolutionInt, shadowResolutionInt, 24, rtFormat);
			//rt_shadow.hideFlags = HideFlags.DontSave;

			//int resourceID=Shader.PropertyToID ();

			Debug.Log (a.GetTexture ("_ShadowMapTexture"));
		}
	}
}
