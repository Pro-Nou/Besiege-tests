using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;

namespace volumeCloud
{
	public class CloudUIVector4 : MonoBehaviour {

		public InputField[] _inputfield = new InputField[4];
		private Vector4 _vec4;
	// Use this for initialization
		void Start () {
			_vec4 = Vector4.zero;
			for (int i = 0; i < 4; i++) {
				_inputfield [i] = this.transform.GetChild (i).GetComponent<InputField> ();
			}
			_inputfield [0].onEndEdit.AddListener ((string value) => {
				_vec4.x = Convert.ToSingle(value);
			});
			_inputfield [1].onEndEdit.AddListener ((string value) => {
				_vec4.y = Convert.ToSingle(value);
			});
			_inputfield [2].onEndEdit.AddListener ((string value) => {
				_vec4.z = Convert.ToSingle(value);
			});
			_inputfield [3].onEndEdit.AddListener ((string value) => {
				_vec4.w = Convert.ToSingle(value);
			});

		}
	
	// Update is called once per frame
		void Update () {
	
		}
	}
}
