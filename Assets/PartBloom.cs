using System;
using UnityEngine;
using System.Collections;

public class PartBloom : MonoBehaviour
{
	public Color colorThreshold = Color.black;
	public Color bloomColor = Color.white;
	[Range(0.0f, 1.0f)]
	public float bloomFactor = 0.5f;
	[Range(0.0f, 10.0f)]
	public float samplerScale = 1.0f;

	public Material _Material;
	public Camera _camera;

	public RenderTexture m_R;
	void OnRenderImage(RenderTexture source, RenderTexture destination)
	{
		if (_Material)
		{

			//return;
			RenderTexture temp1 = RenderTexture.GetTemporary(m_R.width / 1, m_R.height / 1, 0, m_R.format);
			RenderTexture temp2 = RenderTexture.GetTemporary(m_R.width / 1, m_R.height / 1, 0, m_R.format);
			RenderTexture temp3 = RenderTexture.GetTemporary(m_R.width / 1, m_R.height / 1, 0, m_R.format);
			temp1.filterMode = FilterMode.Bilinear;
			temp2.filterMode = FilterMode.Bilinear;
			temp3.filterMode = FilterMode.Bilinear;

			//Graphics.Blit(m_R, temp1);
			Graphics.Blit(m_R, temp1);

			_Material.SetTexture("_MainTex", temp1);
			Graphics.Blit(temp1, temp2, _Material, 1);

			_Material.SetTexture("_MainTex", temp2);
			Graphics.Blit(temp2, temp3, _Material, 1);

			_Material.SetTexture("_MainTex", source);
			_Material.SetTexture("_BlurTex", temp3);
			_Material.SetTexture("_ThresHoldTex", m_R);
			Graphics.Blit(source, destination, _Material, 2);
			//Graphics.Blit(temp1, destination);
			//Graphics.Blit(temp1, destination, _Material, 0);

			RenderTexture.ReleaseTemporary(temp1);
			RenderTexture.ReleaseTemporary(temp2);
			RenderTexture.ReleaseTemporary(temp3);
			return;

		}
	}
}