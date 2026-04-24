# 🔌 WISP Hardware Wiring Guide

To ensure high-quality signal fusion, the sensors must be connected to the **nRF52840** exactly as follows.

## 🎙️ 1. Acoustic Sensor (MEMS Microphone)
Used for detecting neonatal grunting and stridor.
| Sensor Pin | nRF52840 Pin | Function |
| :--- | :--- | :--- |
| VCC | 3.3V | Power |
| GND | GND | Ground |
| OUT | A0 | Analog Audio Signal |

## 📉 2. Motion Sensor (ADXL362 Accelerometer)
Used for tracking chest retractions and respiratory rate.
| Sensor Pin | nRF52840 Pin | Function |
| :--- | :--- | :--- |
| VIN | 3.3V | Power |
| GND | GND | Ground |
| SCL | SCK (D13) | SPI Clock |
| SDA | MOSI (D11) | SPI Data |
| CS  | D10 | Chip Select |

---
### 🛠️ Assembly Note
Keep the microphone wires as short as possible to prevent electromagnetic interference (EMI), which can cause false positives in the AI model.
