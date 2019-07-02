using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Goal : MonoBehaviour
{
    public GameObject flag;
	public bool isActivated = false;
	private GameObject myFlag;
	private GameControll gameController;

	private void Start()
    {
        this.gameObject.tag = "Planet";
		gameController = GameObject.FindGameObjectWithTag("GameController").GetComponent<GameControll>();
    }

	void Update(){
		if (gameController.restartLevel && isActivated) {
			isActivated = false;
			Destroy (myFlag);
		}
	}

    public void Goal_activated()
    {
        myFlag = Instantiate(flag, this.gameObject.transform);
		isActivated = true;

		//Debug.Log("Triggered Goal");
        //Destroy(this);
    }
}
