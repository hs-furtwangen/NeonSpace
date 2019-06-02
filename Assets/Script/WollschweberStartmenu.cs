using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WollschweberStartmenu : MonoBehaviour {
	Vector3 mouse = new Vector3();
	Vector3 mouseWorld = new Vector3();
	Vector3 mouseForward = new Vector3();
	Vector2 faceDirection = new Vector2();
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		mouse = Input.mousePosition;
		mouseWorld = Camera.main.ScreenToWorldPoint(mouse);
		
		faceDirection = new Vector2(mouseWorld.x - transform.position.x, mouseWorld.y - transform.position.y);
		//mouseForward = mouseWorld + transform.position;
		transform.up = faceDirection;
		//transform.rotation = Quaternion.LookRotation(mouseForward, Vector3.forward);
	}
}
