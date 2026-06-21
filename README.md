# Koopman Operator Analysis of Nonlinear Dynamical Systems

> A research-oriented exploration of Koopman Operator Theory, nonlinear dynamical systems, spectral decomposition, and data-driven modeling, with applications ranging from pendulum dynamics to spacecraft telemetry analysis and planetary science.

---

## Overview

Many real-world systems are fundamentally nonlinear.

From planetary motion and spacecraft attitude dynamics to fluid flows, robotics, and control systems, nonlinear behavior appears everywhere. Unfortunately, nonlinear systems are notoriously difficult to analyze because they rarely admit closed-form solutions.

This project explores **Koopman Operator Theory**, a modern mathematical framework that transforms nonlinear dynamics into a linear representation in a higher-dimensional observable space.

The presentation was developed as part of a B.Tech technical seminar and investigates:

* Nonlinear dynamical systems
* Koopman operators
* Observable functions
* Eigenfunctions and spectral analysis
* Dynamic Mode Decomposition (DMD)
* Extended Dynamic Mode Decomposition (EDMD)
* Closure properties of observable dictionaries
* Data-driven system identification
* Aerospace and planetary science applications

---

## Why This Topic Matters

Traditional analysis focuses on the state of a system:

[
\dot{x}=f(x)
]

When the function (f(x)) is nonlinear, analytical solutions are often impossible.

Koopman theory approaches the problem differently.

Instead of tracking the state directly, it studies **functions of the state** called observables:

[
g(x)
]

This allows nonlinear dynamics to be represented through a linear operator known as the Koopman Operator:

[
(Kg)(x)=g(F(x))
]

A remarkable result follows:

> Even when the underlying system is nonlinear, the Koopman Operator remains linear.

This opens the door to applying powerful tools from linear algebra, spectral theory, and system identification to nonlinear systems.

---

## Core Concepts Covered

### Linear vs Nonlinear Systems

The presentation begins by revisiting:

* Homogeneity
* Additivity
* Matrix exponential solutions
* Limitations of linear analysis

and motivates the need for modern approaches for nonlinear systems.

---

### Koopman Operator Framework

The Koopman framework introduces:

* Observable functions
* Function spaces
* Linear evolution of observables
* Infinite-dimensional representations

The central idea is:

[
\dot{x}=f(x)
]

becomes

[
\dot{\Psi}=K\Psi
]

where the dynamics evolve linearly in observable space.

---

### Spectral Decomposition

A major focus of the presentation is understanding how diagonalization emerges naturally within Koopman theory.

Topics include:

* Koopman eigenfunctions
* Koopman eigenvalues
* Modal decomposition
* Independent dynamical modes
* Exponential evolution in observable coordinates

This viewpoint reveals nonlinear dynamics as combinations of simpler independent modes.

---

## Pendulum Case Study

To make the theory concrete, the project develops a complete nonlinear pendulum example.

### Nonlinear Model

[
\ddot{\theta}+\frac{g}{L}\sin(\theta)=0
]

Unlike linearized pendulum models, the nonlinear sine term prevents exact matrix-based solutions.

The presentation investigates:

* State-space formulation
* Euler discretization
* Observable lifting
* Koopman representations

---

## Observable Selection

One of the most important challenges in Koopman analysis is choosing an effective observable dictionary.

Five major criteria are discussed:

### 1. Closure

Ensuring derivatives remain inside the dictionary.

### 2. Physics-Based Insight

Including nonlinear terms that naturally arise from the equations of motion.

### 3. Eigenfunction Structure

Seeking observables that diagonalize the Koopman operator.

### 4. Richness Without Redundancy

Avoiding ill-conditioned representations.

### 5. State Reconstruction

Maintaining the ability to reconstruct physical variables.

The presentation demonstrates how these principles lead to a closed observable dictionary for the nonlinear pendulum.

---

## Hamiltonian Conservation

The Hamiltonian energy function is analyzed as a Koopman eigenfunction.

