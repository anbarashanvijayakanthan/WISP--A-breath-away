# 🧠 AI Architecture: Signal Fusion

WISP uses a hybrid **1D-CNN + LSTM** model to monitor neonates.

### 🔄 Data Processing
1. **Acoustic Stream:** Processes audio from the MEMS mic to identify "grunting" sounds.
2. **Motion Stream:** Processes accelerometer data to detect "chest retractions."

### 🤖 The Model
- **CNN Layers:** Extract features from the raw sensor signals (the "shape" of the breath).
- **LSTM Layers:** Analyze the *rhythm* over time to predict distress 90 minutes in advance.
- **Output:** A distress score from 0 (Safe) to 1 (Critical).
