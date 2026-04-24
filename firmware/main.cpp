/*
 * WISP: A Breath Away 
 * Firmware: Sensor Fusion & TinyML Inference Loop
 */

#include <Arduino.h>
#include <Adafruit_ADXL362.h> // Motion Sensor
#include <bluefruit.h>        // BLE for nRF52840

// --- Configuration ---
const int SAMPLE_WINDOW = 100; // 100ms window
const float THRESHOLD_RED = 0.75;
const float THRESHOLD_AMBER = 0.45;

// --- Hardware ---
Adafruit_ADXL362 accel;
BLEUart bleuart; // BLE Service

void setup() {
  Serial.begin(115200);

  // 1. Initialize BLE
  Bluefruit.begin();
  Bluefruit.setName("WISP-Monitor");
  bleuart.begin();

  // 2. Initialize Accelerometer
  if (!accel.begin()) {
    Serial.println("Accel error!");
    while (1);
  }
  accel.beginMeasure();

  Serial.println("WISP: Protective Monitoring Active");
}

void loop() {
  // 1. Read Motion (Chest Retractions)
  int16_t x, y, z, t;
  accel.readXYZTData(x, y, z, t);

  // 2. Read Acoustic (Microphone - Analog placeholder)
  int micValue = analogRead(A0);

  // 3. Logic: Predict Distress (Simplified for Prototype)
  // In a full build, this feeds into the TFLite Interpreter
  float distressScore = (abs(z) > 500) ? 0.8 : 0.1; 

  // 4. Alert via BLE
  if (distressScore >= THRESHOLD_RED) {
    bleuart.print("ALERT_RED");
  } else if (distressScore >= THRESHOLD_AMBER) {
    bleuart.print("ALERT_AMBER");
  } else {
    bleuart.print("STATUS_GREEN");
  }

  delay(200); // Power saving delay
}
