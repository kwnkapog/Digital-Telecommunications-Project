# 📡 Digital Telecommunications Project  
**Information Theory & DPCM-Based Discrete Source Coding**  
University of Patras — Dept. of Computer Engineering & Informatics (2023–2024)

---

## 📌 Project Overview

This project was developed for the **Digital Telecommunications** course and focuses on two fundamental pillars of modern digital communication systems:

1. **Information Theory and Lossless Source Coding**
2. **Discrete Source Encoding using the DPCM (Differential Pulse Code Modulation) Method**

The project combines **theoretical analysis**, **MATLAB-based implementation**, and **experimental evaluation** on real data (image and signal processing).

---

## 🧩 Project Structure

### 🔹 Part A — Information Theory & Huffman Coding

This section focuses on **lossless compression of a grayscale image** using Huffman coding.

Main tasks include:

- Extraction of **source symbols** from an image (`parrot.png`)
- Estimation of **symbol probabilities**
- Construction of the **Huffman dictionary**
- Computation of:
  - **Entropy**
  - **Average code length**
  - **Coding efficiency**
- Study of the **second-order source extension** (symbol pairs)
- Comparison between:
  - Original source entropy vs. extended source entropy
  - Compression efficiency improvement
- **Binary vs Huffman compression ratio**
- Transmission through a **Binary Symmetric Channel (BSC)**:
  - Estimation of **channel error probability**
  - Computation of **channel capacity**
  - **Mutual information** between input and output

✅ **Result:**  
Huffman coding achieved **~2× compression efficiency** compared to raw binary representation, while the second-order source extension achieved **efficiency above 99%**.

---

### 🔹 Part B — Discrete Source Coding with DPCM

This section implements a **full DPCM encoder–decoder system** for predictive signal coding.

Implemented components:

- ✅ Uniform Quantizer (`my_quantizer`)
- ✅ Prediction Filter (Yule–Walker Equations)
- ✅ Predictor
- ✅ DPCM Encoder
- ✅ DPCM Decoder

Key studies:

- Effect of:
  - Prediction order **p**
  - Quantization bits **N**
- Evaluation using:
  - **Prediction error**
  - **Mean Square Error (MSE)**
- Performance comparison for:
  - Different `(p, N)` combinations
  - Whole signal vs. segmented sub-signals
- **Quantization of predictor coefficients**
- Signal **reconstruction quality analysis**

✅ **Observations:**

- Increasing **p** improves prediction accuracy but raises computational complexity.
- Increasing **N** improves reconstruction quality but increases bandwidth.
- A clear **trade-off between accuracy, complexity, and bandwidth** was established.

---

## 💻 Technologies Used

- **MATLAB**
- Image Processing
- Statistical Signal Processing
- Digital Source Coding
- Information Theory
- Communication Systems Modeling

---

## 📊 Key Concepts Demonstrated

- Entropy & Source Coding Theorem
- Huffman Encoding / Decoding
- Source Extensions
- Binary Symmetric Channel (BSC)
- Channel Capacity & Mutual Information
- DPCM Systems
- Linear Prediction (Yule–Walker)
- Quantization & Prediction Error Analysis

---

## 👤 Author

**Konstantinos Kapogiannis**  
Department of Computer Engineering & Informatics  
University of Patras  
Academic Year: 2023–2024

