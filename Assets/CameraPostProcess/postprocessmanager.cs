using UnityEngine;
using System.Collections;
using UnityEngine.Rendering;

public class postprocessmanager : MonoBehaviour {

	[Range(1,4000)]
	public float SSRDistance;
	[Range(-0.001f, 0.001f)]
	public float SSRPixelBias;
	[Range(-0.001f, 0.001f)]
	public float SSRPixelThickness;
	[Range(0, 128)]
	public float SSRCrossFadeDistance;
	[Range(0, 7)]
	public float SSRQuality;
	[Range(0, 4)]
	public float SSRResDecrease;
	[Range(0, 512)]
	public float SSRMaxStep;
	public Texture2D SSRMask;
	public float SSRMaskScale;

	[Range(0, 100)]
	public float oceanHeight;
	[Range(0, 1)]
	public float rainVisibility;
	public GameObject oceanObject;

	public Camera oceanDepthNormalCamera;
	public Shader oceanDepthNormalShader;
	//public RenderTexture oceanDepthResult;
	//public RenderTexture oceanNormalResult;
	//public RenderTexture[] HiZArray = new RenderTexture[8];
	//public int HiZValidLod;

	public Camera mainCamera;
	public Material blitMat;

	public RenderTexture rgbaResult;
	public RenderTexture rgbaFinal;
	public RenderTexture ssrDepthCache;
	public RenderTexture ssrNormalCache;
	public RenderTexture ssrFinal;
	public RenderTexture voronoiCache;
	public RenderTexture voronoiNormal;
	public ReflectionProbe reflProbe;
	private CommandBuffer ssrLastFramOffset;
	private CommandBuffer beforeAlpha;


	public Texture2D rainDropMap;
	public Texture2D rainDropNormalMap;
	public Vector4 RainUVTile;
	public Vector4 RainDropDistortionTile;
	[Range(0, 1)]
	public float RainDropScale;
	[Range(0, 10)]
	public float RainDropDistortion;

	private RenderTargetIdentifier rt;
	private RenderTargetIdentifier rt1;

	public bool thisBool;
	private bool lastBool;

