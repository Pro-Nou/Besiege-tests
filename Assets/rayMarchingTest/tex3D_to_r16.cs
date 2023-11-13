using UnityEngine;
using System.Collections;
using UnityEditor;
[ExecuteInEditMode]
public class tex3D_to_r16 : MonoBehaviour {

	public Texture3D textrueA;
	void OnEnable()
	{
		int size = 128;
		TextureFormat format = TextureFormat.DXT1;
		TextureWrapMode wrapMode = TextureWrapMode.Repeat;
		Texture3D texture1 = new Texture3D(size, size, size, format, false);
		texture1.wrapMode = wrapMode;

		Color[] colorsA = textrueA.GetPixels();
		Color[] colors1 = new Color[size * size * size];

		for (int i = 0; i < colorsA.Length; i++)
		{
			colors1[i] = new Color(colorsA[i].r,0,0,0);
		}
		texture1.SetPixels(colors1);
		texture1.Apply();
		AssetDatabase.CreateAsset(texture1, "Assets/3DNoiseB_DXT1.asset");
	}
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
