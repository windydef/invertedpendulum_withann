# Inverted Pendulum with ANN and PID Control

## Overview

This project implements an **Inverted Pendulum Control System** using a combination of **Artificial Neural Networks (ANN)** and **PID Control**. The simulation models the classical cart-pendulum problem, where a pendulum mounted on a moving cart must be stabilized in its upright position.

The application was developed using **Embarcadero Delphi (Object Pascal)** as part of the **Fundamentals of Intelligent Systems** course at Institut Teknologi Sepuluh Nopember (ITS).

The ANN is used to update the force applied to the cart, while the PID controller improves system stability and response performance. Numerical integration of the pendulum dynamics is performed using the Runge-Kutta method.

---

## Features

### Inverted Pendulum Simulation

* Cart and pendulum dynamic modeling
* Real-time pendulum angle visualization
* Adjustable physical parameters
* Stability analysis

### Artificial Neural Network (ANN)

* Multi-Layer Perceptron (MLP)
* Feed-forward architecture
* Backpropagation learning
* Force estimation for cart control

### PID Controller

* Proportional (P) Control
* Integral (I) Control
* Derivative (D) Control
* Comparison between controlled and uncontrolled systems

### Numerical Methods

* Runge-Kutta integration
* Dynamic state updates
* Real-time simulation

### Performance Monitoring

* Proportional Error graph
* Integral Error graph
* Derivative Error graph
* Force response visualization
* Iteration count analysis

---

## System Architecture

```mermaid
flowchart LR

    SP[Set Point<br/>θ = 0°]

    SUM((Error))
    PID[PID Controller]
    ANN[Multi-Layer Perceptron]
    FORCE[Applied Force F]
    PLANT[Cart-Pendulum Dynamics]
    OUTPUT[Pendulum Angle θ]

    SP --> SUM
    SUM --> PID
    PID --> ANN
    ANN --> FORCE
    FORCE --> PLANT
    PLANT --> OUTPUT

    OUTPUT -->|Feedback| SUM
```

---

## Theoretical Background

### Multi-Layer Perceptron (MLP)

The neural network consists of:

* Input Layer
* Hidden Layer(s)
* Output Layer

The ANN is responsible for updating the force applied to the cart based on system conditions and control errors.

### PID Controller

The control system combines:

#### Proportional Control (P)

Provides corrective action proportional to the current error.

#### Integral Control (I)

Eliminates steady-state error by accumulating past errors.

#### Derivative Control (D)

Predicts future error based on the rate of change.

The combination of these three components enables stable pendulum balancing.

### Runge-Kutta Method

The simulation uses the Runge-Kutta numerical integration method to solve the nonlinear differential equations describing pendulum motion.

---

## Technologies Used

| Technology                | Description             |
| ------------------------- | ----------------------- |
| Object Pascal             | Programming Language    |
| Embarcadero Delphi        | Development Environment |
| Artificial Neural Network | Intelligent Control     |
| Multi-Layer Perceptron    | ANN Architecture        |
| PID Controller            | Feedback Control        |
| Runge-Kutta               | Numerical Solver        |

---

## Project Structure

```text
InvertedPendulumANN/
│
├── Source/
│   ├── Forms
│   ├── Units
│   ├── ANN Module
│   ├── PID Controller
│   └── Simulation Engine
│
├── Documentation/
│   └── Report_INVERTED_PENDULUM_WITH_ANN.pdf
│
└── README.md
```

---

## Author

**Windy Deftia M**

Created in 2018

Biomedical Engineering
Institut Teknologi Sepuluh Nopember (ITS)

---

## License

This project was developed for educational and research purposes.
