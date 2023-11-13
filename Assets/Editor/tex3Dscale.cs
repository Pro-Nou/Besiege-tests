using UnityEngine;
using System.Collections;
using UnityEditor;
[ExecuteInEditMode]
public class tex3Dscale : MonoBehaviour {

	[MenuItem("CreateExamples/3DTextureTest")]
	static void CreateTexture3D() {
		int size = 128;
		TextureFormat format = TextureFormat.RGBA32;
		TextureWrapMode wrapMode =  TextureWrapMode.Repeat;
		// 创建纹理并应用配置
		Texture3D texture = new Texture3D(size, size, size, format, false);
		texture.wrapMode = wrapMode;

		Color[] colors = new Color[size * size * size];
		//Color[] colorsA = textureA.GetPixels();

		float inverseResolution = 1.0f / (size - 1.0f);
		for (int z = 0; z < size; z++){
			int zOffset = z * size * size;
			for (int y = 0; y < size; y++)
			{
				int yOffset = y * size;
				for (int x = 0; x < size; x++){
					colors[x + yOffset + zOffset] = new Color(z * inverseResolution, 0, 0, 1);
				}
			}
		}
		// 将颜色值复制到纹理
		texture.SetPixels(colors);
		// 将更改应用到纹理，然后将更新的纹理上传到 GPU
		texture.Apply();
		// 将纹理保存到 Unity 项目
		AssetDatabase.CreateAsset(texture, "Assets/3dtest1.asset");
	}
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
