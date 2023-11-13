using UnityEngine;
using System.Collections;
using UnityEditor;
[ExecuteInEditMode]

public class tex3d_to_2d : MonoBehaviour {

	public Texture3D textureA;
	void OnEnable() {
		Texture2D textureB = new Texture2D (128 * 128, 128, TextureFormat.RGB24, false);
		textureA.GetPixels ();
		//textureB.SetPixels(textureA.GetPixels());
		//textureB.Apply ();
		//byte[] bytes = textureB.EncodeToPNG ();
		//System.IO.File.WriteAllBytes ("Assets/3DNoiseA_2Dencoded.png", bytes);
	}
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
