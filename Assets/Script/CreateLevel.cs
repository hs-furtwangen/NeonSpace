using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CreateLevel : MonoBehaviour{
	public GameObject[] levelObjects;

	private float expansionOfTheUnivers = 10;

	// Start is called before the first frame update
    void Start()
    {
		foreach (GameObject levelObject in levelObjects) {
			Instantiate (levelObject, this.gameObject.transform);

			levelObject.transform.position = new Vector3 (Random.Range (-10, 10) * expansionOfTheUnivers, Random.Range (-10, 10) * expansionOfTheUnivers, Random.Range (-10, 10) * expansionOfTheUnivers);

			expansionOfTheUnivers += 5;
		}
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
