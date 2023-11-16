using UnityEngine;
using System.Collections;

public class lightningPlayer : MonoBehaviour {

	public Material lightningMat;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		lightningMat.SetFloat ("_Progress", Mathf.Max (0f, ((Time.time % 3f) - 2.5f) * 2f));
	}
}
