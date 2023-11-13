using UnityEngine;
using System.Collections;
using UnityEditor;
[ExecuteInEditMode]
public class cloudLight : MonoBehaviour {

	public Material _Material_org;
	public Material _Material_dst;
	public RenderTexture m_R;
	// Use this for initialization
	void OnEnable(){
		_Material_dst = new Material(Shader.Find("Unlit/cloudLightCompute"));
		_Material_dst.CopyPropertiesFromMaterial (_Material_org);
		//Debug.Log (_Material.GetTexture("_Noise3DA").name.ToString());
		Graphics.Blit(m_R, m_R, _Material_dst,0);
		//_Material_dst.CopyPropertiesFromMaterial (_Material_org);
		//Debug.Log (_Material.GetTexture("_Noise3DA").name.ToString());
		//Graphics.Blit(m_R, m_R, _Material_dst,0);
	}
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	void FixedUpdate () {
		_Material_dst.CopyPropertiesFromMaterial (_Material_org);
		//Debug.Log (_Material.GetTexture("_Noise3DA").name.ToString());
		Graphics.Blit(m_R, m_R, _Material_dst,0);
	}
}
