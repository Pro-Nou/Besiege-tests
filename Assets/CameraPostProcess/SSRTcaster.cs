using UnityEngine;
using System.Collections;

public class SSRTcaster : MonoBehaviour {

	public Color lightColor;
	[Range(0,1000)]
	public float distance;
	[Range(0,180)]
	public float angle;
	public postprocessmanager ppmanager;

	public postprocessmanager.LightData lightData;
	// Use this for initialization
	void Start () {
		lightData = new postprocessmanager.LightData ();
		lightData.lightColor = lightColor;
		lightData.distance = distance;
		lightData.angleCos = Mathf.Cos (angle);
		lightData.position = this.transform.position;
		lightData.forward = this.transform.forward;
	}
	void OnEnable() {
		StartCoroutine (enableSelf());
		//ppmanager.lightDatas.Add (lightData);
	}
	void OnDisable() {
		ppmanager.lightDatas.Remove (lightData);
	}
	// Update is called once per frame
	void Update () {
		lightData.lightColor = lightColor;
		lightData.position = this.transform.position;
		lightData.forward = this.transform.forward;
		//ppmanager.lightDatas [index] = lightData;
	}
	private System.Collections.IEnumerator enableSelf(){
		yield return new WaitForSeconds (1f);
		while (ppmanager.lightDatas == null) {
			yield return new WaitForSeconds (1f);
		}
		ppmanager.lightDatas.Add (lightData);
		yield break;
	}
}
