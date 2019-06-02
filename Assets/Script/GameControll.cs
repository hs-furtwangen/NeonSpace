using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameControll : MonoBehaviour
{
    CharacterController character;
    public Canvas UI;
    bool gameOn = false;
    float currentTime;
    public Text timer_display;
    
    // Start is called before the first frame update
    void Start()
    {
        character = GameObject.FindGameObjectWithTag("Player").GetComponent<CharacterController>();

    }

    // Update is called once per frame
    void Update()
    {
        if(gameOn)
        {
            currentTime += Time.deltaTime;
            int minutes = (int)(currentTime / 60);
            int seconds = (int)(currentTime % 60);
            int fraction = (int)((currentTime * 100) % 100);
            timer_display.text = string.Format("{0:00}:{1:00}:{2:000}", minutes, seconds, fraction);
        }

    }
}
