# Introduction

- Depending on application, microwave networks vary from single port like transmission lines, two port like amplifiers, filters, oscillators and multi-port devices (mixers, modulators, multiplexers).

# Microwave Amplifiers

- Microwave amplifiers can be classified into three braod categories:
    - reflection amplifier, parametric amplifier and two port amplifiers
- The reflection amplifier uses a device that produces an ac negative resistance where the ac voltage and current are out of phase.
- Such device includes Tunnel Diode, Gunn Diodes and IMPATT diodes with proper terminations.
- The 2 port amplifiers, includes microwave tubes as well as solid state transistor amplifier.

Two port amplifiers only in syllabus

- Microwave amplifiers can be of BJTs, FETs, Heterojunction Bipolar Transistors (HBTs) and High Electron Mobility Transistors (HEMTs).
- Microwave transistor amplifiers are rugged, reliable and low cost and can also be integrated in both hybrid and monolithic microwave integrated circuits (MMICs).
- Present day microwave transistor amplifies can work upto 100 GHz and have attractive characteristics, like
     - broad bandwidth, low noise figure and medium power characteristics with desirable stability and gain factors.

## Amplifier Gain Analysis

- Figure for analysis
    - ![2 Port network model of transistor](attachments/2-port-gain.png)
- The gain of the amplifier will be divided into the gain available at the input and ports, and transducer gain which can be defined as:
    - Power Gain: 
        - the **ratio of power dissipated in the load** to the **power delivered to the input** P$_{in}$ of the two port network
        - G = P$_L$/P$_{in}$
    - Available Gain:
        - ratio of power available from port network P$_{Avn}$ and the source P$_{Avs}$,
        - provided both the source and load are conjugate matched.
        - depends on the source impedance but not on the load impedance.
        - G$_A$ = P$_{Avn}$/P$_{Avs}$
    - Transducer Power Gain:
        - power available from the 2-port network to the power available from the source
        - function of both source and load impedances
        - G$_T$ = P$_l$/P$_{Avs}$
- if the source and load are both conjugately matched to the port network then gain is maximum and we can write G = G$_A$ = G$_T$

For reflection coefficient, from Ch-2/3, we write them as:
- $\Gamma_s$ (looking towards the source) and $\Gamma_L$ (looking towards load)
    $$\begin{align}
        \Gamma_s = \dfrac{Z_s - Z_0}{Z_s + Z_0}\\
        \Gamma_L = \dfrac{Z_L - Z_0}{Z_L + Z_0}
    \end{align}$$
- where Z$_S$, Z$_L$ and Z$_0$ are source, load and characteristic impedance.
- as per definition of S-parameter,
    $$\begin{align}
        V_1^- = S_{11}V_1^+ + S_{12}V_{2}^+ = S_{11}V_1^+ + S_{12}\Gamma_L V_{2}^-\\
        V_2^- = S_{21}V_1^+ + S_{22}V_{2}^+ = S_{21}V_1^+ + S_{22}\Gamma_L V_{2}^-
    \end{align}$$
- From (4) we get:
    $$\begin{equation}
        \dfrac{V_2^-}{V_1^+} = \dfrac{S_{21}}{1-S_{22}\Gamma_L}
    \end{equation}$$
- where we have used the relation $V_2^+ = \Gamma_L + V_2^-$
- now from the expression of V_1^- we get
    $$\begin{equation}
        \Gamma_{in} =\ \dfrac{Z_{in} - Z_0}{Z_{in} + Z_0} =\ S_{11} + S_{12} \Gamma_L \dfrac{V_2^-}{V_1^+}
    \end{equation}$$
- Substituting (5) in (6) gives the reflection coefficient to the input terminal fo the transducer $\Gamma_{in}$ as:
    $$\begin{equation}
        \Gamma_{in} =\ \dfrac{Z_{in} - Z_0}{Z_{in} + Z_0} =\ S_{11} + \dfrac{S_{12} S_{21} \Gamma_L}{1- S_{22}\Gamma_L}
    \end{equation}$$
- Similarly it can be shown that the reflection coefficient to the output terminal of the transducer $\Gamma_{out}$ as
    $$\begin{equation}
        \Gamma_{out} =\ \dfrac{V_2^-}{V_2^+} =\ S_{22} +\dfrac{S_{12} S_{21} \Gamma_S}{1- S_{11}\Gamma_S}
    \end{equation}$$
- Using the voltage division rule, we can write
    $$\begin{equation}
        V_1 = V_s \dfrac{Z_{in}}{Z_s + Z_{in}} = V_1^+ + V_1^- = V_1^+ (1 + \Gamma_{in})
    \end{equation}$$
- Using (7) in (9), we get:
    $$\begin{equation}
        V_1^+ = \dfrac{V_S}{2} \left( \dfrac{1-\Gamma_S}{1-\Gamma_s\Gamma_{in}} \right)
    \end{equation}$$
- If peak values are assumed for all voltages then the average power delivered to the network can be given as
    $$\begin{equation}
        P_{in} = \dfrac{1}{2Z_0} |V_1^+| (1 - | \Gamma_{in} |^2 )
    \end{equation}$$
