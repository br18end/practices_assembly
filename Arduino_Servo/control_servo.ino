 / *
* Creado por Rui Santos, http://randomnerdtutorials.wordpress.com
* Control de un motor servo con Visual Basic
* 2013
* /
#include <Servo.h>
Myservo Servo; // Crear el objeto Servo para controlar un servo
void setup ()
{
myservo.attach (9); // Concede el servo en el pin 9 al objeto servo
Serial.begin (9600); // Comienza la comunicación en serie
}
void loop ()
{
int pos;
si (Serial.available ()) {
retardo (100);
while (Serial.available ()> 0) {
pos = Serial.read (); // Lee el valor enviado desde Visual Basic
si (pos == '0')
myservo.write (90); // Hace girar el servo 90 grados (izquierda)
else if (pos == '1')
myservo.write (-90); // Hace girar el servo 90 grados (a la derecha)
else if (pos == '2')
myservo.write (180); // Hace girar el servo 180 grados (izquierda)
else if (pos == '3')
myservo.write (-180); // Hace girar el servo 180 grados (a la derecha)
}
}
} 
