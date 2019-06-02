using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Goal : MonoBehaviour
{
    private void Start()
    {
        this.gameObject.tag = "Planet";
    }

    public void Goal_activated()
    {
        Debug.Log("Triggered Goal");
        Destroy(this);
    }
}
