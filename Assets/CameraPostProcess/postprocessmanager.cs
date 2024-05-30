using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.Rendering;
//[ExecuteInEditMode]

public class postprocessmanager : MonoBehaviour {

	//[Range(1, 128)]
	public static postprocessmanager instance;

	public bool SSREnable;
	public float SSRDistance;
	public float reflProbeDistance;
	[Range(0f, 1f)]
	public float SSShadowPixelBias;
	[Range(0f, 1f)]
	public float SSShadowPixelThickness;
	[Range(0f, 1f)]
	public float SSRPixelBias;
	[Range(0f, 1f)]
	public float SSRPixelThickness;
	[Range(0, 128)]
	public float SSRCrossFadeDistance;
	[Range(0, 7)]
	public float SSRQuality;
	[Range(0, 4)]
	public float SSRResDecrease;
	[Range(0, 4)]
	public float SSRTResDecrease;
	[Range(0, 512)]
	public float SSRMaxStep;
	[Range(0, 512)]
	public float SSShadowMaxStep;
	public Texture2D SSRMask;
	public float SSRMaskScale;

	public struct LightData // 4+3+3+1+1+1+1+1 = 15 floats, 15 * 4 = 68 bytes
	{
		public Color lightColor; // 4
		public Vector3 position; // 3
		public Vector3 forward; // 3
		public float distance; // 1
		public float angleCos; // 1
		public float angleCrossFade; // 1
		public float ambientAmount; // 1
		public bool castShadow; // 1
	}
	public List<int> lightDataKeys;
	public Dictionary<int, LightData> lightDatas;
	public ComputeBuffer lightBuffer;

	public struct cameraMatrixs // 4 matrix, 64 floats, 256 bytes
	{
		public Matrix4x4 _MainWorldToCamera;
		public Matrix4x4 _MainCameraToWorld;
		public Matrix4x4 _MainCameraProjection;
		public Matrix4x4 _MainCameraInvProjection;
	}
	public cameraMatrixs[] cameraMatrixArray;
	public ComputeBuffer cameraMatrixBuffer;

	public ComputeShader ssrtCompute;
	private int ssrtComputeId;

	public cloudMove cloudmove;
	public float oceanHeight;
	public float oceanDensity;
	public float oceanDensityMin;
	public float oceanUnderWaterVisiableDistance;
	public Color oceanBaseColor;
	public Color oceanSecondColor;
	public Texture2D oceanHeightMap;
	public Vector2 oceanHeightMapScale;
	public float oceanHeightScale;
	public Texture2D oceanWaveCullMap;
	public Vector2 oceanWaveCullMapScale;
	public float oceanWaveCullScale;
	public Vector4 oceanWaveSpeed;
	public Texture2D oceanBumpMap;
	public float oceanBumpScale;
	public float oceanReflectAmount;
	public float bubbleStartHeight;
	public float bubbleAlphaMulti;

	[Range(0, 1)]
	public float rainVisibility;
	[Range(0, 1)]
	public float afterRainAmount;
	public GameObject oceanObject;
	public GameObject skyboxObject;

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
	public RenderTexture ssrtSpecPre;
	public RenderTexture ssrtSpecFinal;
	public RenderTexture ssrtDiffFinal;
	public RenderTexture voronoiCache;
	public RenderTexture voronoiNormal;
	public ReflectionProbe reflProbe;
	private CommandBuffer ssrLastFramOffset;
	private CommandBuffer beforeAlpha;

	public Texture2D rainMap;
	public Texture2D rainDropMap;
	public Texture2D rainDropNormalMap;
	public Vector4 RainUVTile;
	public Vector4 RainDropDistortionTile;
	[Range(0, 10)]
	public float RainDropScale;
	[Range(0, 10)]
	public float RainDropDistortion;

	public Texture2D pondingMap;
	public Texture2D pondingMapCull;
	public Texture2D pondingWaveMap;
	public Vector4 pondingUVTile;

	private RenderTargetIdentifier rt;
	private RenderTargetIdentifier rt1;

