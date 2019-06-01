using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Character_controller : MonoBehaviour
{
    public Rigidbody rigidbody;
    public Camera camera;
    public Vector3 camera_offset;
    public enum RotationAxes { MouseXAndY = 0, MouseX = 1, MouseY = 2 }
    public RotationAxes axes = RotationAxes.MouseXAndY;
    public float sensitivityX = 15F;
    public float sensitivityY = 15F;
    public float minimumX = -360F;
    public float maximumX = 360F;
    public float minimumY = -360F;
    public float maximumY = 360F;
    public float maxDistance = 250f;
    
    public float acceleration = 1;
    [SerializeField]
    float rotationX = 0F;
    [SerializeField]
    float rotationY = 0F;
    [SerializeField]
    bool flipXAxis = false;
    [SerializeField]
    bool pull = false;
    [SerializeField]
    bool grab = false;
    [SerializeField]
    private float holdDistance = 0f;
    private GameObject camera_pivot;

    Vector3 invalidVector = new Vector3(Mathf.Infinity, Mathf.Infinity, Mathf.Infinity);
    Vector3 target;

    Quaternion originalRotation;


    void Update()
    {
        if (target != invalidVector)
            //Debug.DrawLine(this.transform.position, target, Color.green);
        rotatePlayer();

        
        if (Input.GetMouseButton(0) || Input.GetMouseButton(1) )
        {
            if (grab)
            {
                grabToTarget(target);
            }
            else if (pull)
            {
                pullToTarget(target);
            }
            else if (!pull || !grab)
            { 
                target = findTarget();
                if(target != invalidVector)
                {
                    //Debug.Log(target);
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


    }

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        // Make the rigid body not change rotation
        rigidbody = gameObject.GetComponent<Rigidbody>();
        camera = gameObject.GetComponentInChildren<Camera>();
        camera.transform.position = camera_offset;
        camera_pivot = new GameObject();
        camera_pivot.name = "Camera Pivot";
        camera_pivot.transform.SetParent(this.gameObject.transform);
        camera_pivot.transform.position = this.transform.position;
        camera_pivot.transform.rotation = this.transform.rotation;
        camera.gameObject.transform.SetParent(camera_pivot.transform);
        if (rigidbody)
            rigidbody.freezeRotation = true;
        originalRotation = transform.localRotation;
        target = invalidVector;
    }

    private Vector3 findTarget()
    {
        RaycastHit hit;
        Physics.Raycast(camera.transform.position, this.transform.TransformDirection(Vector3.forward), out hit, maxDistance);
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
        if(Vector3.Distance(this.rigidbody.position, target) < maxDistance)
        { 
            
            Debug.DrawRay(this.transform.position, (target - this.rigidbody.position), Color.yellow, 1);
            if (Vector3.Distance(this.rigidbody.position, target) >= holdDistance)
            {
                Vector3 oldPos = rigidbody.position;
                Vector3 newPos = Vector3.Lerp(rigidbody.position, (target - Vector3.ClampMagnitude((target - this.rigidbody.position), holdDistance)), 1);
                rigidbody.position = newPos;
                Quaternion rotation = Quaternion.FromToRotation(oldPos, newPos*2);
                Debug.DrawRay(rigidbody.position, rigidbody.velocity * maxDistance, Color.red, 1);
                //rigidbody.velocity = Vector3.RotateTowards(rigidbody.velocity, newPos, angle, 1);
                rigidbody.AddForce(-rigidbody.velocity * Time.deltaTime);
                rigidbody.velocity = rotation * rigidbody.velocity;
                Debug.DrawRay(rigidbody.position, rigidbody.velocity * maxDistance, Color.green, 1);
            }
        }


    }

    private void pullToTarget(Vector3 target)
    {
        Debug.DrawRay(this.transform.position, (target - this.rigidbody.position),Color.blue,1);
        if(Vector3.Distance(this.rigidbody.position, target)<= maxDistance)
        {
            rigidbody.AddForce((target - this.rigidbody.position)*(acceleration*Time.deltaTime));
        }
        
    }

    private void rotatePlayer()
    {
        if (axes == RotationAxes.MouseXAndY)
        {
            // Read the mouse input axis
            float mouseDeltaX = Input.GetAxis("Mouse X") * sensitivityX;
            float mouseDeltaY = Input.GetAxis("Mouse Y") * sensitivityY;
            rotationY += mouseDeltaY;
            //Flip X-Rotation if the player is upside down
            if (rotationY < -90 || rotationY > +90F)
                flipXAxis = true;
            else
                flipXAxis = false;
            if (flipXAxis == true)
            {
                rotationX -= mouseDeltaX;
            }
            else
            {
                rotationX += mouseDeltaX;
            }

            rotationX = ClampAngle(rotationX, minimumX, maximumX);
            rotationY = ClampAngle(rotationY, minimumY, maximumY);

            Quaternion xQuaternion = Quaternion.AngleAxis(rotationX, Vector3.up);
            Quaternion yQuaternion = Quaternion.AngleAxis(rotationY, -Vector3.right);
            transform.localRotation = originalRotation * xQuaternion * yQuaternion;
        }
        else if (axes == RotationAxes.MouseX)
        {
            rotationX += Input.GetAxis("Mouse X") * sensitivityX;
            rotationX = ClampAngle(rotationX, minimumX, maximumX);
            Quaternion xQuaternion = Quaternion.AngleAxis(rotationX, Vector3.up);
            transform.localRotation = originalRotation * xQuaternion;
        }
        else
        {
            rotationY += Input.GetAxis("Mouse Y") * sensitivityY;
            rotationY = ClampAngle(rotationY, minimumY, maximumY);
            Quaternion yQuaternion = Quaternion.AngleAxis(-rotationY, Vector3.right);
            transform.localRotation = originalRotation * yQuaternion;
        }
    }
    public static float ClampAngle(float angle, float min, float max)
    {
        if (angle < -360F)
             angle += 360F;
        if (angle > 360F)
             angle -= 360F;
        return Mathf.Clamp(angle, min, max);
    }

}
