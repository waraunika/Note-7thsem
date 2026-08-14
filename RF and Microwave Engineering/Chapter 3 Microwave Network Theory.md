# Introduction

- Microwave Network is formed when microwave component devices, module,s etc. are coupled together by transmission lines for the desired transmission of microwave signal through ports.
- Here the term port is defined as **point of interconection** of two or more networks, simply junctions or terminals.
- At low frequency, the physical length of a network is much smaller than the electrical wavelength of the signal.
- Therefore the measurable input and output variabel are votlage or current which can be related in terms of ABCD, Y-, Z-, or h-parameters.
- These parameters can be measured under short or open circuited conditions.
- But **in microwaves**:
    - Open or short-circuited conditions are not easily achieved.
    - Open or short-circuited conditions often result in oscillations
    - Physical length of the component or devices are comparable or much larger than the electical wavelength..
        - Hence the voltage or current are not well defined at each discrete points.
        - It means, the **network analysis is distributive**
    - These parameters often **change the biasing conditions to junction capacitors**.
        - Therefore, ABCD, Y-, Z- and h-parameters based analyses are not suitable for micwoaves.
        - Instead, scattering parameters, aka S-parameters aka S-matrix, are used to analyze the microwave networks, where the incident and reflected wave parameters are linearly related.d
- Microwave networks **can be of 1-port** like transmission line, **2-port** like amplifier or **multiport** like modulator.
- Any microwave network can be analyzed based on their respective port models.

---

# Microwave N-Port

- A microwave network consists of:
    - a nunmber of transmission line sections
    - interconnected or coupled to each other
    - with passive/active devices
    - incorporated at appropriate locations.
- The network may have one or more input/output ports.
- Hence, they can be treated as a distributed component, characterized by:
    - its length, characteristic impedance and propagation constant

**Consider an arbitrary N-Port network**
- Figure:
    - ![Arbitrary N-Port network representation](attachments/N-port%20network.png)
- The voltage V$_n$ and the current at the terminal plane T$_n$ are given by
    $$\begin{align}
        V_n = V_n^+ + V_n^- \\
        I_n = \dfrac{1}{Z_0} (V_n^+ + V_n^-)
    \end{align}$$

## Impedance Matrix

- The total voltages and currents at the terminals of the microwave network are related by the impedance matrix \[Z\].
    $$\begin{bmatrix}
        V_1 \\
        V_2 \\
        \vdots \\
        V_N
    \end{bmatrix} = \begin{bmatrix}
        Z_{11} & Z_{12} & ... & Z_{1N} \\
        Z_{21} & \ddots &  & Z_{2N} \\
        \vdots &  & \ddots & \vdots \\
        Z_{N1} & Z_{N2} & ... & Z_{NN}
    \end{bmatrix} \begin{bmatrix}
        I_1 \\
        I_2 \\
        \vdots \\
        I_N
    \end{bmatrix}$$
- in short matrix formm
    $$\begin{equation}
        [V] = [Z] [I]
    \end{equation}$$
- Similarly, the admittance matrix \[Y\] of the network is defined as
    $$\begin{equation}
        [I] = [Y] [V]
    \end{equation}$$
- where, 
    $$\begin{equation}
        [Y] = [Z]^{-1}
    \end{equation}$$
- In general, the elements Z$_{ij}$ and Y$_{ij}$ can be complex.
- The following specific cases are of importance in practice.
    - For a reciprocal network (not containing any active device or non-reciprocal material such as ferrite)
        - the elements Z$_{ij}$ = Z$_{ji}$ and Y$_{ij}$ = Y$_{ji}$ and hence,
        - \[Z\] and \[Y\] are symmetric.
    - For a lossless network,
        - all the elements of \[Z\] and \[Y\] are purely imaginary.

## Scattering Matrix

- For circuits operating at $\mu$wave frequencies,
    - network representation in terms of admittance or impedance matrix is not very convinient.
    - since voltage, currents and impedances cannot be emasured directly.
- Parameters that can be measured directly are the incident and reflected power levels
    - that are related to the incident and reflected voltage waves.
- The matrix that reflects the incident and reflected voltage waves at the various ports of the network is known as the scattering matrix.
- Consider the Figure as above.
- We assume tht transmission lines connected to the various ports have the same characteristic impedance (Z$_0$)
- We now define a set of normalized incident and reflected votlage wave variables a$_n$ and b$_n$ as:

$$\begin{align}
    a_n = \dfrac{V_n^+}{\sqrt{Z_0}}\\
    b_n = \dfrac{V_n^-}{\sqrt{Z_0}}
\end{align}$$
- The scattering matrix, denoted as \[S\] relates these two voltage variables.
    $$\begin{bmatrix}
        b_1 \\
        b_2 \\
        \vdots \\
        b_N
    \end{bmatrix} = \begin{bmatrix}
        S_{11} & S_{12} & ... & S_{1N} \\
        S_{21} & \ddots &  & S_{2N} \\
        \vdots &  & \ddots & \vdots \\
        S_{N1} & S_{N2} & ... & S_{NN}
    \end{bmatrix} \begin{bmatrix}
        a_1 \\
        a_2 \\
        \vdots \\
        a_N
    \end{bmatrix}$$
- or in short form 
    $$\begin{equation}
        [b] = [S] [a]
    \end{equation}$$
- The diagonal and off-diagonal elements of the scattering matrix can be obtained from
$$\begin{align}
    S_{ii} = \left. \dfrac{b_i}{a_i} \right|_{a_j = 0} = \left. \dfrac{V_i^-}{V_j^+} \right|_{V_j^+=0}\ j = 1, 2, ... N, j \ne i
    S_{ij} = \left. \dfrac{b_i}{a_i} \right|_{a_j = 0} = \left. \dfrac{V_i^-}{V_j^+} \right|_{V_j^+=0}\ j = 1, 2, ... N, j \ne i
\end{align}$$
