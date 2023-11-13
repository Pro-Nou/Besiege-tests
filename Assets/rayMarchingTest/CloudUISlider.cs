using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;

namespace volumeCloud
{
	public class CloudUISlider : MonoBehaviour {
		public Slider _slider;
		public InputField _inputfield;
		public Text Title;
	// Use this for initialization
		void Start () {
			_slider = this.GetComponent<Slider> ();
			_inputfield = this.transform.GetChild (0).GetComponent<InputField> ();
			Title = this.transform.GetChild (1).GetComponent<Text> ();
			_slider.onValueChanged.AddListener ((float value) => {
				try
				{
					_inputfield.text = value.ToString();
				}
				catch{}
			});
			_inputfield.onEndEdit.AddListener ((string value) => {
				try
				{
					_slider.value = Convert.ToSingle(value);
				}
				catch{}
			});
		}
	
	// Update is called once per frame
		void Update () {
		
		}
	}
}
