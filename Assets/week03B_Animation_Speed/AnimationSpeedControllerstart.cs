using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationSpeedControllerstart : MonoBehaviour
{
    Animator Anim;
    // Start is called before the first frame update
    void Start()
    {
        
        Anim = GetComponent<Animator>();
        Anim.speed = 0.0f; //���ǵ尪... �������������
    }

    // Update is called once per frame
    void Update()
    {
       if(Input.GetKeyDown(KeyCode.P))
        {
            Anim.speed = 1.0f; //�Ҽ��� �� ��� ���� f �־����
        }
       if (Input.GetKeyDown(KeyCode.S))
        {
            Anim.speed = 0;
        }
        if (Input.GetKeyDown(KeyCode.Q))
        {
            Anim.speed = 2.0f;
        }
    }
}
