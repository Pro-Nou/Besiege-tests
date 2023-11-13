using UnityEngine;
using System.Collections;

public class pixelRender : MonoBehaviour {

	public RenderTexture m_R;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnRenderImage(RenderTexture source, RenderTexture destination) {
		Graphics.Blit(source, m_R);
		Graphics.Blit(m_R, destination);
	}
}