- Using (10) in (11), we get
    $$\begin{equation}
        P_{in} = \dfrac{|V_s|^2}{8Z_0} \dfrac{|1 - \Gamma_s|^2}{|1-\Gamma_S\Gamma_{in}|^2} (1-|\Gamma_{in}|^2)
    \end{equation}$$
- Similarly, the power delivered to the load can be given as
    $$\begin{equation}
        P_L = \dfrac{|V_s|^2\cdot|S_{21}|^2\cdot|1-\Gamma_S|^2\cdot(1-|\Gamma_L|)^2}{8Z_0\cdot|1-\Gamma_s\Gamma_{in}|^2\cdot|1-S_{22}\Gamma_{L}|^2}
    \end{equation}$$
- Therefore, from (12) and (13), the total gain is:
    $$\begin{equation}
        G = \dfrac{P_L}{P_{in}} = \dfrac{|S_{21}|^2\cdot(1 - |\Gamma_L|^2)}{|1-S_{22}\Gamma_L|^2\cdot(1 - |\Gamma_{in}|^2)}
    \end{equation}$$
- The power available from the source P$_S$ is defined as:
    - the maximum power that can be delivered to the network.
- Following maximum power transfer theorem, we can say that this happens when
    - $\Gamma_{in}$ = $\Gamma_s^*$
- Therefore
    $$\begin{equation}
        P_{Avs} = P_{in}|_{\Gamma_{in} = \Gamma_S^*}
        = \left. \dfrac{|V_S|^2}{8Z_0} \cdot \dfrac{|1-\Gamma_s|^2}{|1-\Gamma_S\Gamma_{in}|^2} (1 - |\Gamma_{in}|^2) \right|_{\Gamma_{in} = \Gamma_S^*}
        = \dfrac{|V_S|^2 \cdot |1-\Gamma_S|^2}{8Z_0 (1 - |\Gamma_S|^2)}
    \end{equation}$$
- Again, the power available from the network is defined as maximum power that can be delivered to the load.
- Following maximum power transfer theorem, we can say that this happens when $\Gamma_L$ = $\Gamma_{out}^*$.
- So
    $$\begin{equation}
        P_{Avn} = P_L |_{\Gamma_L = \Gamma_{out}^*}
        = \left. \dfrac{|V_s|^2 \cdot |S_{21}|^2 \cdot (1-|\Gamma_S|^2)}{8Z_0 \cdot |1-\Gamma_s\Gamma_{in}|^2 \cdot |1-S_{22}\Gamma_L|^2} \right|_{\Gamma_L = \Gamma_{out}^*}
    \end{equation}$$
- Now,
    $$\begin{equation}
        \Gamma_{in}|_{\Gamma_L = \Gamma_{out}^*}
        = S_{11} + \dfrac{S_{12}S_{21}\Gamma_L}{1-S_{22}\Gamma_L}
        = S_{11} + \dfrac{S_{12}S_{21}\Gamma_{out}^*}{1-S_{22}\Gamma_{out}^*}
    \end{equation}$$
- Therefore,
    $$\begin{equation}
        \left. \left|1-\Gamma_{S}\Gamma_{in}\right|^{2} \right|_{\Gamma_L = \Gamma_{out}^*}
        = \left| 1-\Gamma_{s}S_{11}-\frac{S_{12}S_{21}\Gamma_{s}\Gamma_{out}^{*}}{1-S_{22}\Gamma_{out}^{*}} \right|^2
        = \left|\frac{\left(1-S_{11}\Gamma_{s}\right)-\Gamma_{out}^{*}\left(1-S_{11}\Gamma_{S}\right)\left(S_{22}+\frac{S_{12}S_{21}\Gamma_{S}}{1-S_{11}\Gamma_{S}}\right)}{1-S_{22}\Gamma_{out}^{*}}\right|^{2}
    \end{equation}$$
- Using (8) in (18) gives:
    $$\begin{equation}
        \left.\left|1-\Gamma_{s}\Gamma_{in}\right|^{2}\right|_{\Gamma_{L}=\Gamma_{out}^{*}}=\frac{\left|1-S_{11}\Gamma_{s}\right|^{2}\cdot\left(1-\left|\Gamma_{out}\right|^{2}\right)^{2}}{\left|1-S_{22}\Gamma_{out}^{*}\right|^{2}}
    \end{equation}$$
- Therefore,
    $$\begin{equation}
        P_{Avn}=\frac{\left|V_{s}\right|^{2}\cdot\left|S_{21}\right|^{2\ }\cdot\left|1-\Gamma_{s}\right|^{2}}{8Z_{0}\cdot\left|1-S_{11}\Gamma_{s}\right|^{2} \cdot \left(1-\left|\Gamma_{out}\right|^{2}\right)}
    \end{equation}$$
- Using (15) and (2), we obtain maximum available gain as
    $$\begin{equation}
        G_{A}=\frac{P_{Avn}}{P_{avs}}=\frac{\left|S_{21}\right|^{2}\left(1-\left|\Gamma_{L}\right|^{2}\right)\left(1-\left|\Gamma_{S}\right|^{2}\right)}{\left|1-\Gamma_{S}\Gamma_{in}\right|^{2}\left|1-S_{22}\Gamma_{L}\right|^{2}}
    \end{equation}$$
- When both input and output are perfectly matched, $\Gamma_L = \Gamma_S = 0$, then $G_T = |S_{21}|
