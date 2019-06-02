using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public Vector3 camera_offset;
    public Camera camera;
    public enum RotationAxes { MouseXAndY = 0, MouseX = 1, MouseY = 2 }
    public RotationAxes axes = RotationAxes.MouseXAndY;
    public float sensitivityX = 15F;
    public float sensitivityY = 15F;
    public float minimumX = -360F;
    public float maximumX = 360F;
    public float minimumY = -360F;
    public float maximumY = 360F;
    [SerializeField]
    float rotationX = 0F;
    [SerializeField]
    float rotationY = 0F;
    [SerializeField]
    bool flipXAxis = false;
    [SerializeField]
    private GameObject camera_pivot;
    [SerializeField]
    public Character_controller character;
    Quaternion originalRotation;

    // Start is called before the first frame update
    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        camera = gameObject.GetComponent<Camera>();
        
        camera_pivot = new GameObject();
        camera_pivot.name = "Camera Pivot";
        if(character)
        {
            camera_pivot.transform.position = character.transform.position;
            camera_pivot.transform.rotation = character.transform.rotation;
        }
        else
        {
            camera_pivot.transform.position = this.transform.position;
            camera_pivot.transform.rotation = this.transform.rotation;
        }
        this.gameObject.transform.SetParent(camera_pivot.transform);
        this.transform.position = camera_offset;
        originalRotation = camera_pivot.transform.localRotation;
    }

    // Update is called once per frame
    void Update()
    {
        rotateCamera();
        if(character != null)
        {
            followPlayer();
        }  
    }
    public void registerCharacter(Character_controller character)
    {
        this.character = character;
        //camera_pivot.transform.position = character.transform.position;
        //camera_pivot.transform.rotation = character.transform.rotation;
        this.transform.position = camera_offset;
    }
    private void followPlayer()
    {
        camera_pivot.transform.position = character.transform.position;
        //this.transform.position = camera_offset;
    }

    private void rotateCamera()
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
            camera_pivot.transform.localRotation = originalRotation * xQuaternion * yQuaternion;
        }
        else if (axes == RotationAxes.MouseX)
        {
            rotationX += Input.GetAxis("Mouse X") * sensitivityX;
            rotationX = ClampAngle(rotationX, minimumX, maximumX);
            Quaternion xQuaternion = Quaternion.AngleAxis(rotationX, Vector3.up);
            camera_pivot.transform.localRotation = originalRotation * xQuaternion;
        }
        else
        {
            rotationY += Input.GetAxis("Mouse Y") * sensitivityY;
            rotationY = ClampAngle(rotationY, minimumY, maximumY);
            Quaternion yQuaternion = Quaternion.AngleAxis(-rotationY, Vector3.right);
            camera_pivot.transform.localRotation = originalRotation * yQuaternion;
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
