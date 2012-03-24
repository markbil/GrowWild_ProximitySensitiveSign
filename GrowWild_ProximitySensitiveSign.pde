// Interactive Sign - RGB LED Strip brightness controlled through a Proximity Sensor
// by Mark Bilandzic, 2011
// based on
// - http://www.ladyada.net/products/rgbledstrip/ and
// - http://arduino.cc/forum/index.php?topic=64102.0


// color swirl! connect an RGB LED strip to the PWM pins as indicated
// in the #defines accroding to http://www.ladyada.net/products/rgbledstrip/
 
#define REDPIN 5
#define GREENPIN 6
#define BLUEPIN 3
 
 
//-----MAXSONAR SENSOR----------
//http://arduino.cc/forum/index.php?topic=64102.0
const int pwPin = 7; 

long pulse, cm;
long old_cm = 0;

//stores the distance of the previous cycle
long old_b;
long new_b;

//------------------------------
 
void setup() {
  pinMode(REDPIN, OUTPUT);
  pinMode(GREENPIN, OUTPUT);
  pinMode(BLUEPIN, OUTPUT);
  
  Serial.begin(9600);
  pinMode(pwPin, INPUT);
  
}
 
 
void loop() {
 
  pulse = pulseIn(pwPin, HIGH);
  cm = pulse/58;   //pulse width is 58uS per cm

  Serial.print(cm);
  Serial.println(": cm");
  delay(5);

  if (cm < 16) {
    cm = 0;
    Serial.println(" 0");
  } else if (cm < 20) {
    Serial.println(" 1");
    cm = 20;
  } else if (cm < 30) {
    Serial.println(" 2");
    cm = 30;
  } else if (cm < 40) {
    Serial.println(" 3");
    cm = 40;
  } else if (cm < 50) {
    Serial.println(" 4");
    cm = 50;
  } else if (cm < 60) {
    Serial.println(" 5");
    cm = 60;
  } else if (cm < 70) {
    Serial.println(" 6");
    cm = 70;
  } else if (cm < 80) {
    Serial.println(" 7");
    cm = 80;
  } else if (cm < 90) {
    Serial.println(" 8");
    cm = 90;
  } else if (cm < 100) {
    Serial.println(" 9");
    cm = 100;
  } else if (cm < 110) {
    Serial.println(" 10");
    cm = 110;
  } else if (cm < 120) {
    Serial.println(" 11");
    cm = 120;
  } else if (cm < 130) {
    Serial.println(" 12");
    cm = 130;
  } else if (cm < 140) {
    Serial.println(" 13");
    cm = 140;
  } else if (cm < 150) {
    Serial.println(" 14");
    cm = 150;
  } else if (cm < 160) {
    Serial.println(" 15");
    cm = 160;
  } else if (cm < 170) {
    Serial.println(" 16");
    cm = 170;
  } else if (cm < 180) {
    Serial.println(" 17");
    cm = 180;
  } else if (cm < 190) {
    Serial.println(" 18");
    cm = 190;
  } else {
    Serial.println(" 19");
    cm = 200;
  }

// you can go on depending on how far you want the interactivity of the sign to reach
//  } else if (cm < 210) {
//    Serial.println(" 20");
//    cm = 210;
//  } else if (cm < 220) {
//    Serial.println(" 21");
//    cm = 220;
//  } else if (cm < 230) {
//    Serial.println(" 22");
//    cm = 230;
//  } else if (cm < 240) {
//    Serial.println(" 23");
//    cm = 240;
//  } else if (cm < 250) {
//    Serial.println(" 24");
//    cm = 250;
//  } else if (cm < 260) {
//    Serial.println(" 25");
//    cm = 260;
//  } else if (cm < 270) {
//    Serial.println(" 26");
//    cm = 270;
//  } else if (cm < 280) {
//    Serial.println(" 27");
//    cm = 280;
//  } else if (cm < 290) {
//    Serial.println(" 28");
//    cm = 290;
//  } else {
//    Serial.println(" 29");
//    cm = 300;
//  }
  
  
  new_b = map(cm, 20, 200, 255, 0);
  old_b = map(old_cm, 20, 200, 255, 0);
//  Serial.print(new_b);
//  Serial.println(": brightness");
//  Serial.print(cm);
//  Serial.println(": cm");

  
  if (old_b <= new_b){
    for (long z = old_b; z < new_b; z++) { 
        analogWrite(REDPIN, z);
        analogWrite(BLUEPIN, z);
        analogWrite(GREENPIN, z);
        delay(2);
    }
  }
  else {
    for (long z = old_b; z > new_b; z--) { 
       analogWrite(REDPIN, z);
       analogWrite(BLUEPIN, z);
       analogWrite(GREENPIN, z);
       delay(2);
    } 
  
  }
  
  old_cm = cm;
  
}
