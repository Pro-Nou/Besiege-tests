using UnityEngine;
using System.Collections;

public class ppraincompute : MonoBehaviour {
	public ComputeShader rainCS;
	private ComputeBuffer rainBuffer;
    public Material rainMat;

    public int mParticleCount;
    private int initId;

	struct ParticleData
    {
        public Vector3 pos;
    }
	// Use this for initialization
	void Start()
    {
        //struct中一共7个float，size=28
        rainBuffer = new ComputeBuffer(mParticleCount, 12);
        ParticleData[] particleDatas = new ParticleData[mParticleCount];
        rainBuffer.SetData(particleDatas);
        initId = rainCS.FindKernel("InitParticle");
        rainCS.SetBuffer(initId, "ParticleBuffer", rainBuffer);
        rainCS.Dispatch(initId, mParticleCount / 64, 1, 1);
		rainMat.SetBuffer("_particleDataBuffer", rainBuffer);
		rainMat.SetFloat("_totalCount", mParticleCount);
    }

    void Update()
    {

    }

    void OnRenderObject()
    {
        rainMat.SetPass(0);
		Graphics.DrawProcedural(MeshTopology.Points, mParticleCount);
    }

    void OnDestroy()
    {
        rainBuffer.Release();
        rainBuffer = null;
    }
}
