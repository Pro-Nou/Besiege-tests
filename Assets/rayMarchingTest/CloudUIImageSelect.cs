using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;
namespace volumeCloud
{
public class CloudUIImageSelect : MonoBehaviour {

	// Use this for initialization
		public UnityEngine.UI.Image _image;
		public UnityEngine.UI.Button _button;
		public UnityEngine.UI.InputField _inputField;
		public Texture2D _tex2D;
		void Start () {
			_button = this.transform.GetChild (0).GetComponent<UnityEngine.UI.Button> ();
			_image = this.transform.GetChild (1).GetComponent<UnityEngine.UI.Image> ();
			_inputField = this.transform.GetChild (2).GetComponent<UnityEngine.UI.InputField> ();
			_inputField.onEndEdit.AddListener ((string value) => {
				_image.sprite = Sprite.Create(_tex2D,new Rect(0f,0f,_tex2D.width,_tex2D.height),new Vector2(1f,1f));
			});
		}
	
	// Update is called once per frame
		void Update () {
	
		}
	}
}
