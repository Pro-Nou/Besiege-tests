using UnityEngine;
using System.Collections;

public class mafutiAnimeTest : MonoBehaviour {
	public Animator animator;
	// Use this for initialization
	void Start () {
		animator = GetComponent<Animator> ();
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown (KeyCode.C))
			animator.CrossFadeInFixedTime ("mafuti", 0.2f, 0, 0f);
	}
}
