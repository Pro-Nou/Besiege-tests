using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;
namespace volumeCloud
{
	public class CloudUIDropDown : MonoBehaviour {
		public UnityEngine.UI.Dropdown _dropDown;
	// Use this for initialization
		void Start () {
			_dropDown = this.GetComponent<UnityEngine.UI.Dropdown> ();
			_dropDown.ClearOptions ();
			_dropDown.AddOptions (new System.Collections.Generic.List<string>{"color","tex"});
		}
		
	// Update is called once per frame
		void Update () {
		
		}
	}
}
