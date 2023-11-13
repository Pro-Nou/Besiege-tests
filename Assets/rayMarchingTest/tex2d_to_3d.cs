using UnityEngine;
using System.Collections;
using UnityEditor;
[ExecuteInEditMode]
public class tex2d_to_3d : MonoBehaviour {

	public Texture2D textureA;
	void OnEnable() {
		
		int size = 128;
		TextureFormat format = TextureFormat.Alpha8;
		TextureWrapMode wrapMode =  TextureWrapMode.Repeat;
		// 创建纹理并应用配置
		Texture3D texture = new Texture3D(size, size, size, format, false);
		texture.wrapMode = wrapMode;
		// 创建 3 维数组以存储颜色数据
		// 填充数组，使纹理的 x、y 和 z 值映射为红色、蓝色和绿色
		// 将颜色值复制到纹理
		Color[] _colors = textureA.GetPixels();
		for (int i = 0; i < _colors.Length; i++) {
			_colors [i].a = _colors [i].r;
		}	
		texture.SetPixels(_colors);
		// 将更改应用到纹理，然后将更新的纹理上传到 GPU
		texture.Apply();
		// 将纹理保存到 Unity 项目
		AssetDatabase.CreateAsset(texture, "Assets/3DNoiseA_A8.asset");
	}
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
