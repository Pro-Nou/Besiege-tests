using UnityEngine;
using System.Collections;

public class CameraMove : MonoBehaviour {

    public Camera _baseCamera;
    private Vector3 _scrollDir;
	public float _rotateSpeed;
	public float _moveSpeed;
	// Use this for initialization
	void Start () {
		//_rotateSpeed = 500f;
		//_moveSpeed = 10f;
        // _scrollDir = _baseCamera.transform.localPosition.normalized;
	}
	
	// Update is called once per frame
	void Update () {
		//_baseCamera.transform.LookAt (new Vector3(-10f, 3f, 6f));
        if (Input.GetMouseButton(1))
        {
			this.transform.Rotate(Vector3.up, Input.GetAxis("Mouse X") * Time.deltaTime * _rotateSpeed);
            _baseCamera.transform.Rotate(Vector3.left, Input.GetAxis("Mouse Y") * Time.deltaTime * _rotateSpeed);
            // float _pitchCache = -Input.GetAxis("Mouse Y") * Time.deltaTime * 2000f;
            // _pitchCache = Mathf.Clamp(_pitchCache, -55f - _pitch, 55f - _pitch);
            // this.transform.Rotate(Vector3.forward, _pitchCache);
            // _pitch += _pitchCache;
        }
		float currentMoveSpeed = _moveSpeed;
		if (Input.GetKey (KeyCode.LeftShift)) 
		{
			currentMoveSpeed *= 5f;
		}
		if (Input.GetKey (KeyCode.W))
		{
			this.transform.position += _baseCamera.transform.forward * Time.deltaTime * currentMoveSpeed;
		}
		if (Input.GetKey (KeyCode.S))
		{
			this.transform.position -= _baseCamera.transform.forward * Time.deltaTime * currentMoveSpeed;
		}
		if (Input.GetKey (KeyCode.A))
		{
			this.transform.position -= _baseCamera.transform.right * Time.deltaTime * currentMoveSpeed;
		}
		if (Input.GetKey (KeyCode.D))
		{
			this.transform.position += _baseCamera.transform.right * Time.deltaTime * currentMoveSpeed;
		}
		if (Input.GetKey (KeyCode.Space))
		{
			this.transform.position += Vector3.up * Time.deltaTime * currentMoveSpeed;
		}
		if (Input.GetKey (KeyCode.LeftControl))
		{
			this.transform.position -= Vector3.up * Time.deltaTime * currentMoveSpeed;
		}
		// if (Input.GetKeyDown (KeyCode.A))
		// 	moveLeft = !moveLeft;
		// if (Input.GetKeyDown (KeyCode.D))
		// 	moveRight = !moveRight;
        // if (Input.mouseScrollDelta.y != 0f)
        // {
        //     float _posMagnitude =  _baseCamera.transform.localPosition.magnitude;
        //     float _scrollCache = _posMagnitude * (1 - Input.mouseScrollDelta.y * Time.deltaTime * 20f);
        //     _scrollCache = Mathf.Clamp(_scrollCache, 3f, 200f);
        //     _baseCamera.transform.localPosition = _scrollDir * _scrollCache;
        // }
	
	}
}
