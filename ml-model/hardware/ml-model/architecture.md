# 🧠 WISP AI: Signal Fusion Architecture

WISP uses a **Temporal Convolutional Network (TCN)** combined with an **LSTM layer** to predict distress. Because neonatal breathing is rhythmic, the model doesn't just look at a "snapshot"—it looks at the **pattern over time**.

## 🔄 The Dual-Stream Pipeline

### 1. Acoustic Stream (The Microphone)
* **Input:** 16kHz Mono Audio.
* **Feature Extraction:** Mel-frequency cepstral coefficients (MFCCs).
* **Target:** Detects "Grunting" (low-frequency vocalization) and "Stridor" (high-pitched wheezing).

### 2. Motion Stream (The Accelerometer)
* **Input:** 3-axis movement (X, Y, Z).
* **Preprocessing:** High-pass filter to remove body movement; Low-pass filter to isolate chest rise/fall.
* **Target:** Detects "Retractions" (deep, irregular chest sinking).

## 🤖 The Model Architecture
* **Layer 1: 1D-CNN** – Extracts local features (the shape of a single breath).
* **Layer 2: LSTM (Long Short-Term Memory)** – Tracks the rhythm (is the interval between breaths increasing?).
* **Layer 3: Dense/Softmax** – Outputs a probability score from 0 to 1.

## 📊 Alert Thresholds
* **🟢 Green (0.0 - 0.4):** Normal breathing.
* **🟡 Amber (0.4 - 0.7):** Unusual pattern detected; personalized baseline has shifted >15%.
* **🔴 Red (0.7 - 1.0):** High-confidence distress pattern detected.
