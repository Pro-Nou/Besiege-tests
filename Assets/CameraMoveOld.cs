using UnityEngine;
using System.Collections;

public class CameraMoveOld : MonoBehaviour {

	// Use this for initialization
	public bool moveLeft;
	public bool moveRight;
	public bool moveFront;
	public bool moveBack;
	public bool turnLeft;
	public bool turnRight;
	public Animator animator;
	void Start () {
		moveLeft = false;
		moveRight = false;
		moveFront = false;
		moveBack = false;
		//animator = GetComponent<Animator> ();

	}
	
	// Update is called once per frame
	void Update () {
		// if (Input.GetKeyDown (KeyCode.B))
		// 	animator.CrossFadeInFixedTime ("XYZcam", 0.0f, 0, 4f);
		if (Input.GetKeyDown (KeyCode.A) || Input.GetKeyUp (KeyCode.A))
			moveLeft = !moveLeft;
		if (Input.GetKeyDown (KeyCode.D) || Input.GetKeyUp (KeyCode.D))
			moveRight = !moveRight;
		if (Input.GetKeyDown (KeyCode.W) || Input.GetKeyUp (KeyCode.W))
			moveFront = !moveFront;
		if (Input.GetKeyDown (KeyCode.S) || Input.GetKeyUp (KeyCode.S))
			moveBack = !moveBack;
		if (Input.GetKeyDown (KeyCode.LeftArrow) || Input.GetKeyUp (KeyCode.LeftArrow))
			turnLeft = !turnLeft;
		if (Input.GetKeyDown (KeyCode.RightArrow) || Input.GetKeyUp (KeyCode.RightArrow))
			turnRight = !turnRight;
		
		if (moveLeft)
			transform.Translate (new Vector3 (-10f * Time.deltaTime, 0f, 0f));
		if (moveRight)
			transform.Translate (new Vector3 (10f * Time.deltaTime, 0f, 0f));
		if (moveFront)
			transform.Translate (new Vector3 (0f, 0f, 10f * Time.deltaTime));
		if (moveBack)
			transform.Translate (new Vector3 (0f, 0f, -10f * Time.deltaTime));
		if(turnLeft)
			transform.Rotate (new Vector3(0f,-50f*Time.deltaTime,0f));
		if(turnRight)
			transform.Rotate (new Vector3(0f,50f*Time.deltaTime,0f));
	}
}
