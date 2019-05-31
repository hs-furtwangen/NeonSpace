using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Character_controller : MonoBehaviour
{
    public Rigidbody rigidbody;
    public enum RotationAxes { MouseXAndY = 0, MouseX = 1, MouseY = 2 }
    public RotationAxes axes = RotationAxes.MouseXAndY;
    public float sensitivityX = 15F;
    public float sensitivityY = 15F;
    public float minimumX = -360F;
    public float maximumX = 360F;
    public float minimumY = -360F;
    public float maximumY = 360F;
    public float grabDistance = 250f;
    [SerializeField]
    float rotationX = 0F;
    [SerializeField]
    float rotationY = 0F;
    [SerializeField]
    bool flipXAxis = false;
    Vector3 invalidVector = new Vector3(Mathf.Infinity, Mathf.Infinity, Mathf.Infinity); 
    Quaternion originalRotation;


    void Update()
    {
        rotatePlayer();
        if (findTarget() != invalidVector)
        {
            if (Input.GetMouseButtonDown(0))
            {
                pullToTarget(findTarget());
            }
            else if (Input.GetMouseButtonDown(1))
            {
                grabToTarget(findTarget());
            }
        }
    }
    void Start()
    {
        // Make the rigid body not change rotation
        rigidbody = gameObject.GetComponent<Rigidbody>();
        if (rigidbody)
            rigidbody.freezeRotation = true;
        originalRotation = transform.localRotation;
    }

    private Vector3 findTarget()
    {
        RaycastHit hit;
        Debug.DrawRay(this.transform.position, this.transform.TransformDirection(Vector3.forward)* grabDistance, Color.yellow);
        if(Physics.Raycast(this.transform.position, this.transform.TransformDirection(Vector3.forward), out hit, grabDistance))
        {
            return hit.transform.position;
        }
        else
        {
            return (invalidVector);
        }
    }

    private void grabToTarget(Vector3 target)
    {

    }

    private void pullToTarget(Vector3 target)
    {

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
