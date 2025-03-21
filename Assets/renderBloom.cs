﻿using UnityEngine;
using System.Collections;

/// <summary>
/// 渲染需要广泛那部分的图
/// </summary>
public class renderBloom : MonoBehaviour
{
	/// <summary>
	/// 主摄像机
	/// </summary>
	public Camera m_FollowCamera;

	/// <summary>
	/// 渲染需要泛光的摄像机
	/// </summary>
	private Camera m_Camera;

	/// <summary>
	/// 替换shader
	/// </summary>
	public Shader replaceShader;

	void Start()
	{
		m_Camera = GetComponent<Camera>();
		//摄像机背景要设置为黑色
		m_Camera.CopyFrom(m_Camera);
		m_Camera.enabled = false;
		m_Camera.clearFlags = CameraClearFlags.SolidColor;
		m_Camera.backgroundColor = Color.black;
		//UpdateCamera();
		//UpdateCameraSetting();
		Debug.Log(Screen.height);
		Debug.Log(Screen.width);
	}

	void LateUpdate()
	{
		m_Camera.RenderWithShader(replaceShader, "RenderType");
		//UpdateCamera();
		//调用渲染
	}

	void UpdateCamera()
	{
		transform.position = m_FollowCamera.transform.position;
		transform.rotation = m_FollowCamera.transform.rotation;
	}

	void UpdateCameraSetting()
	{
		m_Camera.orthographic = m_FollowCamera.orthographic;
		m_Camera.orthographicSize = m_FollowCamera.orthographicSize;
		m_Camera.nearClipPlane = m_FollowCamera.nearClipPlane;
		m_Camera.farClipPlane = m_FollowCamera.farClipPlane;
		m_Camera.fieldOfView = m_FollowCamera.fieldOfView;
	}
}