	public bool thisBool;
	private void Awake()
	{
		lightDatas = new Dictionary<int, LightData> ();
		lightDataKeys = new List<int> ();

		//lightDatas = new List<LightData> ();
		lightBuffer = new ComputeBuffer(256, 60);//256 lights, 60bytes per light
		cameraMatrixArray = new cameraMatrixs[1];
		cameraMatrixBuffer = new ComputeBuffer (1, 256);
	} 
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
		float ssrtResDec = Mathf.Pow (2, SSRTResDecrease);
		resizeRT (ref rgbaResult, new Vector2(Screen.width, Screen.height));
		resizeRT (ref rgbaFinal, new Vector2(Screen.width, Screen.height));
		resizeRT (ref ssrDepthCache, new Vector2(Screen.width, Screen.height));
		resizeRT (ref ssrNormalCache, new Vector2(Screen.width, Screen.height));
		resizeRT (ref ssrtSpecPre, new Vector2(Screen.width, Screen.height));
		//resizeRT (ref ssrtSpecPre, new Vector2(Screen.width / ssrtResDec, Screen.height / ssrtResDec));
		//resizeRT (ref ssrFinal, new Vector2(Screen.width, Screen.height));
		resizeRT (ref ssrFinal, new Vector2(1024f / ssrResDec, 1024f / ssrResDec));
		resizeRT (ref ssrtSpecFinal, new Vector2(1024f / ssrtResDec, 1024f / ssrtResDec));
		resizeRT (ref ssrtDiffFinal, new Vector2(1024f / ssrtResDec, 1024f / ssrtResDec));
		ssrtCompute.SetFloat("_ResultResolution", 1024f / ssrtResDec);
		ssrtCompute.SetVector("_ScreenParams", new Vector4(Screen.width, Screen.height, 1, 1));

