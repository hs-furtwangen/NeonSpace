using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameControll : MonoBehaviour
{
    public List<GameObject> canvasPanels = new List<GameObject>();

    Character_controller character;
    CameraController camera;
    public Animator countdown;
    bool gameOn = false;
    bool finish = false;
    bool pause = false;
    float currentTime;
    public Text timer_display;
    public Text finish_time;
    
    // Start is called before the first frame update
    void Start()
    {
        character = GameObject.FindGameObjectWithTag("Player").GetComponent<Character_controller>();
        camera = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<CameraController>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            pause = !pause;
            camera.toggleActive();
            canvasPanels[1].SetActive(pause);

            canvasPanels[0].SetActive(!pause);
            if(!pause)
                character.setFrozen(false);
        }
        if (!pause)
        {

            if (gameOn && !finish)
            {
                currentTime += Time.deltaTime;
                int minutes = (int)(currentTime / 60);
                int seconds = (int)(currentTime % 60);
                int fraction = (int)((currentTime * 100) % 100);
                //Debug.Log(string.Format("{0:00}:{1:00}:{2:000}", minutes, seconds, fraction));
                string time = string.Format("{0:00}:{1:00}:{2:000}", minutes, seconds, fraction);
                timer_display.text = time;
                Debug.Log("Goals To Go: " + character.getGoalsToGo());
                if (character.getGoalsToGo() == 0)
                {
                    character.setFrozen(true);
                    //countdown.SetBool("Finish", true);
                    finish = true;
                    canvasPanels[0].SetActive(false);
                    canvasPanels[2].SetActive(true);
                    finish_time.text = time;
                }
            }
            else if (!finish)
            { 
                if (countdown.GetBool("Start"))
                {
                    gameOn = true;
                    character.setFrozen(false);
                }
            }
        }
        else
        {
            Time.timeScale = 0;
            character.setFrozen(true);
        }
        
    }

    public void MainmenuButton()
    {
        SceneManager.LoadScene(0);
    }

    public void CloseButton()
    {
        canvasPanels[0].SetActive(true);

        for (int i = 1; i < canvasPanels.Count; i++)
        {
            canvasPanels[i].SetActive(false);
        }

        pause = false;
    }
}
