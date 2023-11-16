using UnityEngine;
using System.Collections;

public class lightningPlayer : MonoBehaviour {

	private Material lightningMat;
	public GameObject lightningMain;

	private Material lightningCrackMat;
	public GameObject lightningCrack;

	private Material lightningAnchorMat;
	public GameObject lightningAnchor;

	public ParticleSystem hitPS0;
	public ParticleSystem hitPS1;
	public ParticleSystem hitPS2;
	public float duration; 
	private float progress;
	private float lifeTime;
	public bool isPlaying;
	// Use this for initialization
	void InitPS () {
		hitPS0.playbackSpeed = 1f / duration;
		hitPS1.playbackSpeed = 1f / duration;
		hitPS2.playbackSpeed = 1f;

		ParticleSystem.Burst[] PSB2 = new ParticleSystem.Burst[1];
		hitPS2.emission.GetBursts (PSB2);
		PSB2 [0].time *= duration;
		hitPS2.emission.SetBursts (PSB2);

		lightningMat = lightningMain.GetComponent<MeshRenderer> ().material;
		lightningCrackMat = lightningCrack.GetComponent<MeshRenderer> ().material;
		lightningAnchorMat = lightningAnchor.GetComponent<MeshRenderer> ().material;
		ParticleSystemRenderer PSR0 = hitPS0.gameObject.GetComponent<ParticleSystemRenderer> ();
		ParticleSystemRenderer PSR1 = hitPS1.gameObject.GetComponent<ParticleSystemRenderer> ();
		ParticleSystemRenderer PSR2 = hitPS2.gameObject.GetComponent<ParticleSystemRenderer> ();

		Color color = lightningMat.GetColor ("_Color");
		Color colorInside = lightningMat.GetColor ("_ColorInside");
		float colorMult = lightningMat.GetFloat ("_ColorMult");

		lightningAnchorMat.SetColor ("_Color", color);
		lightningAnchorMat.SetColor ("_ColorInside", colorInside);
		lightningAnchorMat.SetFloat ("_ColorMult", colorMult);

		lightningCrackMat.SetColor ("_Color", color);
		lightningCrackMat.SetColor ("_ColorInside", colorInside);
		lightningCrackMat.SetFloat ("_ColorMult", colorMult);

		PSR0.material.SetColor ("_Color", color);
		PSR0.material.SetColor ("_ColorInside", colorInside);
		PSR0.material.SetFloat ("_ColorMult", colorMult);

		PSR1.material.SetColor ("_Color", color);
		PSR1.material.SetColor ("_ColorInside", colorInside);
		PSR1.material.SetFloat ("_ColorMult", colorMult);

		PSR2.material.SetColor ("_Color", color);
		PSR2.material.SetColor ("_ColorInside", colorInside);
		PSR2.material.SetFloat ("_ColorMult", colorMult);
	}
	void Awake () {
		isPlaying = false;
		hitPS0.Stop ();
		hitPS1.Stop ();
		hitPS2.Stop ();
	}
	public void PlayOnce () {
		progress = 0f;
		lifeTime = 0f;
		InitPS ();
		hitPS0.Play ();
		hitPS1.Play ();
		hitPS2.Play ();
		isPlaying = true;
	}
	void StopAll () {
		isPlaying = false;
		hitPS0.Stop ();
		hitPS1.Stop ();
		hitPS2.Stop ();
		lightningMat.SetFloat ("_Progress", 0);
		lightningAnchorMat.SetFloat ("_Progress", 0);
	}
	void Playing () {

		if (lifeTime > duration) {
			StopAll ();
			return;
		}
		progress = lifeTime / duration;

		float progressScale = progress * 2f + 3f;
		lightningMain.transform.localScale = new Vector3 (progressScale, 1f, progressScale);
		lightningMat.SetFloat ("_Progress", progress);
		lightningAnchorMat.SetFloat ("_Progress", progress);
	}
	// Update is called once per frame
	void Update () {
		if (isPlaying) {
			Playing ();
		}
		lightningCrackMat.SetFloat ("_Progress", progress < 0.2f ? (0.2f - progress) * 5f : lifeTime);
		lifeTime += Time.deltaTime;
	}
}