		RenderBuffer[] rb = new RenderBuffer[3];
		rb [0] = ssrDepthCache.colorBuffer;
		rb [1] = ssrNormalCache.colorBuffer;
		rb [2] = ssrtSpecPre.colorBuffer;
		oceanDepthNormalCamera.SetTargetBuffers(rb, ssrDepthCache.depthBuffer);
	}
	void UpdateAllValue()
	{
		reflProbe.nearClipPlane = reflProbeDistance;
		reflProbe.farClipPlane = mainCamera.farClipPlane;
		Shader.SetGlobalTexture ("_MainCameraReflProbe", reflProbe.texture);

		oceanDepthNormalCamera.farClipPlane = SSRDistance;
		Shader.SetGlobalTexture("_MainCameraRGBAPre", rgbaResult);
		Shader.SetGlobalTexture("_MainCameraRGBAMap", rgbaFinal);
		Shader.SetGlobalTexture("_MainCameraOceanDepth", ssrDepthCache);
		Shader.SetGlobalTexture("_MainCameraOceanNormal", ssrNormalCache);
		Shader.SetGlobalTexture("_MainCameraSpecPre", ssrtSpecPre);
		Shader.SetGlobalTexture("_MainCameraSSRMap", ssrFinal);
		Shader.SetGlobalTexture("_MainCameraSSRTSpecMap", ssrtSpecFinal);
		Shader.SetGlobalTexture("_MainCameraSSRTDiffMap", ssrtDiffFinal);

		if (SSREnable) {
			Shader.EnableKeyword ("_SSRENABLE_ON");
		} else {
			Shader.DisableKeyword ("_SSRENABLE_ON");
		}
		reflProbe.gameObject.SetActive (SSREnable);
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
		Shader.SetGlobalFloat ("_OceanDensity", oceanDensity);
		Shader.SetGlobalFloat ("_OceanDensityMin", oceanDensityMin);
		Shader.SetGlobalFloat ("_OceanUnderWaterVisiableDistance", oceanUnderWaterVisiableDistance);
		Shader.SetGlobalFloat ("_BubbleStartHeight", bubbleStartHeight);
		Shader.SetGlobalFloat ("_BubbleAlphaMulti", bubbleAlphaMulti);

		Shader.SetGlobalFloat ("_rainVisibility", rainVisibility);
		Shader.SetGlobalFloat ("_AfterRainAmount", afterRainAmount);
		Shader.SetGlobalTexture("_RainMap", rainMap);
		Shader.SetGlobalTexture("_RainDropMap", rainDropMap);
		Shader.SetGlobalTexture("_RainDropNormalMap", rainDropNormalMap);
		Shader.SetGlobalFloat ("_RainDropScale", RainDropScale);
		Shader.SetGlobalFloat ("_RainDropDistortion", RainDropDistortion);
		Shader.SetGlobalVector ("_RainUVTile", RainUVTile);
		Shader.SetGlobalVector ("_RainDropDistortionTile", RainDropDistortionTile);
		Shader.SetGlobalTexture ("_PondingMap", pondingMap);
		Shader.SetGlobalTexture ("_PondingMapCull", pondingMapCull);
		Shader.SetGlobalTexture ("_PondingWaveMap", pondingWaveMap);
		Shader.SetGlobalVector ("_PondingUVTile", pondingUVTile);

		InitSSRTCompute ();

		blitMat.SetTexture ("_VoronoiMap", voronoiCache);
		Shader.SetGlobalTexture("_VoronoiNormal", voronoiNormal);
		Vector3 oldPos = oceanObject.transform.position;
		oldPos.y = oceanHeight;
		oceanObject.transform.position = oldPos;

		Material oceanMat = oceanObject.GetComponent<MeshRenderer> ().materials [1];
		oceanMat.SetColor("_OceanBaseColor", oceanBaseColor);
		oceanMat.SetColor("_OceanSecondColor", oceanSecondColor);
		oceanMat.SetTexture("_OceanHeightMap", oceanHeightMap);
		oceanMat.SetTextureScale("_OceanHeightMap", oceanHeightMapScale);
		oceanMat.SetFloat ("_OceanHeightScale", oceanHeightScale);
		oceanMat.SetTexture ("_OceanWaveCullMap", oceanWaveCullMap);
		oceanMat.SetTextureScale("_OceanWaveCullMap", oceanWaveCullMapScale);
		oceanMat.SetFloat ("_OceanWaveCullScale", oceanWaveCullScale);
		oceanMat.SetVector ("_OceanWaveSpeed", oceanWaveSpeed);
		oceanMat.SetTexture ("_BumpMap", oceanBumpMap);
		oceanMat.SetFloat ("_BumpScale", oceanBumpScale);
		oceanMat.SetFloat ("_ReflectAmount", oceanReflectAmount);
		oceanObject.GetComponent<MeshRenderer> ().materials [0].CopyPropertiesFromMaterial (oceanMat);
		oceanObject.transform.GetChild (0).gameObject.GetComponent<MeshRenderer> ().material.CopyPropertiesFromMaterial (oceanMat);
		cloudmove.oceanHeightFix (oceanHeight);

	}
	public void AddSSRTCaster(int key, LightData value){
		lightDatas.Add (key, value);
		lightDataKeys.Add (key);
	}
	public void RemoveSSRTCaster(int key){
		if (lightDatas.ContainsKey (key)) {
			lightDatas.Remove (key);
			lightDataKeys.Remove (key);
		}
	}
	public void TransformSSRTCaster(int key, LightData value){
		if (lightDatas.ContainsKey (key)) {
			lightDatas [key] = value;
		}
	}
	public void InitSSRTCompute() {
		ssrtSpecFinal.Release ();
		ssrtSpecFinal.enableRandomWrite = true;
		ssrtSpecFinal.Create ();
		ssrtDiffFinal.Release ();
		ssrtDiffFinal.enableRandomWrite = true;
		ssrtDiffFinal.Create ();
		ssrtComputeId = ssrtCompute.FindKernel("CSMain");
		ssrtCompute.SetTexture(ssrtComputeId, "Result", ssrtSpecFinal);
		ssrtCompute.SetTexture(ssrtComputeId, "ResultDiff", ssrtDiffFinal);
		ssrtCompute.SetTexture(ssrtComputeId, "_MainCameraOceanDepth", ssrDepthCache);
		ssrtCompute.SetTexture(ssrtComputeId, "_MainCameraOceanNormal", ssrNormalCache);
		ssrtCompute.SetTexture(ssrtComputeId, "_MainCameraSpecPre", ssrtSpecPre);
		ssrtCompute.SetFloat("_SSShadowMaxStep", SSShadowMaxStep);
		ssrtCompute.SetFloat("_SSShadowPixelBias", SSShadowPixelBias);
		ssrtCompute.SetFloat("_SSShadowPixelThickness", SSShadowPixelThickness);
		ssrtCompute.SetFloat("_SSRDistance", SSRDistance);
		ssrtCompute.SetFloat("_OceanHeight", oceanHeight);
	}
	private void UpdateSSRT()
	{
		Debug.Log (lightDataKeys.Count);
		while (lightDataKeys.Count > 256) {
			RemoveSSRTCaster(lightDataKeys [0]);
		}
		LightData[] lightDataArray = new LightData[lightDatas.Count];
		lightDatas.Values.CopyTo (lightDataArray, 0);
		lightBuffer.SetData (lightDataArray);
		ssrtCompute.SetBuffer (ssrtComputeId, "_LightDataDataBuffer", lightBuffer);
		ssrtCompute.SetFloat ("_LightCount", lightDatas.Count);
		cameraMatrixArray [0]._MainCameraInvProjection = mainCamera.projectionMatrix.inverse;
		cameraMatrixArray [0]._MainCameraProjection = mainCamera.projectionMatrix;
		cameraMatrixArray [0]._MainCameraToWorld = mainCamera.transform.localToWorldMatrix;
		cameraMatrixArray [0]._MainWorldToCamera = mainCamera.transform.worldToLocalMatrix;
		cameraMatrixBuffer.SetData (cameraMatrixArray);
		ssrtCompute.SetBuffer (ssrtComputeId, "_CameraMatrixs", cameraMatrixBuffer);
		//blitMat.SetBuffer ("_LightDataDataBuffer", lightBuffer);
		//blitMat.SetFloat ("_LightCount", lightDatas.Count);
	}
	// Use this for initialization
	void Start () {
		thisBool = false;

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
		skyboxObject.GetComponent<MeshFilter> ().mesh.bounds = infBound;


		//resizeHiZ ();

		//oceanDepthNormalCamera.targetTexture = oceanDepthResult;
		//ssrCamera.enabled = false;

		UpdateAllValue ();
		resizeOnce ();
		//ssrLastFramOffset = new CommandBuffer ();
		beforeAlpha = new CommandBuffer ();
		rt = new RenderTargetIdentifier(mainCamera.targetTexture);
		rt1 = new RenderTargetIdentifier(rgbaResult);
		//Debug.Log (rt1);
		//ssrLastFramOffset.Blit (rt1, rt4, blitMat, 2);
		beforeAlpha.Blit (rt, rt1);
		//beforeAlpha.Blit (rt1, rt3, blitMat, 1);
		mainCamera.AddCommandBuffer (CameraEvent.AfterForwardAlpha, beforeAlpha);
		// mainCamera.AddCommandBuffer (CameraEvent.BeforeForwardAlpha, beforeAlpha);

		instance = this;
		//mainCamera.AddCommandBuffer (CameraEvent.BeforeGBuffer, beforeGbuffer);
		//oceanDepthNormalCamera.AddCommandBuffer (CameraEvent.AfterForwardOpaque, ssrLastFramOffset);
		//mainCamera.AddCommandBuffer (CameraEvent.AfterForwardOpaque, beforeAlpha);

	}
	void PreRenderUpdate() {
		blitMat.SetMatrix ("_MainCameraToWorld", mainCamera.transform.localToWorldMatrix);
		blitMat.SetMatrix ("_MainCameraProjection", mainCamera.projectionMatrix);
		blitMat.SetMatrix ("_MainCameraInvProjection", mainCamera.projectionMatrix.inverse);


		Graphics.Blit (rgbaResult, rgbaFinal, blitMat, 2);
		// Graphics.Blit (rgbaResult, rgbaFinal);
		blitMat.SetMatrix ("_MainWorldToCamera", mainCamera.transform.worldToLocalMatrix);
		if (SSREnable) {
			UpdateSSRT ();
			//ssrtCompute.Dispatch(ssrtComputeId, ssrtSpecFinal.width / 8, ssrtSpecFinal.height / 8, 1);
			//Graphics.Blit (rgbaResult, ssrFinal, blitMat, 1);
		}

		if (rainVisibility > 0.2) {
			Graphics.Blit (voronoiCache, voronoiCache, blitMat, 4);
		}
		Graphics.Blit (voronoiCache, voronoiNormal, blitMat, 5);
	}
	// Update is called once per frame
	void Update () {


		if (mainCamera.fieldOfView != oceanDepthNormalCamera.fieldOfView) {
			oceanDepthNormalCamera.fieldOfView = mainCamera.fieldOfView;
		}
		if (Screen.height != rgbaResult.height || Screen.width != rgbaResult.width) {
			resizeOnce ();
		}

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
		//if (lastBool != thisBool) {
		if (Input.GetKeyDown(KeyCode.R) && Input.GetKey(KeyCode.LeftShift)) {
			UpdateAllValue ();
			resizeOnce ();
		}

		PreRenderUpdate ();
	}
	// void LateUpdate()
	// {
	// 	//ssrCamera.Render ();

	// 	//UpdateCamera();
	// }
	void OnPreRender()
	{
		oceanDepthNormalCamera.Render ();
		if (SSREnable) {
			//UpdateSSRT ();
			ssrtCompute.Dispatch(ssrtComputeId, ssrtSpecFinal.width / 8, ssrtSpecFinal.height / 8, 1);
			Graphics.Blit (rgbaResult, ssrFinal, blitMat, 1);
		}
		//ssrCamera.Render ();
	}
	void OnPreCull()
	{
	}
	void OnPostRender()
	{
		blitMat.SetMatrix ("_MainWorldToCamera", mainCamera.transform.worldToLocalMatrix);
	}

	void OnDestroy()
	{
		lightBuffer.Release();
		lightBuffer = null;
		cameraMatrixBuffer.Release ();
		cameraMatrixBuffer = null;
	}
	// void OnRenderImage(RenderTexture source, RenderTexture destination)
	// {
	// 	Debug.Log("----");
	// 	Graphics.Blit(colorRT, destination);
	// }
}
