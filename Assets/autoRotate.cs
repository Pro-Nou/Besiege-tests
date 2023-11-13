using UnityEngine;
using UnityEditor;
using System.Collections;

[ExecuteInEditMode]
public class autoRotate : MonoBehaviour {

	// Use this for initialization
	void Start () {
		Light mainLight = GetComponent<Light> ();
		mainLight.shadowCustomResolution = 80000;
		Debug.Log (mainLight.shadowCustomResolution);

	}
	
	// Update is called once per frame
	private void Update () {

		transform.RotateAround (new Vector3 (0, 0, 0), new Vector3 (0, 1, 0), 1);
		//Debug.Log(transform.localRotation.eulerAngles);
	}
}
