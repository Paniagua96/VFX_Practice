using UnityEngine;

public class CS_CameraMove : MonoBehaviour
{
    [SerializeField] private float speed;
    [SerializeField] private float rotSpeed;


    void Update()
    {
        //Translate
        var movX = Input.GetAxis("Horizontal") * speed * Time.deltaTime;
        var movY = Input.GetAxis("Vertical") * speed * Time.deltaTime;

        transform.Translate(movX, 0, movY);

        //Rotation
        if (Input.GetKey(KeyCode.LeftShift))
        {
            var rotX = Input.GetAxis("Mouse X") * rotSpeed * Time.deltaTime;
            var rotY = Input.GetAxis("Mouse Y") * rotSpeed * Time.deltaTime;

            transform.Rotate(0, rotX, 0);
        }


    }
}
