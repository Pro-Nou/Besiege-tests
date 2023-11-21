using UnityEngine;
using UnityEditor;
using System.Collections;

[ExecuteInEditMode]
public class autoRotate : MonoBehaviour {

	// Use this for initialization
	public float speed;
	void Start () {
		//Light mainLight = GetComponent<Light> ();
		//mainLight.shadowCustomResolution = 80000;
		//Debug.Log (mainLight.shadowCustomResolution);

	}
	
	// Update is called once per frame
	private void Update () {

		this.transform.RotateAround (this.transform.position, new Vector3 (0, 1, 0), Time.deltaTime * speed);
		//Debug.Log(transform.localRotation.eulerAngles);
	}
}
