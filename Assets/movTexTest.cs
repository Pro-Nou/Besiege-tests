using UnityEngine;
using System.Collections;

public class movTexTest : MonoBehaviour {
	public MovieTexture movTex;
	public AudioSource AS;
	// Use this for initialization
	void Start () {
		MeshRenderer renderer = GetComponent<MeshRenderer> ();
		AS = GetComponent<AudioSource> ();
		renderer.material.mainTexture = movTex;
		movTex.loop = false;
		Debug.Log (QualitySettings.shadowCascades);
		Debug.Log (QualitySettings.shadowCascade4Split);

	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown (KeyCode.C)) {
			movTex.Play ();
			AS.Play ();
		}
		if (Input.GetKeyDown (KeyCode.X)) {
			//AS.Stop ();
			movTex.Stop ();
		}
		if (Input.GetKeyDown (KeyCode.K)) {
			//AS.Stop ();
			Debug.Log (QualitySettings.shadowCascade4Split.x);
			Debug.Log (QualitySettings.shadowCascade4Split.y);
			Debug.Log (QualitySettings.shadowCascade4Split.z);
		}
	}
}
