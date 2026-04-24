# 🌬️ WISP: A Breath Away
### *Predictive Neonatal Respiratory Distress Monitor for Home Use*

---

## 📍 The Crisis: A Silence that Kills
Every year, India loses approximately **5.4 lakh newborns**. Many of these deaths occur at home, hours after being discharged from the hospital. The leading cause is **Respiratory Distress Syndrome (RDS)**. 💡

While RDS provides clear physiological warning signals—such as nasal flaring, chest retractions, and audible grunting—these signals are often missed by untrained parents. By the time the crisis is visible, it is often too late. **WISP** bridges the 3-hour "Golden Window" between the first signal and a fatal event. ⏳

---

## 💡 The Solution: WISP
WISP is a matchbox-sized, clip-on **Edge-AI monitor** that attaches to a newborn's onesie. It doesn't just monitor; it **predicts**. It is designed specifically for the Indian context: affordable, offline, and intuitive. 🇮🇳

### 🚀 Three Core Technical Innovations
1.  **🔗 Dual-Signal Fusion (Acoustic + Motion):** Most monitors use only one sensor. WISP fuses data from a **MEMS Microphone** (listening for grunts) and a **3-axis Accelerometer** (feeling for chest wall retractions).
2.  **👶 30-Minute Personalized Baseline:** Every baby is different. WISP doesn't use a "generic" average. It runs a 30-minute calibration phase to learn the specific baby's normal rhythm.
3.  **🔌 Offline TinyML Execution:** WISP runs a 150KB Neural Network fully offline on the Nordic nRF52840. **No WiFi. No Cloud.** 🔒

---

## 🛠️ Technical Architecture & BOM
WISP is built for accessibility, keeping the total cost under **₹1,800**.

| Layer | Component | Purpose |
| :--- | :--- | :--- |
| **🧠 Brain** | Nordic nRF52840 | Ultra-low power MCU with BLE & FPU |
| **🎙️ Acoustic** | ICS-43434 MEMS Mic | Captures 20Hz–20kHz breathing sounds |
| **📉 Motion** | ADXL362 Accelerometer | Detects irregular chest rise/fall |
| **🤖 AI Engine** | TensorFlow Lite Micro | On-device inference for prediction |
| **🔋 Power** | CR2032 Coin Cell | 72-hour continuous monitoring life |

---

## 📂 Project Structure
* `📁 /firmware`: Embedded C++ code for sensor data and BLE transmission.
* `📁 /ml-model`: Python notebooks for training the 1D-CNN + LSTM model.
* `📁 /mobile-app`: Flutter-based caregiver app with "Green-Amber-Red" alerts.
* `📁 /hardware`: STL files for the 3D-printable fabric clip. 

---

## 🌙 The "3 AM Simulation" (How it works)
WISP is designed for the high-stress moment when a parent is asleep.
1.  **Sense:** The device monitors sounds and motion via the MEMS mic and accelerometer. 🔍
2.  **Detect:** The TinyML model identifies an "Amber" state (early irregular breathing). ⚠️
3.  **Alert:** The phone emits a gentle chime and instructs the parent: *"Count the breaths for 60 seconds."* 📱
4.  **Escalate:** If the pattern worsens to "Red," the app provides a one-tap button to call the nearest ASHA worker. 🏥

---

## 📈 Social Impact
WISP is an open-source project aimed at reducing the neonatal mortality rate in India. We focus on **Tier 2/3 cities and rural villages** where hospital-grade monitoring is unavailable. 

## 🤝 License
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details. ⚖️
