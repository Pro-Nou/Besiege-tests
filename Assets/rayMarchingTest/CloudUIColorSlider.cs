using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;

namespace volumeCloud
{
	public class CloudUIColorSlider : MonoBehaviour {
		public Slider _slider;
		public InputField _inputfield;
		public Text Title;
		private float _Saturation = 1f;
		private float _Volum = 1f;
		// Use this for initialization
		void Start () {
			_slider = this.GetComponent<Slider> ();
			_inputfield = this.transform.GetChild (0).GetComponent<InputField> ();
			Title = this.transform.GetChild (1).GetComponent<Text> ();
			_slider.onValueChanged.AddListener ((float value) => {
				try
				{
					Color _color = Color.HSVToRGB(value,_Saturation,_Volum);
					_inputfield.text = ColorUtility.ToHtmlStringRGB(_color);
				}
				catch{}
			});
			_inputfield.onEndEdit.AddListener ((string value) => {
				try
				{
					float _Hue = 0f;
					Color _color = Color.white;
					ColorUtility.TryParseHtmlString("#" + value, out _color);
					Color.RGBToHSV(_color,out _Hue,out _Saturation, out _Volum);
					_slider.value = _Hue;
				}
				catch{}
			});
		}

		// Update is called once per frame
		void Update () {

		}
	}
}
