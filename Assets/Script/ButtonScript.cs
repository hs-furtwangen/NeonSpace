using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonScript : MonoBehaviour {
	public List<GameObject> canvasPanels = new List<GameObject>();
	int howToState = 0;
	
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
	
	public void StartButton(){
		//Starte Spiel
	}
	
	public void HowToButton(){
		canvasPanels[0].SetActive(false);
		canvasPanels[2].SetActive(true);
		howToState = 0;
	}
	
	public void ForwardButton(){
		howToState++;
		
		canvasPanels[2 + howToState -1].SetActive(false);
		canvasPanels[2 + howToState].SetActive(true);
	}
	
	public void BackButton(){
		howToState--;
		
		canvasPanels[2 + howToState +1].SetActive(false);
		canvasPanels[2 + howToState].SetActive(true);
	}
	
	public void MainmenuButton(){
		//Laden der Startscene wenn Spieler Spiel verlassen will
	}
	
	public void CreditsButton(){
		canvasPanels[0].SetActive(false);
		canvasPanels[1].SetActive(true);
	}
	
	public void CloseButton(){
		canvasPanels[0].SetActive(true);
		
		for(int i = 1; i<canvasPanels.Count; i++){
			canvasPanels[i].SetActive(false);
		}
	}
	
	public void QuitButton(){
		//Schließe Spiel
	}
}
