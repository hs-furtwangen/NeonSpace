using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Asteroid : MonoBehaviour
{
    static float mass_modifier = 100;
    // Start is called before the first frame update
    void Start()
    {
        Rigidbody rigidbody = gameObject.GetComponent<Rigidbody>();
        float size_mean = (transform.localScale.x + transform.localScale.y + transform.localScale.z) / 3;
        rigidbody.mass = size_mean * mass_modifier;
    }
}
