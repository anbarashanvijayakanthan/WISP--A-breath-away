# 📱 WISP Mobile App: Guided Care Logic

The WISP app acts as a **translator** between the complex sensor data and the caregiver. It is designed for high-stress, low-light environments (like a bedroom at 3 AM).

## 🎨 The Triple-State UI

### 🟢 State: Normal (Safe)
* **Visual:** Large green pulse heart.
* **Message:** "Baby is breathing normally."
* **Action:** Displays the last 30 minutes of respiratory rate.

### 🟡 State: Warning (Early Distress)
* **Trigger:** ML model confidence > 40% OR breathing rate fluctuates by 20%.
* **Visual:** Amber background with a "Care Checklist."
* **Guidance:** 1. "Check if the baby's nose is clear."
  2. "Adjust baby's position."
  3. "Count breaths for 60 seconds."

### 🔴 State: Alert (Critical)
* **Trigger:** ML model confidence > 75% OR detection of consistent grunting/retractions.
* **Visual:** Flashing red screen + vibration.
* **Immediate Action:** * Large button: **"Call ASHA Worker / Emergency"**
  * Directions to the nearest Primary Health Centre (PHC) via offline map.

---

## 🛠️ Tech Implementation
* **Framework:** Flutter (for Android/iOS compatibility).
* **Communication:** Bluetooth Low Energy (BLE).
* **Privacy:** All data stays on the phone; no cloud storage of baby's audio/motion profiles.