For the pendulum:

[
H=
\frac{1}{2}mL^2\dot{\theta}^2
+
mgL(1-\cos\theta)
]

The analysis shows:

[
\lambda = 0
]

indicating a conserved quantity and zero spectral leakage.

This provides an elegant connection between:

* Classical mechanics
* Energy conservation
* Koopman spectral theory

---

## Extended Dynamic Mode Decomposition (EDMD)

A complete EDMD pipeline is developed.

### Step 1 — Lifting

Map state snapshots into observable space.

### Step 2 — Snapshot Matrices

Construct time-shifted data matrices.

### Step 3 — Least Squares & SVD

Estimate the finite-dimensional Koopman approximation.

### Step 4 — Eigendecomposition

Extract dominant spectral modes.

### Step 5 — Eigenfunction Recovery

Recover Koopman eigenfunctions from data.

### Step 6 — Prediction

Forecast future dynamics using spectral evolution.

### Step 7 — Validation

Evaluate reconstruction accuracy and model quality.

This workflow forms the foundation of many modern data-driven dynamical systems algorithms.

---

## Aerospace Motivation

One of the most exciting aspects of Koopman theory is its relevance to aerospace systems.

Potential applications include:

* Satellite telemetry analysis
* CubeSat health monitoring
* Spacecraft anomaly detection
* Orbital dynamics
* Attitude control systems
* Fault detection and isolation
* Autonomous navigation

The concepts explored in this work directly connect to emerging research areas in data-driven aerospace engineering.

---

## JUICE Mission Analogy

The presentation uses the ESA JUICE mission as an intuitive analogy.

The key idea:

* External forcing excites a dynamical system.
* Observable responses reveal hidden physical properties.
* Large tidal responses can indicate subsurface oceans beneath icy moons.

This analogy demonstrates how observable-based analysis can infer properties that are not directly measurable.

---

## Technologies Used

### Mathematical Tools

* Linear Algebra
* Spectral Theory
* Dynamical Systems
* Koopman Operator Theory

### Computational Tools

* Python
* NumPy
* Matplotlib

### Scientific Computing Concepts

* Dynamic Mode Decomposition (DMD)
* Extended Dynamic Mode Decomposition (EDMD)
* Singular Value Decomposition (SVD)
* Eigenvalue Analysis
* State-Space Modeling

### Documentation

* LaTeX Beamer

---

## Repository Structure

```text
.
├── Presentation.tex
├── Presentation.pdf
├── images/
├── proofs/
└── README.md
```

---

## Learning Outcomes

Through this project I developed practical understanding of:

* Nonlinear dynamical systems
* Koopman operators
* Observable design
* Spectral analysis
* Dynamic Mode Decomposition
* Data-driven system identification
* Aerospace system modeling
* Research-oriented mathematical communication

---

## Future Work

Potential extensions include:

* Implementing a complete EDMD solver in Python
* Applying Koopman analysis to CubeSat telemetry streams
* Fault detection using Koopman eigenfunctions
* Spacecraft attitude dynamics modeling
* Neural Koopman Networks
* Deep Koopman Autoencoders
* Koopman-based anomaly prediction systems

---

## References

1. B. O. Koopman, *Hamiltonian Systems and Transformation in Hilbert Space*, 1931.
2. Igor Mezić, *Spectral Properties of Dynamical Systems, Model Reduction and Decompositions*.
3. Brunton, Proctor & Kutz, *Dynamic Mode Decomposition*.
4. Kutz et al., *Dynamic Mode Decomposition: Data-Driven Modeling of Complex Systems*.
5. Rowley & Dawson, *Model Reduction for Flow Analysis and Control*.

---

## Author

**Aaditiya K**

B.Tech Engineering Science (CSE + EE)

Indian Institute of Technology Jodhpur

Interests:
Embedded Systems • Space Technology • Dynamical Systems • Scientific Computing • Aerospace Software • Machine Learning
