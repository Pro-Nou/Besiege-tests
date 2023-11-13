using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class getDepthTex : MonoBehaviour {

	// Use this for initialization
	void OnEnable() {
		GetComponent<Camera> ().depthTextureMode = DepthTextureMode.Depth;
	}
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
