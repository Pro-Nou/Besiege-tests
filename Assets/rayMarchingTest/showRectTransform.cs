using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;
using UnityEditor;
[ExecuteInEditMode]

public class showRectTransform : MonoBehaviour {

	// Use this for initialization
	public GameObject _gameobject;
	void OnEnable () {
		RectTransform rectTransform = _gameobject.GetComponent<RectTransform> ();
		Debug.Log (rectTransform.position);
		Debug.Log (rectTransform.localPosition);
		Debug.Log (rectTransform.anchoredPosition);
		Debug.Log (rectTransform.anchoredPosition3D);
		Debug.Log (rectTransform.sizeDelta);
		/*
		rectTransform.anchoredPosition = new Vector2 (0f, 0f);


		GameObject _gameobj = Instantiate (_gameobject);
		_gameobj.transform.parent = _gameobject.transform.parent;
		_gameobj.GetComponent<RectTransform> ().anchoredPosition = new Vector2 (0f, 0f);
		*/
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
