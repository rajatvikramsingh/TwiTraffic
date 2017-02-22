#include <SoftwareSerial.h>
#define rxPin 2
#define txPin 3

SoftwareSerial mySerial =  SoftwareSerial(rxPin, txPin);
const int ledPin = 13; // the pin that the LED is attached to
int incomingByte;      // a variable to read incoming serial data into
char c;
char c2;
char c3;
int flag = 1;
int speed_int;
char speed_car[3];
int count = 0;

void setup() {
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
  mySerial.begin(9600);
  // initialize serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
}

void loop() 
{

if(flag!=1)
 count++;

if(count == 5000)
{
  flag = 1;
  count = 0;
}
 
if(flag == 1)
{
  Serial.print('@');
  count = 0;
}
if(Serial.available()>0)
{
   c = Serial.read();
   if(c>='A' && c<='Y')
   {
      Serial.print(c);
      flag = 2;
   }
   
   else if(flag==2)
   {  
     if(c<'A' || c>'Z')
     {
       Serial.print('#');
       Serial.print(c);
     }
     flag = 1;
   }
  
}

}
   
