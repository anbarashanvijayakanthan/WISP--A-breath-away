#include <Arduino.h>
#include <bluefruit.h> 

// WISP Sensor Logic for nRF52840
void setup() {
  Serial.begin(115200);
  Bluefruit.begin();
  Bluefruit.setName("WISP-Sensor-Node");
  
  pinMode(A0, INPUT); // Microphone input
}

void loop() {
  int noiseLevel = analogRead(A0);
  
  // If noise is high (grunting), send alert to phone
  if (noiseLevel > 800) {
    Serial.println("Warning: Distress Pattern Detected");
  }
  
  delay(200); // Power saving delay
}
