using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameControll : MonoBehaviour
{
    Character_controller character;
    public Animator countdown;
    bool gameOn = false;
    bool finish = false;
    float currentTime;
    public Text timer_display;
    
    // Start is called before the first frame update
    void Start()
    {
        character = GameObject.FindGameObjectWithTag("Player").GetComponent<Character_controller>();

    }

    // Update is called once per frame
    void Update()
    {
        if(gameOn && !finish)
        {
            currentTime += Time.deltaTime;
            int minutes = (int)(currentTime / 60);
            int seconds = (int)(currentTime % 60);
            int fraction = (int)((currentTime * 100) % 100);
            //Debug.Log(string.Format("{0:00}:{1:00}:{2:000}", minutes, seconds, fraction));
            timer_display.text = string.Format("{0:00}:{1:00}:{2:000}", minutes, seconds, fraction);
            Debug.Log("Goals To Go: " + character.getGoalsToGo());
            if(character.getGoalsToGo() == 0)
            {
                character.setFrozen(true);
                countdown.SetBool("Finish", true);
                finish = true;
            }
        }
        else if(!finish)
        {
            Debug.Log(countdown.GetBool("Start"));
            if(countdown.GetBool("Start"))
            {
                gameOn = true;
                character.setFrozen(false);
            }
        }
    }
}
