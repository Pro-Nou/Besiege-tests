using UnityEngine;
using System.Collections;

public class AnimatorTest : MonoBehaviour {
	public Animator animator;

	public bool moveLeft;
	public bool moveRight;
	public bool moveFront;
	public bool moveBack;
	// Use this for initialization
	void Start () {

		moveLeft = false;
		moveRight = false;
		moveFront = false;
		moveBack = false;

		//UnityEditor.Animations.AnimatorController _AC = GetComponent<Animator> ().runtimeAnimatorController as UnityEditor.Animations.AnimatorController;

		//UnityEditor.Animations.AnimatorStateMachine _SM = _AC.layers [0].stateMachine;
		//UnityEditor.Animations.ChildAnimatorState[] _CAS = _SM.states;
		//foreach (var a in _CAS)
			//Debug.Log (a.state.name);
		//AnimationState _as;
		animator = GetComponent<Animator> ();
		//animator.
		//foreach(var a in animator.GetCurrentAnimatorClipInfo(0))
		//	Debug.Log (a.);
	}
	
	// Update is called once per frame
	void Update () {
		//Debug.Log (animator.GetNextAnimatorStateInfo (0).shortNameHash);
		/*
		if (Input.GetKeyDown (KeyCode.Q)) {
			//Debug.Log (animator.Play);
			//animator.PlayInFixedTime ("Run", 0, 5f);

			//Debug.Log (animator.GetCurrentAnimatorClipInfo (0).Length);
			animator.CrossFadeInFixedTime("Run",0.2f,0,0.2f);
		}
		if (Input.GetKeyDown (KeyCode.E))
			//Debug.Log (animator.Play);
			animator.CrossFadeInFixedTime("Idle",0.2f,0,0.2f);
			*/
		if (Input.GetKeyDown (KeyCode.O))
			Time.timeScale = 0.2f;
		if (Input.GetKeyUp (KeyCode.O))
			Time.timeScale = 1.0f;
		//animator.CrossFade
		if (Input.GetKeyDown (KeyCode.B))
			animator.CrossFadeInFixedTime ("XYZ", 0.2f, 0, 4f);
		if (Input.GetKeyDown (KeyCode.F) || Input.GetKeyUp (KeyCode.F))
			moveLeft = !moveLeft;
		if (Input.GetKeyDown (KeyCode.H) || Input.GetKeyUp (KeyCode.H))
			moveRight = !moveRight;
		if (Input.GetKeyDown (KeyCode.T) || Input.GetKeyUp (KeyCode.T)) {
			moveFront = !moveFront;
			if (moveFront) {
				animator.CrossFadeInFixedTime ("Run", 0.2f, 0, 0.2f);
			} else {
				animator.CrossFadeInFixedTime("Idle",0.2f,0,0.2f);
			}
		}
		if (Input.GetKeyDown (KeyCode.G) || Input.GetKeyUp (KeyCode.G)) {
			moveBack = !moveBack;
			if (moveBack) {
				animator.CrossFadeInFixedTime ("RunBack", 0.2f, 0, 0.2f);
			} else {
				animator.CrossFadeInFixedTime("Idle",0.2f,0,0.2f);
			}
		}

		if (moveFront)
			transform.Translate (new Vector3 (0f, 0f, 2.2f * Time.deltaTime));
		if (moveBack)
			transform.Translate (new Vector3 (0f, 0f, -2.2f * Time.deltaTime));
		if(moveLeft)
			transform.Rotate (new Vector3(0f,-360f*Time.deltaTime,0f));
		if(moveRight)
			transform.Rotate (new Vector3(0f,360f*Time.deltaTime,0f));

	}
}
