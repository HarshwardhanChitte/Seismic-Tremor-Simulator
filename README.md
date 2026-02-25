# Seismic Tremor Simulator

## Overview
This project models and simulates the response of buildings subjected to earthquake excitation using transfer functions in MATLAB. The objective is to analyze how structural parameters such as stiffness and damping affect vibration behavior and structural safety during seismic activity.

---

## Objectives
- Generate a synthetic earthquake signal
- Model buildings as second-order systems using transfer functions
- Simulate structural responses using MATLAB
- Perform time-domain and frequency-domain (FFT) analysis
- Compare safety performance of different building configurations

---

## System Model

The building is modeled as a second-order system:

H(s) = 1 / (s² + a s + b)

Where:
- `a` → Damping factor
- `b` → Stiffness factor

---

## Key Observations

- Stiffer buildings limit displacement but may have prolonged oscillations if damping is low.
- Flexible buildings experience larger sway but dissipate energy faster if damping is high.
- Resonance effects are clearly visible in frequency-domain analysis.
- An optimal structure should combine adequate stiffness and damping for better earthquake resistance.

---

## Tools Used

- MATLAB
- Control System Toolbox
- Fast Fourier Transform (FFT)

---

## Project Structure

Seismic-Tremor-Simulator/
│
├── seismic_tremor_simulator.m
├── README.md
└── results
