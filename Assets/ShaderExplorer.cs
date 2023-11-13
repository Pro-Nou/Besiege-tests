using UnityEngine;
using System.Collections;

public class ShaderExplorer : MonoBehaviour {

	// Use this for initialization
	SkinnedMeshRenderer skinnedMeshRenderer;
	MaterialPropertyBlock matProperty;
	void Start () {
		matProperty = new MaterialPropertyBlock();
		skinnedMeshRenderer = GetComponent<SkinnedMeshRenderer> ();
		skinnedMeshRenderer.GetPropertyBlock(matProperty);
		//skinnedMeshRenderer.material.shader.renderQueue += 1;
		Debug.Log (skinnedMeshRenderer.material.GetTag("QUEUE",false));
		skinnedMeshRenderer.material.SetOverrideTag ("QUEUE", "AlphaTest+50");
		Debug.Log (skinnedMeshRenderer.material.GetTag("QUEUE",false));
		Debug.Log (skinnedMeshRenderer.material.shader.renderQueue);
		skinnedMeshRenderer.material.renderQueue=3000;
		//Debug.Log (matProperty.ToString());
		//skinnedMeshRenderer.material.SetFloat ("_CullMode", 1f);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
