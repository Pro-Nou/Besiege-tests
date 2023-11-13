using UnityEngine;
using System.Collections;
using UnityEditor;
[ExecuteInEditMode]
public class tex2D_to_R16 : MonoBehaviour {

	public Texture3D textureA;
	void OnEnable()
	{
		/*
		Texture2D textureB = new Texture2D (textureA.width, textureA.height, TextureFormat.Alpha8, false);
		Color[] colorsA = textureA.GetPixels();
		Color[] colorsB = new Color[textureA.width * textureA.height];
		for (int i = 0; i < colorsB.Length; i++) {
			colorsB [i] = new Color (0f, 0f, 0f, colorsA [i].r);
		}
		textureB.SetPixels(colorsB);
		textureB.Apply ();
		byte[] bytes = textureB.EncodeToPNG ();
		System.IO.File.WriteAllBytes ("Assets/2DNoiseA8.png", bytes);
		*/
		//TextureFormat.dx
		Debug.Log (textureA.format.ToString());
		//Debug.Log (textureA.EncodeToPNG ().Length);
		//AssetDatabase.CreateAsset (textureB, "Assets/rayMarchingTest/2DNoiseA_A8.png");
	}

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
