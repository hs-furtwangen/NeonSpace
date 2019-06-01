using System.Collections;
using System.Collections.Generic;
using UnityEngine;
enum size : short
{
    PLANET= 1000,
    ASTEROID = 100,
    DEBRIT = 50
}
public class Asteroid : MonoBehaviour
{
    public float mass_mod = 100;
    // Start is called before the first frame update
    void Start()
    {
        Rigidbody rigidbody = gameObject.GetComponent<Rigidbody>();
        float scale_multiplier = Random.Range(0.5f, 1.5f);
        transform.localScale *= scale_multiplier;
        float size_mean = (transform.localScale.x + transform.localScale.y + transform.localScale.z) / 3;
        rigidbody.mass = size_mean * mass_mod;
        this.enabled = false;
    }
}
