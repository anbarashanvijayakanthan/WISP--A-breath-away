# 🔌 WISP Hardware Wiring Map

To keep **WISP** ultra-low power and tiny, we use specific pins on the **Nordic nRF52840**.

## 🎙️ Acoustic: ICS-43434 MEMS Microphone
| Sensor Pin | nRF52840 Pin | Function |
| :--- | :--- | :--- |
| VCC | 3.3V | Power |
| GND | GND | Ground |
| SD | A0 (Analog) | Audio Data Out |
| L/R | GND | Set to Left Channel |

## 📉 Motion: ADXL362 Accelerometer (SPI)
| Sensor Pin | nRF52840 Pin | Function |
| :--- | :--- | :--- |
| VIN | 3.3V | Power |
| GND | GND | Ground |
| SCL | SCK | SPI Clock |
| SDA | MOSI | SPI Data In |
| SDO | MISO | SPI Data Out |
| CS | D10 | Chip Select |

---
> **Note:** Use short wires (under 5cm) to reduce signal noise for the microphone, as neonatal grunting is a subtle low-frequency signal.
