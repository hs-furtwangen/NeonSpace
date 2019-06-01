using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Character_controller : MonoBehaviour
{
    public GameObject hook;
    public Rigidbody rigidbody;
    public CameraController cameraControll;
    public float maxDistance = 250f;

    public float acceleration = 1;

    [SerializeField]
    bool pull = false;
    [SerializeField]
    bool grab = false;
    [SerializeField]
    private float holdDistance = 0f;
    private bool hookHit;

    Vector3 invalidVector = new Vector3(Mathf.Infinity, Mathf.Infinity, Mathf.Infinity);
    Vector3 target;
    LineRenderer cable;
    public GameObject hookshot;

    void Update()
    {
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

                this.transform.LookAt(target);
                if (target != invalidVector)
                {
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
            retractHook();
        }
    }
    void Start()
    {
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
                    Vector3 oldPos = rigidbody.position;
                    Vector3 newPos = Vector3.Lerp(rigidbody.position, (target - Vector3.ClampMagnitude((target - this.rigidbody.position), holdDistance)), 1);
                    rigidbody.position = newPos;
                    Vector3 newDirection = newPos - oldPos;
                    Quaternion rotation = Quaternion.FromToRotation(oldPos, newDirection);
                    Debug.DrawRay(rigidbody.position, rigidbody.velocity * maxDistance, Color.red, 1);
                    //rigidbody.velocity = Vector3.RotateTowards(rigidbody.velocity, newPos, angle, 1);
                    //rigidbody.AddForce(-rigidbody.velocity * Time.deltaTime);
                    rigidbody.velocity = rotation * rigidbody.velocity;
                    Debug.DrawRay(rigidbody.position, rigidbody.velocity * maxDistance, Color.green, 1);
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
        }
    }
    private void shootHook()
    {
        if(target != invalidVector)
        {
            cable.enabled = true;
            hook.transform.position = Vector3.Lerp(hook.transform.position, target, Time.deltaTime * acceleration);
            if (Vector3.Distance(hook.transform.position, target) < 0.1)
            {
                hook.transform.position = target;
            }
            cable.SetPosition(0, hookshot.transform.position);
            cable.SetPosition(1, hook.transform.position);
            if (hook.transform.position == target)
            {
                hookHit = true;
            }
        }
    }
    private void retractHook()
    {
        cable.enabled = true;
        hook.transform.position = Vector3.Lerp(hook.transform.position, hookshot.transform.position, Time.deltaTime * acceleration);
        if (Vector3.Distance(hook.transform.position, hookshot.transform.position) < 0.1)
        {
            hook.transform.position = hookshot.transform.position;
        }
        cable.SetPosition(0, hookshot.transform.position);
        cable.SetPosition(1, hook.transform.position);
        if (hook.transform.position == hookshot.transform.position)
        {
            hookHit = false;
        }
    }
    

}
