using UnityEngine;
using System.Collections;
using UnityEditor;
//[ExecuteInEditMode]

public class cloudMove : MonoBehaviour {

	public Material _mat;
	public MeshFilter _meshFilter;
	public MeshRenderer _meshRenderer;

	public Vector2 cloudFloatingVelocity;
	public Vector4 cloudOffsetVec4;
	public float CloudHeight;
	// Use this for initialization
	void Start () {
		//Debug.Log (this.transform.position);
	}
	public void oceanHeightFix(float oceanHeight) {
		if (CloudHeight < oceanHeight) {
			cloudOffsetVec4.y = (oceanHeight / _meshFilter.gameObject.transform.localScale.y) + _mat.GetFloat ("_heightCullThreshold");
			CloudHeight = oceanHeight;
		}
	}
	void OnEnable() {
		cloudOffsetVec4 = _mat.GetVector ("_positionOffset");
		CloudHeight = (cloudOffsetVec4.y - _mat.GetFloat ("_heightCullThreshold")) * _meshFilter.gameObject.transform.localScale.y;
		oceanHeightFix (3f);
		Debug.Log ("cloud height: " + CloudHeight.ToString());
		Shader.SetGlobalFloat ("_CloudHeight", CloudHeight);
		/*
		Bounds _bounds = new Bounds();
		_bounds.center = Vector3.zero;
		_bounds.size = Vector3.one * float.MaxValue;
		_meshFilter.mesh.bounds = _bounds;
		*/
	}
	// Update is called once per frame
	void Update () {
		cloudOffsetVec4.x += cloudFloatingVelocity.x * Time.timeScale * Time.deltaTime;
		cloudOffsetVec4.z += cloudFloatingVelocity.y * Time.timeScale * Time.deltaTime;
		_mat.SetVector("_positionOffset", cloudOffsetVec4);
		//Vector4 _vec = _mat.GetVector ("_XYOffsetAndScale");
	}
}
