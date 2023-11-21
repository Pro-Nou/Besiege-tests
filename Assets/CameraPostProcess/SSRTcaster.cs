using UnityEngine;
using System.Collections;

public class SSRTcaster : MonoBehaviour {

	public Color lightColor;
	[Range(0,1000)]
	public float distance;
	[Range(0,180)]
	public float angle;
	[Range(0,1)]
	public float angleCrossFade;
	[Range(0,1)]
	public float ambientAmount;
	public bool isStatic;
	public bool shouldUpdate;
	//public postprocessmanager ppmanager;
	private int m_hashcode;
	public postprocessmanager.LightData lightData;
	// Use this for initialization
	void Start () {
		m_hashcode = this.gameObject.GetHashCode ();
		/*
		angle = 30 + Random.value * 150f;
		distance = Random.value * 8f + 4f;
		angleCrossFade = Random.value;
		this.transform.rotation = Quaternion.Euler(new Vector3 (0f, 30f + Random.value * 150f, 0f));
		this.transform.localPosition = new Vector3 (Random.value * 32f, Random.value * 8f, Random.value * 32f) - new Vector3(16f, 4f, 16f);
		*/

		lightData = new postprocessmanager.LightData ();
		lightData.lightColor = lightColor;
		lightData.distance = distance;
		lightData.angleCos = Mathf.Cos ((angle / 180f) * Mathf.PI);
		lightData.position = this.transform.position;
		lightData.forward = this.transform.forward;
		lightData.angleCrossFade = angleCrossFade;
		lightData.ambientAmount = ambientAmount;
	}
	void OnEnable() {
		m_hashcode = this.gameObject.GetHashCode ();
		StartCoroutine (enableSelf());
		//ppmanager.lightDatas.Add (lightData);
	}
	void OnDisable() {
		m_hashcode = this.gameObject.GetHashCode ();
		postprocessmanager.instance.RemoveSSRTCaster (m_hashcode);
	}
	void UpdateAngle() {
		lightData.angleCos = Mathf.Cos ((angle / 180f) * Mathf.PI);
	}
	// Update is called once per frame
	void Update () {
		if (!isStatic) {
			lightData.position = this.transform.position;
			lightData.forward = this.transform.forward;
		}
		if (shouldUpdate) {
			postprocessmanager.instance.TransformSSRTCaster (m_hashcode, lightData);
		}
		//ppmanager.lightDatas [index] = lightData;
	}
	private System.Collections.IEnumerator enableSelf(){
		//yield return new WaitForSeconds (1f);
		while (postprocessmanager.instance == null) {
			yield return new WaitForSeconds (1f);
		}
		postprocessmanager.instance.AddSSRTCaster(m_hashcode, lightData);
		yield break;
	}
}
