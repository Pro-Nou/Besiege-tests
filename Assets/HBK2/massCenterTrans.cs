using UnityEngine;
using System.Collections;

public class massCenterTrans : MonoBehaviour {

	// Use this for initialization
	void Start () {
		GetComponent<Rigidbody> ().centerOfMass = new Vector3 (0f, 1f, 0f);
		//rigidbody.centerOfMass = ;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
