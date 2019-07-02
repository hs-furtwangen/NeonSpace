using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Character_controller : MonoBehaviour
{
    public GameObject hook;
    public Rigidbody rigidbody;
    public CameraController cameraControll;
    public float maxDistance = 250f;
    public Image charge_bar;

    public float acceleration = 1;

    [SerializeField]
    bool pull = false;
    [SerializeField]
    bool grab = false;
    [SerializeField]
    bool boost = false;
    [SerializeField]
    bool landed = false;
    private float holdDistance = 0f;
    private bool hookHit;
    private float charge = 0;
    Vector3 invalidVector = new Vector3(10000, 10000, 10000);
    Vector3 target;
    LineRenderer cable;
    public GameObject hookshot;
	public Vector3 velocityBeforePause;
	public Transform startposition;

    int goalsToGo;
    bool frozen = true;

    private void OnCollisionEnter(Collision collision)
    {
        landed = true;
        charge = 1;
        if(collision.gameObject.GetComponent<Goal>() != null)
        {
            Goal goal = collision.gameObject.GetComponent<Goal>();

			if (!goal.isActivated) {
				goal.Goal_activated();
				goalsToGo -= 1;
			}
            
            if(goalsToGo == 0)
            {
                Debug.Log("You Win!!");
            }
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        landed = false;
    }

	private void OnTriggerExit(Collider collision)
	{
		if (collision.gameObject.name == "Level") {
			gameObject.transform.position = gameObject.transform.position * -1;
		}
	}

    void Update()
    {
        if (!frozen) { 
        if(Input.GetKeyDown("space"))
        {
            boost = true;
        }
        else if(Input.GetButtonUp("space"))
        {
            boost = false;
        }
        if (Input.GetMouseButton(0) || Input.GetMouseButton(1))
        {
            if (grab)
            {
                grabToTarget(target);
            }
            else if (pull)
            {
                pullToTarget(target);
            }
            else if (!hookHit)
            {
                target = findTarget();
                
                
                if (target != invalidVector)
                {
                    this.transform.LookAt(target);
                    if (Input.GetMouseButton(0))
                    {
                        pull = true;
                        grab = false;
                    }
                    else if (Input.GetMouseButton(1))
                    {
                        holdDistance = Vector3.Distance(rigidbody.position, target);
                        grab = true;
                        pull = false;
                    }
                }

            }
				velocityBeforePause = rigidbody.velocity;
        }
        if (!Input.GetMouseButton(0))
        {
            pull = false;
        }
        if (!Input.GetMouseButton(1))
        {
            grab = false;
        }
        if (!Input.GetMouseButton(0) && !Input.GetMouseButton(1))
        {
            rigidbody.freezeRotation = false;
            retractHook();
        }
        if(boost)
        {
            boosting();
        }
        charge_bar.fillAmount = charge;
        }
    }
    void Start()
    {
		CountGoals ();
        Debug.Log("THis is how many Planets you gotta visit: " + goalsToGo);
        cable = gameObject.GetComponentInChildren<LineRenderer>();
        cable.positionCount = 2;
        cameraControll.registerCharacter(this);
        // Make the rigid body not change rotation
        rigidbody = gameObject.GetComponent<Rigidbody>();
        if (hook != null)
        {
            if(hookshot != null)
            {
                cable.SetPosition(0, hookshot.transform.position);
                cable.SetPosition(1, hookshot.transform.position);
            }
        }
        target = invalidVector;
		//transform.position = startposition.position;
    }

	public void CountGoals(){
		GameObject[] planets = GameObject.FindGameObjectsWithTag("Planet");
		goalsToGo = planets.Length;
	}

    public int getGoalsToGo()
    {
        return goalsToGo;
    }
    public void setFrozen(bool frozen)
    {
        this.frozen = frozen;
		if (this.frozen) {
			rigidbody.freezeRotation = true;
			rigidbody.constraints = RigidbodyConstraints.FreezeAll;
		} else {
			rigidbody.freezeRotation = false;
			rigidbody.constraints = RigidbodyConstraints.None;
			rigidbody.velocity = velocityBeforePause;
		}
    }

    private Vector3 findTarget()
    {
        RaycastHit hit;
        Physics.Raycast(cameraControll.transform.position, cameraControll.transform.TransformDirection(Vector3.forward), out hit, maxDistance);
        if (hit.collider != null)
        {
            
            return hit.point;
        }
        else
        {
            return (invalidVector);
        }
    }

    private void grabToTarget(Vector3 target)
    {
        if(hook != null)
        {
            shootHook();
        }
        else
        {
            hookHit = true;
        }
        if(hookHit)
        {
            if (Vector3.Distance(this.rigidbody.position, target) < maxDistance)
            {
                rigidbody.freezeRotation = true;
                this.transform.LookAt(target);
                Debug.DrawRay(this.transform.position, (target - this.rigidbody.position), Color.yellow, 1);
                if (Vector3.Distance(this.rigidbody.position, target) >= holdDistance)
                {
                    //Vector3 oldPos = rigidbody.position;
                    //Vector3 newPos = Vector3.Lerp(rigidbody.position, (target - Vector3.ClampMagnitude((target - this.rigidbody.position), holdDistance)), 1);
                    //rigidbody.position = newPos;
                    //Vector3 newDirection = newPos - oldPos;
                    //Quaternion rotation = Quaternion.FromToRotation(oldPos, newDirection);
                    //Debug.DrawRay(rigidbody.position, rigidbody.velocity * maxDistance, Color.red, 1);
                    //rigidbody.velocity = Vector3.RotateTowards(rigidbody.velocity, newPos, angle, 1);
                    //rigidbody.AddForce(-rigidbody.velocity * Time.deltaTime);
                    //rigidbody.velocity = rotation * rigidbody.velocity;
                    //Debug.DrawRay(rigidbody.position, rigidbody.velocity * maxDistance, Color.green, 1);
                    rigidbody.AddForce((target - this.rigidbody.position) * (acceleration * Time.deltaTime), ForceMode.VelocityChange);
                }
            }
        }
        
    }

    private void pullToTarget(Vector3 target)
    {
        if (hook != null)
        {
            shootHook();
        }
        else
        {
            hookHit = true;
        }
        if (hookHit)
        {
            Debug.DrawRay(this.transform.position, (target - this.rigidbody.position), Color.blue, 1);
            if (Vector3.Distance(this.rigidbody.position, target) <= maxDistance)
            {
                rigidbody.freezeRotation = true;
                this.transform.LookAt(target);
                rigidbody.AddForce((target - this.rigidbody.position) * (acceleration * Time.deltaTime));
            }

			if (Vector3.Distance(this.rigidbody.position, target) <= 100)
			{
				rigidbody.velocity = rigidbody.velocity * 0.96f;
			}
        }
    }
    private void shootHook()
    {
        if(target != invalidVector)
        {
            cable.enabled = true;
            hook.transform.position = Vector3.Lerp(hook.transform.position, target, Time.deltaTime * acceleration*2);
            if (Vector3.Distance(hook.transform.position, target) < 0.1)
            {
                hook.transform.position = target;
				hookHit = true;
            }
            cable.SetPosition(0, hookshot.transform.position);
            cable.SetPosition(1, hook.transform.position);
           /* if (hook.transform.position == target)
            {
                hookHit = true;
            }*/
        }
    }
    private void retractHook()
    {
        cable.enabled = true;
        hook.transform.position = Vector3.Lerp(hook.transform.position, hookshot.transform.position, Time.deltaTime * acceleration*2);
        if (Vector3.Distance(hook.transform.position, hookshot.transform.position) < 0.1)
        {
            hook.transform.position = hookshot.transform.position;
			hookHit = false;
        }
        cable.SetPosition(0, hookshot.transform.position);
        cable.SetPosition(1, hook.transform.position);
        /*if (hook.transform.position == hookshot.transform.position)
        {
            hookHit = false;
        }*/
    }
    private void boosting()
    {
        if(charge > 0)
        {
            charge -= Time.deltaTime;
            rigidbody.freezeRotation = true;
            this.transform.LookAt(cameraControll.transform.TransformDirection(Vector3.forward));
            if (landed == true)
            {
                Debug.DrawLine(this.rigidbody.position, this.transform.TransformDirection(Vector3.forward), Color.cyan);
                rigidbody.AddForce(cameraControll.transform.TransformDirection(Vector3.forward) * (acceleration * 2 * Time.deltaTime),ForceMode.Impulse);
            }

            else
            {
                Debug.DrawLine(this.rigidbody.position, this.transform.TransformDirection(Vector3.forward), Color.cyan);
                rigidbody.AddForce(cameraControll.transform.TransformDirection(Vector3.forward) * (acceleration * Time.deltaTime), ForceMode.VelocityChange);
            }
                
            
        }
    }

}
