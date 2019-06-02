using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Goal : MonoBehaviour
{
    public GameObject flag;
    private void Start()
    {
        this.gameObject.tag = "Planet";
    }

    public void Goal_activated()
    {
        Instantiate(flag, this.gameObject.transform);
        //Debug.Log("Triggered Goal");
        Destroy(this);
    }
}
