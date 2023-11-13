using UnityEngine;
using System.Collections;
using UnityEditor;

public class CreatHSVMap : MonoBehaviour {
	[MenuItem("CreateExamples/HSVMap")]
	static void CreatHSVMap2D(){
		Texture2D textureB = new Texture2D (256, 1, TextureFormat.RGB24, false);
		Color[] colors = new Color[256];
		for (int i = 0; i < 256; i++) {
			colors [i] = Color.HSVToRGB (((float)i) / 255f, 1, 1);
		}
		textureB.SetPixels (colors);
		textureB.Apply ();
		byte[] bytes = textureB.EncodeToPNG ();
		System.IO.File.WriteAllBytes ("Assets/HSVMap.png", bytes);
		
	}
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
