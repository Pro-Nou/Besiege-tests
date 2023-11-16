using UnityEngine;
using System.Collections;

public class lightningGenerator : MonoBehaviour {

	public Camera mainCamera;
	public GameObject lightningPrefab;
	public GameObject volumCloudObject;
	private cloudMove _cloudMove;
	// Use this for initialization
	void Start () {
		lightningPrefab.SetActive (false);
		_cloudMove = volumCloudObject.GetComponent<cloudMove> ();
	}
	
	// Update is called once per frame
	void LateUpdate () {
		if (_cloudMove.CloudHeight > 100f) {
			return;
		}
		if (Input.GetMouseButtonDown (0)) {
			RaycastHit hit=new RaycastHit();
			Ray rayH = new Ray(mainCamera.transform.position, mainCamera.ScreenPointToRay(Input.mousePosition).direction);
			if (Physics.Raycast(rayH, out hit, 1000f)) 
			{
				if (hit.point.y < _cloudMove.CloudHeight) {
					GameObject newLightning = (GameObject)Instantiate (lightningPrefab, hit.point, Quaternion.Euler(0f, Random.value * 360f, 0f));
					//GameObject newLightning = (GameObject)Instantiate (lightningPrefab, Vector3.zero, Quaternion.Euler(0f, 0f, 0f));
					newLightning.SetActive (true);
					lightningPlayer newLightningPlayer = newLightning.GetComponent<lightningPlayer> ();

					Vector3 anchorPos = newLightningPlayer.lightningAnchor.transform.position;
					anchorPos.y = anchorPos.y > _cloudMove.CloudHeight ? _cloudMove.CloudHeight : anchorPos.y;
					newLightningPlayer.lightningAnchor.transform.position = anchorPos;

					newLightningPlayer.PlayOnce ();
					StartCoroutine(DestroyAfterTime(Mathf.Max(1,1f, newLightningPlayer.duration), newLightning));
				}
			}
		}
	}
	public System.Collections.IEnumerator DestroyAfterTime(float waitTime, GameObject tgtObject) {
		yield return new WaitForSeconds (waitTime);
		Destroy (tgtObject);
		yield break;
	}

}