	void resizeRT(ref RenderTexture rtIN, Vector2 Size)
	{
		rtIN.Release ();
		rtIN.height = (int)(Size.y);
		rtIN.width = (int)(Size.x);
		//rtIN.height = Screen.height;
		//rtIN.width = Screen.width;
		rtIN.Create ();
	}
	/*
	void resizeHiZ()
	{
		HiZValidLod = 0;
		resizeRT (ref HiZArray[0], new Vector2(1024f, 1024f));
		resizeRT (ref oceanNormalResult, new Vector2(1024f, 1024f));
		for (int i = 1; i < 8; i++) {
			if (HiZArray [i - 1].width >= 2 && HiZArray [i - 1].width >= 2) {
				HiZArray [i].Release();
				HiZArray [i].height = (int)Mathf.Ceil ((float)(HiZArray [i - 1].height) / 2);
				HiZArray [i].width = (int)Mathf.Ceil ((float)(HiZArray [i - 1].width) / 2);
				HiZArray [i].Create();
				HiZValidLod = i;
			}
		}
	}
	*/
	/*
	void generateHiZ()
	{
		for (int i = 0; i < HiZValidLod; i++) {
			blitMat.SetTexture ("_SourceDepthTexture", HiZArray[i]);
			Graphics.Blit (HiZArray [i], HiZArray [i + 1], blitMat, 3);
			Graphics.CopyTexture (HiZArray [i + 1], 0, 0, HiZArray [0], 0, i + 1);
		}
	}
	*/
	void resizeOnce()
	{
		float ssrResDec = Mathf.Pow (2, SSRResDecrease);
		resizeRT (ref rgbaResult, new Vector2(Screen.width, Screen.height));
		resizeRT (ref rgbaFinal, new Vector2(Screen.width, Screen.height));
		resizeRT (ref ssrDepthCache, new Vector2(Screen.width / ssrResDec, Screen.height / ssrResDec));
		resizeRT (ref ssrNormalCache, new Vector2(Screen.width / ssrResDec, Screen.height / ssrResDec));
		//resizeRT (ref ssrFinal, new Vector2(Screen.width, Screen.height));
		resizeRT (ref ssrFinal, new Vector2(1024f, 1024f));

		RenderBuffer[] rb = new RenderBuffer[2];
		rb [0] = ssrDepthCache.colorBuffer;
		rb [1] = ssrNormalCache.colorBuffer;
		oceanDepthNormalCamera.SetTargetBuffers(rb, ssrDepthCache.depthBuffer);
	}
	void UpdateAllValue()
	{
		reflProbe.nearClipPlane = SSRDistance;
		Shader.SetGlobalTexture ("_MainCameraReflProbe", reflProbe.texture);

		oceanDepthNormalCamera.farClipPlane = SSRDistance;
		Shader.SetGlobalTexture("_MainCameraRGBAPre", rgbaResult);
		Shader.SetGlobalTexture("_MainCameraRGBAMap", rgbaFinal);
		Shader.SetGlobalTexture("_MainCameraOceanDepth", ssrDepthCache);
		Shader.SetGlobalTexture("_MainCameraOceanNormal", ssrNormalCache);
		Shader.SetGlobalTexture("_MainCameraSSRMap", ssrFinal);

		Shader.SetGlobalFloat ("_SSRPixelBias", SSRPixelBias);
		Shader.SetGlobalFloat ("_SSRPixelThickness", SSRPixelThickness);
		Shader.SetGlobalFloat ("_SSRCrossFadeDistance", SSRCrossFadeDistance);
		Shader.SetGlobalFloat ("_SSRQuality", SSRQuality);
		Shader.SetGlobalFloat ("_SSRDistance", SSRDistance);
		Shader.SetGlobalFloat ("_SSRMaxStep", SSRMaxStep);
		Shader.SetGlobalTexture ("_SSRMaskTex", SSRMask);
		Shader.SetGlobalFloat ("_SSRMaskScale", SSRMaskScale);
		Shader.SetGlobalFloat ("_MainCameraFarClipPlane", mainCamera.farClipPlane);

		Shader.SetGlobalFloat ("_OceanHeight", oceanHeight);
		Shader.SetGlobalFloat ("_rainVisibility", rainVisibility);
		Shader.SetGlobalTexture("_RainDropMap", rainDropMap);
		Shader.SetGlobalTexture("_RainDropNormalMap", rainDropNormalMap);
		Shader.SetGlobalFloat ("_RainDropScale", RainDropScale);
		Shader.SetGlobalFloat ("_RainDropDistortion", RainDropDistortion);
		Shader.SetGlobalVector ("_RainUVTile", RainUVTile);
		Shader.SetGlobalVector ("_RainDropDistortionTile", RainDropDistortionTile);

		blitMat.SetTexture ("_VoronoiMap", voronoiCache);
		Shader.SetGlobalTexture("_VoronoiNormal", voronoiNormal);
		Vector3 oldPos = oceanObject.transform.position;
		oldPos.y = oceanHeight;
		oceanObject.transform.position = oldPos;
	}
	// Use this for initialization
	void Start () {
		thisBool = false;
		lastBool = false;


		ssrFinal.Release ();
		ssrFinal.useMipMap = true;
		ssrFinal.mipMapBias = 0;
		ssrFinal.generateMips = true;
		ssrFinal.Create ();

		mainCamera.depthTextureMode = DepthTextureMode.Depth | mainCamera.depthTextureMode;
		oceanDepthNormalCamera.CopyFrom(mainCamera);
		oceanDepthNormalCamera.clearFlags = CameraClearFlags.Color;
		oceanDepthNormalCamera.backgroundColor = Color.white;
		oceanDepthNormalCamera.renderingPath = RenderingPath.Forward;
		oceanDepthNormalCamera.enabled = false;
		oceanDepthNormalCamera.SetReplacementShader (oceanDepthNormalShader, "RenderType");

		Bounds infBoundOcean = new Bounds ();
		infBoundOcean.center = Vector3.zero;
		infBoundOcean.size = Vector3.one * float.MaxValue;
		Bounds infBound = new Bounds ();
		infBound.center = Vector3.zero;
		infBound.size = Vector3.one * float.MaxValue;
		oceanObject.GetComponent<MeshFilter> ().mesh.bounds = infBoundOcean;
		// Debug.Log (oceanObject.transform.GetChild (0).name);
		oceanObject.transform.GetChild (0).GetComponent<MeshFilter> ().mesh.bounds = infBound;


		//resizeHiZ ();
		resizeOnce ();

		//oceanDepthNormalCamera.targetTexture = oceanDepthResult;
		//ssrCamera.enabled = false;

		UpdateAllValue ();
		//ssrLastFramOffset = new CommandBuffer ();
		beforeAlpha = new CommandBuffer ();
		rt = new RenderTargetIdentifier(mainCamera.targetTexture);
		rt1 = new RenderTargetIdentifier(rgbaResult);
		//Debug.Log (rt1);
		//ssrLastFramOffset.Blit (rt1, rt4, blitMat, 2);
		beforeAlpha.Blit (rt, rt1);
		//beforeAlpha.Blit (rt1, rt3, blitMat, 1);
		mainCamera.AddCommandBuffer (CameraEvent.AfterForwardAlpha, beforeAlpha);
		//mainCamera.AddCommandBuffer (CameraEvent.BeforeGBuffer, beforeGbuffer);
		//oceanDepthNormalCamera.AddCommandBuffer (CameraEvent.AfterForwardOpaque, ssrLastFramOffset);
		//mainCamera.AddCommandBuffer (CameraEvent.AfterForwardOpaque, beforeAlpha);

	}
	// Update is called once per frame
	void Update () {

		blitMat.SetMatrix ("_MainCameraToWorld", mainCamera.transform.localToWorldMatrix);
		blitMat.SetMatrix ("_MainCameraProjection", mainCamera.projectionMatrix);
		blitMat.SetMatrix ("_MainCameraInvProjection", mainCamera.projectionMatrix.inverse);

		if (mainCamera.fieldOfView != oceanDepthNormalCamera.fieldOfView) {
			oceanDepthNormalCamera.fieldOfView = mainCamera.fieldOfView;
		}
		if (Screen.height != rgbaResult.height || Screen.width != rgbaResult.width) {
			resizeOnce ();
		}
		oceanDepthNormalCamera.Render ();

		Graphics.Blit (rgbaResult, rgbaFinal, blitMat, 2);
		blitMat.SetMatrix ("_MainWorldToCamera", mainCamera.transform.worldToLocalMatrix);
		Graphics.Blit (rgbaResult, ssrFinal, blitMat, 1);

		Graphics.Blit (voronoiCache, voronoiCache, blitMat, 4);
		Graphics.Blit (voronoiCache, voronoiNormal, blitMat, 5);
		/*
		Graphics.Blit (ssrDepthCache, HiZArray [0]);
		Graphics.Blit (ssrNormalCache, oceanNormalResult);
		generateHiZ ();
		*/
		//beforeAlpha.SetRenderTarget (RTarray, rt2);
		//beforeAlpha.SetGlobalFloat (mainCameraToWorldMatrixId, Time.time % 1);
		/*
		blitMat.SetMatrix ("_Main_Camera_To_World", mainCamera.cameraToWorldMatrix);
		blitMat.SetMatrix ("_Main_Camera_InvProjection", mainCamera.projectionMatrix.inverse);
		Vector4 mainCameraParam = new Vector4 (mainCamera.transform.position.x, mainCamera.transform.position.y, mainCamera.transform.position.z, mainCamera.farClipPlane);
		blitMat.SetVector ("_Main_Camera_param", mainCameraParam);
		*/
		//oceanDepthNormalCamera.Render ();

		//Shader.SetGlobalMatrix ("_Main_Camera_To_World", mainCamera.cameraToWorldMatrix);
		if (lastBool != thisBool) {
			UpdateAllValue ();
			resizeOnce ();
			lastBool = thisBool;
		}

	}
	void LateUpdate()
	{
		//ssrCamera.Render ();

		//UpdateCamera();
	}
	void OnPreRender()
	{
		//ssrCamera.Render ();
	}
	void OnPreCull()
	{
	}
	void OnPostRender()
	{
		blitMat.SetMatrix ("_MainWorldToCamera", mainCamera.transform.worldToLocalMatrix);
	}
	// void OnRenderImage(RenderTexture source, RenderTexture destination)
	// {
	// 	Debug.Log("----");
	// 	Graphics.Blit(colorRT, destination);
	// }
}
