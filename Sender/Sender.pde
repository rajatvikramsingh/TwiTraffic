#include <LiquidCrystal.h>

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
char c;
char c2;
int flag =1;
int flag2 = 0;
int count = 0;
long starttime;
const int xpin = A3;                  // x-axis of the accelerometer
const int ypin = A2;                  // y-axis
const int zpin = A1;                  // z-axis (only on 3-axis models)
int count_loss = 0;

void setup()
{
  Serial.begin(9600);
  lcd.begin(16, 2);
}

void loop()
{
  
if(flag!=1)
 count++;

if(count == 5000)
{
  flag = 1;
  flag2 = 0;
  count = 0;
  //count_loss = 0;
}

if(Serial.available()>0)
{
   c = Serial.read();
   if(c == '@'&& flag == 1)
   {
      Serial.print('A');
      flag = 2;
      if(flag2==0)
      {
        starttime = millis();
        flag2 = 1;
      }
      count_loss++;
      //count = 0;
   }
   
   else if(c=='A' && flag ==2)
   {
     int speed = 120;
     c2 = speed/4;
      Serial.print(c2);
      flag = 3;
   }
   
   else if (c=='#' && flag ==3)
   {
     flag =1;
     flag2 = 0;
     lcd.setCursor(0,0);
     lcd.print("Transmission: ");
     lcd.print(millis()-starttime);
     lcd.print("ms");
     lcd.setCursor(0,1);
     lcd.print("Loss: ");
     lcd.print(count_loss);
     count_loss = 0;
     count == 0;
     delay(1000);
   }
  
}
   

}
