using UnityEngine;
using System.Collections;

public class ppbubbleCompute : MonoBehaviour {

	public ComputeShader bubbleCS;
	private ComputeBuffer bubbleBuffer;
    public Material bubbleMat;

    private int mParticleCount;
	public int totalCount = 64;
	public int countPerBubble = 4;
    private int initId;

	struct ParticleData
    {
        public Vector3 pos;
		public Vector3 offsetDir;
    }
	// Use this for initialization
	void Start()
    {
		mParticleCount = totalCount * countPerBubble;
        //struct中一共7个float，size=28
        bubbleBuffer = new ComputeBuffer(mParticleCount, 24);
        ParticleData[] particleDatas = new ParticleData[mParticleCount];
        bubbleBuffer.SetData(particleDatas);
        initId = bubbleCS.FindKernel("InitParticle");
		bubbleCS.SetFloat("totalCount", totalCount);
		bubbleCS.SetFloat("countPerGroup", countPerBubble);
        bubbleCS.SetBuffer(initId, "ParticleBuffer", bubbleBuffer);
        bubbleCS.Dispatch(initId, mParticleCount / 64, 1, 1);
		bubbleMat.SetBuffer("_particleDataBuffer", bubbleBuffer);
		bubbleMat.SetFloat("_totalCount", totalCount);
		bubbleMat.SetFloat("_countPerBubble", countPerBubble);
    }

    void Update()
    {

    }

    void OnRenderObject()
    {
        bubbleMat.SetPass(0);
		Graphics.DrawProcedural(MeshTopology.Points, mParticleCount);
    }

    void OnDestroy()
    {
        bubbleBuffer.Release();
        bubbleBuffer = null;
    }
}
