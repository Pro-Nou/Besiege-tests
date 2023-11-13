using UnityEditor;
using UnityEngine;
using System.Collections;

public class changeTimeScale : MonoBehaviour {
	[MenuItem("ChangeTimeScale/2")]
	static void timescaleas2() {
		Time.timeScale = 2.0f;
	}
	[MenuItem("ChangeTimeScale/1")]
	static void timescaleas1() {
		Time.timeScale = 1.0f;
	}
}
