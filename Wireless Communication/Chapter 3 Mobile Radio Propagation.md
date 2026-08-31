# Exam Frequency Table (2070–2082 BS, 22 papers)

| Topic | Typical Marks | Frequency |
|---|---|---|
| Small-scale fading: definition, types, influencing factors (+Doppler shift derivation) | 2–10 | Very High |
| Coherence bandwidth & coherence time: definitions, significance, relation to delay/Doppler spread | 2–9 | Very High |
| Free-space propagation, power received, link budget numericals (deferred, theory covered) | 1–12 | Very High |
| Okumura model: theory + path loss computation (deferred: theory covered) | 2–8 | High |
| Hata model: correction factors, path loss computation (deferred: theory covered) | 4–8 | High |
| Two-ray ground reflection model: derivation of phase difference / path loss | 2–10 | High |
| Doppler spread + types of small-scale fading (fast/slow) classification | 2–8 | High |
| Rayleigh vs Ricean fading distribution | 2–5 | Moderate–High |
| RMS delay spread, mean excess delay, max excess delay (theory; numericals deferred) | 4–8 | Moderate |
| Diffraction: Fresnel-Kirchoff parameter, phase difference derivation | 2–8 | Moderate |
| Indoor propagation models (any two) + factors influencing them | 5–8 | Moderate |
| Large-scale vs small-scale propagation model comparison | 3–9 | Moderate |
| Ericsson Multiple Breakpoint model | 2 | Low |
| Scattering, basic propagation mechanisms overview | 3–6 | Low–Moderate |

**Reading tip:** Small-scale fading (definition + types + factors) and coherence bandwidth/time are the two anchor topics: almost every paper touches one. Pair Doppler shift derivation with small-scale fading questions, and pair the two-ray model derivation with propagation-mechanism questions, since PYQs frequently bundle them.

---

# 3.1–3.2 Free Space Propagation and Basic Propagation Mechanisms

## Free Space Propagation Model

- Channels can be broadly classified as:
    - Wired Channel
    - Wireless or Radio Channel
- The free space propagation model is used to predict received signal strength at a particular location when the Tx and Rx have a clear and unobstructed LoS path
    - e.g., Satellite communication, Microwave Communication
- Propagation is completed via Tx antenna
    - To convert the electrical modulated signal into electromagnetic field
    - to radiate the EM energy in desired directions
- Let us consider an isotropic radiating source $P_t$
- The radiated power uniformly distributed over the surface are $4\pi d^2$
    - where $d$ is the distance (in meter) from the source
- Power density is given by $P_d = \dfrac{P_t}{4\pi d^2}$

### Key Terms

#### Effective Isotropic Radiated Power (EIRP)

- Product of the transmitted power, $P_t$ and the power gain of the transmitting antenna, $G_t$
    - i.e., EIRP = $P_t G_t$ watts

#### Effective Aperture

- significant in receiving antenna
- defined as the ratio of power available at antenna terminal to the power per unit area of the appropriately polarized incident electromagnetic wave
    $$A_c = \dfrac{\lambda^2 G}{4\pi}$$
    - where, $\lambda$ is the wavelength of the carrier, and is given by
    - $\lambda = c/f$

#### Power Received

- The power received at a distance is given by the power flux density times the effective aperture of the receiver antenna
    $$P_d = \frac{P_t G_t}{4\pi d^2} = \frac{\text{EIRP}}{4\pi d^2} = \frac{|E|^2}{120 \pi}\ W/m^2$$

### Basic Propagation Equation (Friis Free-Space Equation)

- Let us consider a transmitting antenna with an EIRP defined in equation.
- So power density is defined as
    $$\begin{equation}
        P_d = \frac{\text{EIRP}}{4\pi d^2}
    \end{equation}$$
    - where d is the distance between receiving and transmitting antenna
- Now, **Receiving Antenna Power ($P_r$)** is product of power density and antenna's effective area or aperture
- Thus, $P_r = P_d \cdot A_e$
- Further deriving:
    $$P_r = \left(\frac{\text{EIRP}}{4\pi d^2} \right) A_e$$
- and substituting value of $A_e$
    $$P_r = \frac{P_t G_t A_e}{4\pi d^2}\ watts$$
- Finally, we resolve to
    $$P_r = P_t G_t G_r \left(\frac{\lambda}{4\pi d^2}\right)$$
- Where,
    - $P_t$ = transmitted power radiated by an isotropic source
    - $G_t$ = transmitting antenna gain
    - $G_r$ = receiving antenna gain
    - d = distance between transmitting and receiving antenna
    - $\lambda$ = wavelength of the carrier signal
- This equation is called Friis Free-space equation.

### Path Loss for Free Space Model

- The free space propagation model is used to predict received signal strength when the transmitter and receiver have a clear LoS path between them.
    - Satellite comm
    - microwave LoS radio link
- The losses $L$ ($L \ge 1$) are usually due to transmission line attenuation, filter losses, and antenna losses in the communication system.
- A value of $L = 1$ indicates no loss in the system hardware.
- Path loss of the free space model with antenna gains
    $$PL(dB) = 10\log\frac{P_t}{P_r} = -10\log\left(\frac{G_t G_r \lambda^2}{(4\pi)^2 d^2}\right)$$
- When antenna gains are excluded
    $$PL(dB) = 10\log\frac{P_t}{P_r} = -10\log\left(\frac{\lambda^2}{(4\pi)^2 d^2}\right)$$
- The Friis free space model is only a valid predictor of $d$ which is in the far-field (Fraunhofer region) of the transmission antenna.

### Significance of Free Space Path Loss Model

- The minus sign associated with the first term in the equation signifies the fact that this term represents a gain
- The second term, due to the collection of terms $(4\pi d/\lambda)^2$, is called the free space loss, denoted by $L_{\text{freespace}}$
- Increasing the distance $d$ separating the receiving antenna from the transmitting antenna causes the free-space loss to increase, which, in turn, compels us to operate the radio comm link to lower frequencies to maintain the path loss at a manageable level.
- The Friis free space equation enables us to calculate the path loss $PL$ for specified values of power gains, $G_t, G_r$, the carrier wavelength $\lambda$ and distance $d$.
- The far-field region of a transmitting antenna is defined as the region beyond the far-field distance
    $$d_f = \frac{2D^2}{\lambda}$$
    - where D is the largest physical linear dimension of the antenna.
- To be in the far-field region, the following equation must be satisfied:
    $$d_f >> D\ \text{and }\ d_f >> \lambda$$
- Furthermore, the equation does not hold for d=0.
- Use close-in distance $d_0$ and a known received power $P_r(d_0)$ at that point
    $$P_r(d) = P_r (d_0) \left( \frac{d_0}{d}\right)^2\ \text{for }\ d \ge d_0 \ge d_f$$
- in dB form:
    $$P_r(dBm) = 10\log\left[ \frac{P_r(d_0)}{0.001W} \right] + 20\log\left( \frac{d_0}{d} \right)\ \text{for }\ d \ge d_0 \ge d_f$$
    - where $P_r(d_0)$ is in units of watts.

### The Propagation Attenuation

- In general, the propagation path loss increases with
    - frequency of transmission, $f_c$
    - as well as the distance between the cell sites and mobile, $R$.
- Adequate bandwidth is available at much higher frequencies (around 1GHz and greater than a few GHz).
- However, at such frequencies, the radio signals suffer a greater signal strength loss at shorter distance, and also suffer larger signal strength losses while passing through obstacles such as walls.
- Hence, the propagation path loss and the received signal power are reciprocal to each other; assuming all the other factors constant, we can say that the received carrier signal power, $P_r$, is inversely proportional to $d^n$, i.e.
    $$P_r \propto d^{-n}$$
- $d$ = distance between transmitter and receiver
- $n$ = path loss exponent, which varies between 2 and 6.

## Basic Propagation Mechanisms

*(Frequently asked directly: "large-scale vs small-scale propagation model", "three basic radio wave propagation mechanisms")*

- In a wireless signal propagation environment, apart from direct waves, the receiver will get a number of reflected waves, diffracted waves and scattered waves.
- The vectorial addition of these waves constitutes the resultant wave which will vary in strength in real time.
- Basic propagation mechanisms
    - **Reflection**
        - occurs when a propagating electromagnetic wave impinges upon an object which has very large dimensions when compared to wavelength, e.g., buildings, walls.
    - **Diffraction**
        - occurs when the radio path between the transmitter and receiver is obstructed by a surface that has sharp edges
    - **Scattering**
        - occurs when the medium through which the wave travels consists of objects with dimensions that are small, compared to the wavelength
        - e.g., Water, rain drops.

### Ground Reflection (Two-Ray) Model

- This model is found reasonably accurate when compared with free space propagation.
- 2-ray model assumes both LoS and reflected signal for modeling the path loss.
- With given figure's geometry:
    - ![Geometry of 2 ray model](attachments/2-ray-model.png)
    - $h_t$ = height of Tx antenna
    - $h_r$ = height of Rx antenna
    - $E_{LoS}$ = E-field LoS signal
    - $E_g$ = E-field of reference (ground-reflected) signal
    - $d$ = distance between Tx and Rx
- Assumptions:
    - $h_t, h_r >> \lambda$
    - $h_t, h_r << d$
- Parameters to be estimated:
    - E-field for both $E_{LOS}$ and $E_g$.
    - Path difference ($\Delta$)
    - Phase difference ($\theta_\Delta$)
    - Time delay ($T_d$)
- General equation for plane wave in free space is given by
    $$E(Z, t) = E_0\cdot e^{-\alpha Z}\cdot \cos(\omega t- \beta Z) \hat a_x$$
- Let us rewrite the above equation with our own variables
    $$E\left(d,t\right)=\frac{E_{0}d_{0}}{d}\cdot \cos \left(\omega _{c}\left(t-\frac{d}{c}\right)\right)$$
- Calculating E-field for LoS signal and reflected signal
    $$E_{LoS}\left(d',t\right)=\frac{E_{0}d_{0}}{d'}\cdot \cos \left(\omega _{c}\left(t-\frac{d'}{c}\right)\right)$$
    - and for reflected, with $\Gamma$ as reflection coefficient
    $$Eg\left(d'',t\right)=\Gamma \frac{E_{0}d_{0}}{d''}\cdot \cos \left(\omega _{c}\left(t-\frac{d''}{c}\right)\right)$$
- An ideal receiver just adds up all the received signal so the total E field Equation is given by
    $$\left|E_{tot}\right|=\left|E_{LoS}\right|+\left|E_{g}\right|$$
    $$\left|E_{tot}\right|=\frac{E_{0}d_{0}}{d'}\cdot \cos \left(\omega _{c}\left(t-\frac{d'}{c}\right)\right)+\Gamma \frac{E_{0}d_{0}}{d''}\cdot \cos \left(\omega _{c}\left(t-\frac{d''}{c}\right)\right)$$
- We know that from laws of reflection in dielectrics, the reflection coefficient is (-1)
    $$\left|E_{tot}\right|=\frac{E_{0}d_{0}}{d'}\cdot \cos \left(\omega _{c}\left(t-\frac{d'}{c}\right)\right)-\frac{E_{0}d_{0}}{d''}\cdot \cos \left(\omega _{c}\left(t-\frac{d''}{c}\right)\right)$$

#### Calculating Path Difference

- Since the path taken by two rays are different and they travel different distances, it is important to calculate the path difference.
- To find the path difference between 2 waves, we use the method of imaging.
- so that:
    - $d''=\sqrt{\left(h_{t}+h_{r}\right)^{2}+d^{2}}$
    - $d'=\sqrt{\left(h_{t}-h_{r}\right)^{2}+d^{2}}$
- And $\Delta$ as the path difference:
    - $\Delta =d\sqrt{1+\left(\frac{h_{t}+h_{r}}{d}\right)^{2}}-d\sqrt{1+\left(\frac{h_{t}-h_{r}}{d}\right)^{2}}$
    - $=d\left\{\left(1+\frac{1}{2}\left(\frac{h_{t}+h_{r}}{d}\right)^{2}\right)-\left(1+\frac{1}{2}\left(\frac{h_{t}+h_{r}}{d}\right)^{2}\right)\right\}$
    - $=d\cdot \dfrac{4h_{t}h_{r}}{2d^{2}}$
    - $=\dfrac{2h_{t}h_{r}}{d}$
- Phase Difference ($\theta_\Delta$)
    - $\theta_\Delta = \dfrac{2\pi \Delta}{\lambda} = \dfrac{2\pi \Delta}{c/f} = \dfrac{2\pi f \Delta}{c} = \dfrac{\omega_c \Delta}{c}$
- Time Delay ($T_d$)
    - $T_d = \dfrac{\Delta}{c} = \dfrac{\theta_\Delta}{2\pi f}$

**Notes:**
- When d becomes large, the difference between the distances d' and d'' becomes very small, and the amplitudes $E_{LoS}$ and $E_g$ are virtually identical and differ only in phase.
- If the received E-field is evaluated at some time, let $t = d''/c$, then the equation is given by:
    $$\begin{align}
        \left|E_{tot}\right|&=\frac{E_{0}d_{0}}{d'}\cdot \cos \left(\omega _{c}\left(\frac{d''}{c}-\frac{d'}{c}\right)\right)-\frac{E_{0}d_{0}}{d''}\cdot \cos \left(\omega _{c}\left(\frac{d''}{c}-\frac{d''}{c}\right)\right)\\
        \left|E_{tot}\right|&=\frac{E_{0}d_{0}}{d'}\cdot \cos \left(\omega _{c}\left(\frac{\Delta }{c}\right)\right)-\frac{E_{0}d_{0}}{d''}\cdot \cos \left(0\right)\\
        \left|E_{tot}\right|&=\frac{E_{0}d_{0}}{d'}\left(\cos \left(\theta _{\Delta }\right)-\cos \left(0\right)\right)\\
    \end{align}$$
    - By using trigonometric identities and simplifying further
    $$\begin{align}
        \left|E_{tot}\right|&=\frac{E_{0}d_{0}}{d'}\cdot 2\sin \left(\frac{1}{2}\ \frac{\omega _{c}\Delta }{c}\right)\\
        \left|E_{tot}\right|&=\frac{E_{0}d_{0}}{d'}\cdot 2\sin \left(\frac{1}{2}\ \frac{1}{c}\cdot 2\pi f\cdot \frac{2h_{t}h_{r}}{d}\right)\\
        \left|E_{tot}\right|&=\frac{2E_{0}d_{0}}{d'}\sin \left(\frac{2\pi h_{t}h_{r}}{\lambda d}\right)\\
    \end{align}$$
    - By small angle approximation
    $$\begin{align}
        \left|E_{tot}\right|&=\frac{2E_{0}d_{0}}{d'}\frac{2\pi h_{t}h_{r}}{\lambda d}\\
        \left|E_{tot}\right|&=E_{0}d_{0}\left(\frac{4\pi h_{t}h_{r}}{\lambda d^{2}}\right)\\
    \end{align}$$
    - For received power at distance d
    $$\begin{align}
        P_{r}&=\frac{E_{tot}}{120\pi }A_{e}\\
        P_{r}&=\left(E_{0}d_{0}\left(\frac{4\pi h_{t}h_{r}}{\lambda d^{2}}\right)\right)^{2}\cdot \frac{A_{e}}{120\pi }\\
        P_{r}&=\left(E_{0}d_{0}\left(\frac{4\pi h_{t}h_{r}}{\lambda d^{2}}\right)\right)^{2}\cdot \frac{P_{t}G_{t}G_{r}\lambda ^{2}}{\left(4\pi \right)^{2}d^{2}}\\
        P_{r}&=P_{t}G_{t}G_{r}\cdot \left(\frac{h_{t}h_{r}}{d^{2}}\right)^{2}\\
    \end{align}$$
- So path loss as $P_t/P_r$:
    $$\frac{P_{t}}{P_{r}}=\frac{d^{4}}{G_{t}G_{r}\left(h_{t}h_{r}\right)^{2}}$$
- In dB form:
    $$PL\left(dB\right)=40\log \left(d\right)-\left(10\log \left(G_{t}\right)+10\log \left(G_{r}\right)+20\log \left(h_{t}\right)+20\log \left(h_{r}\right)\right)$$

### Diffraction

*(Frequently asked directly, paired with Fresnel-Kirchoff parameter derivation)*

- Occurs when the radio path between the transmitter and receiver is obstructed by a surface that has sharp irregularities (edges).
- Explains how radio signals can travel in urban and rural environments without a line of sight path.
- Diffraction can be explained by Huygen's principle:
    - all points on a wavefront can be considered as point sources for the production of secondary wavelets.

#### Knife Edge Diffraction Geometry

- Geometry:
    - ![Explanation with figure for analysis](attachments/diffraction-geometry-for-analysis.png)

#### Fresnel Zone

- Fresnel zones are used by propagation theory to calculate reflection and diffraction loss between a transmitter and receiver.
- Fresnel zones are numbered and are called F1, F2, F3, etc.
- Though there are infinite, we concern ourselves only with 3.
- A Fresnel zone is a cylindrical ellipse drawn between transmitter and receiver.
- the size of the ellipse is determined by the frequency of operation and the distance between the two sites.
- The Fresnel-Kirchoff Diffraction parameter is given by
    $$v=h\sqrt{\frac{2\left(d_{1}+d_{2}\right)}{\lambda d_{1}d_{2}}}$$
- Fresnel Zone figure:
    - ![Fresnel Zones](attachments/diffraction-fresnel-zones.png)

### Scattering

- occurs when the medium has objects that are smaller or comparable to the wavelength (small objects, rough surfaces and other irregularities on the channel)
- Follows the same principles as diffraction
- Causes the transmitter energy to be radiated in many directions.
- e.g., foliage, street signs, lamp posts

---

# Radio Propagation Models: Overview

- Need models to characterize the signal strength received at the receiver after undergoing reflections, diffraction and scattering
    - small scale propagation models
    - large scale propagation models
- Radio propagation models can be derived by
    - using empirical methods: collect measurement, fit curves
    - using analytical methods: model the propagation mechanisms mathematically and derive equations for path loss

## Large-Scale Propagation Models

*(Frequently paired with the "large-scale vs small-scale" comparison question)*

- As the mobile moves away from the transmitter over large distances, the local average received signal will gradually decrease.
- This is called large-scale path loss.
- Typically the local average received power is computed by averaging signal measurements over a measurement track of $5\lambda$ to $40\lambda$
    - this means a 1m – 10m track
- The models that predict the mean signal strength for an arbitrary receiver-transmitter (T-R) separation distance are called large-scale propagation models.
- Large T-R separation distances (several hundreds of thousands of meters)
- Main propagation mechanism: reflections
- attenuation of signal strength due to power loss along distance traveled: shadowing
- small fluctuations around a slowly varying mean
- useful in estimating the radio coverage of a transmitter

### Need for Propagation Models

- determining the coverage area of a transmitter
    - determine the transmitter power requirement
    - determine the battery lifetime
- finding modulation and coding schemes to improve the channel quality

---

# 3.3 Practical Link Budget Design Using Path Loss Models

- Log distance path model
    - Both theoretical and measurement-based models show that the received signal power decreases logarithmically with distance.
    - both for indoor and outdoor channels
    - the average large scale path loss for an arbitrary T-R separation is expressed as a function of distance by using a path loss exponent $n$.
- $n$ characterizes the propagation environment
    - for free space it is 2.
    - when obstructions are present, it has a larger value.
- the link budget is a summary of the transmitted power along with all the gains and losses in the system, and this enables the strength of the received signal to be calculated.

## Log-Distance Path Loss Model

- Average large-scale path loss at
    $$\overline{PL} (d) \propto \left(\frac{d}{d_{0}}\right)^{n}\ d\ge d_{0}$$
- in dB form
    $$\overline{PL} (dB) = \overline{PL}(d_0) + 10n \log \left(\frac{d}{d_{0}}\right)$$
- where
    - $\overline{PL}$ is the total path loss measured in decibel
    - $d$ is the length of the path
    - $d_0$ is the reference distance, usually 1km or 1 mile for large cell and 1m to 10m for microcell
- path loss exponent

| Environment | Path Loss exponent |
| --- | --- |
| Free space | 2 |
| Urban area cellular radio | 2.7 to 3.5|
| Shadowed urban cellular radio | 3 to 5 |
| in building LoS | 1.6 to 1.8 |
| obstructed in building | 4 to 6 |
| obstructed in factories | 2 to 3 |

## Log-Normal Shadowing

- The path loss equation for the log-distance model does not consider the fact that the surrounding environment may be vastly different at two locations having the same T-R separation.
- This leads to measurements that are different from the predicted average values obtained using the equations shown.
- Measurements show that for any value $d$, the path loss $PL(d)$ in dBm at a location is random and distributed log-normally.
- The log-normal distribution describes the random shadowing effects due to clutter on the propagation path: a factor is added as follows:
    $$PL(d)(d) = \overline{PL}(d) + X_\sigma$$
- in dB form
    $$PL(d)(dB) = \overline{PL}(d_0) + 10n \log\left(\frac{d}{d_0}\right) + X_\sigma$$
- $X_\sigma$ is a zero mean gaussian (normal) distributed random variable (in dB) with standard deviation $\sigma$ (also in dB)
    $$P_r(d)(dBm) = P_t(dBm) - PL(d)(dB)$$
- and
    $$P_r(d)(dBm) = P_t(dBm) - \left[ \overline{PL}(d_0)(dB) + 10n\log\left(\frac{d}{d_0}\right) + X_\sigma(dB)\right]$$

---

# 3.4 Outdoor Propagation Models

*(Okumura and Hata both carry heavy PYQ weight, mostly as numericals: theory below covers the "necessary conditions"/"compare Okumura vs Hata" style questions)*

- Outdoor radio transmission takes place over irregular terrain.
- The terrain profile must be taken into consideration for estimating path loss.
- Trees, buildings, hills etc. must be taken into consideration.
- In early days, the models were based on empirical studies.

## Okumura Model

- Okumura did comprehensive measurements in 1968 and came up with a model.
- Discovered that a good model for path loss was a simple power law where the exponent $n$ is a function of frequency, antenna heights, etc.
- One of the most widely used models for signal prediction in urban areas.
- Applicable to:
    - Frequencies: 150 MHz to 1920 MHz
    - can be extrapolated up to 3GHz
    - Distance: 1km to 100 km
    - Base station antenna heights: 30m to 100m
- Okumura developed a set of curves giving the median attenuation relative to free space in an urban area over quasi-smooth terrain.
- Formula
    $$L_{50}\left(dB\right)=L_{F}+A_{mu}\left(f,d\right)-G\left(h_{te}\right)-G\left(h_{re}\right)-G_{AREA}$$
- where
    - $L_{50}$ = 50% of propagation path loss (median)
    - $L_{F}$ = free space propagation loss
    - $A_{mu}\left(f,d\right)$ = median attenuation relative to free space
    - $G\left(h_{te}\right)$ = base station antenna height gain factor = $20\log \dfrac{h_{te}}{200}$ for 30m to 1000m of $h_{te}$
    - $G\left(h_{re}\right)$ = mobile antenna height gain factor = $10\log\dfrac{h_{re}}{3}$ for 0 to 3m of $h_{re}$
    - $G_{AREA}$ = gain due to type of environment = $20 \log \dfrac{h_{re}}{3}$ for 3m to 10m of $h_{re}$

### Explanation

- Okumura developed a set of curves giving the median attenuation relative to free space ($A_{mu}$) in an urban area over a quasi-smooth terrain with a base station effective antenna height ($h_{te}$) of 200m and a mobile antenna height ($h_{re}$) of 3m.
- These curves were developed from extensive measurements using vertical omni-directional antennas at both the base and mobile, and are plotted as a function of frequency.
- Okumura's model is wholly based on measured data and does not provide any analytical explanation.
- For many situations, extrapolations of the derived curves can be made to obtain values outside the measurement range, although the validity of such extrapolations depends on the circumstances and the smoothness of the curve in question.
- Okumura's model is considered to be among the simplest and best in terms of accuracy in path loss prediction for mature cellular and land mobile radio systems in cluttered environments.
- The major disadvantage with the model is its slow response to rapid changes in terrain; therefore the model is fairly good in urban and suburban areas but not as good in rural areas.

## Hata Model

*(Frequently paired with a Hata vs Okumura comparison, or "necessary conditions for Okumura and Hata")*

- The Hata model is the empirical formulation of the graphical path loss data provided by Okumura and is valid from 150 MHz to 1.5 GHz.
- The median path loss in urban areas is given by
    - $L_{50}$(dB) = 69.55 + 26.16$\log_{10} f_c$ (MHz) - 13.82$\log_{10}(h_{te})$ - $\alpha(h_{re}(m)) + (44.9 - 6.55 \log h_{te}(m))\log_{10}d(km)$
- Parameters:

| parameter | comment |
| --- | --- |
| $L_{50}$ | 50th % value (median) propagation path loss (urban) |
| $f_c$ | frequency from 150 MHz-1.5 GHz |
| $h_{te}, h_{re}$ | base station (30 to 200m) and mobile antenna (1 to 10m) height |
| $\alpha(h_{re})$ | correction factor for $h_{re}$, affected by coverage area|
| d | Tx-Rx separation in km |

Correction factors for Hata model:

![Corrective factors](attachments/hata-corrections.png)

## Longley-Rice Model

- The Longley-Rice model is normally available as a computer program that takes as input:
    - transmission frequency
    - path length
    - polarization
    - antenna heights
    - surface reflectivity
    - ground conductivity and dielectric constant
    - climatic factors
- The main drawback of the Longley-Rice propagation model is that it does not consider the effect of multipath, buildings, foliage and other environmental factors.

---

# 3.5 Indoor Propagation Models

*(Frequently asked directly: "explain indoor propagation models (any two)", "factors that influence the indoor propagation model")*

- Indoor channels are different from traditional mobile radio channels in 2 different ways:
    - the distances covered are much smaller
    - the variability of the environment is much greater for a much smaller range of Tx and Rx separation distances
- The propagation inside a building is influenced by:
    - layout of the building
    - construction materials
    - building type: office area, residential home, factory, etc.
- Indoor propagation is dominated by the same mechanisms as outdoor:
    - reflection, scattering, diffraction
- However, conditions are much more variable:
    - doors, windows open or not
    - the mounting place of antenna: desk, ceiling
    - the level of floors
- The indoor channels are classified as:
    - LoS
    - Obstructed (OBS) with varying degrees of clutter
- Temporal fading for fixed and moving terminals:
    - portable receiver experience in general:
        - Rayleigh fading for OBS propagation paths
        - Ricean fading for LOS paths.
- Multipath delay spread:
    - buildings with fewer metals and hard partitions typically have small rms delay spread: 30 to 60 ns
    - can support data rates in excess of several Mbps without equalization
    - larger buildings with a great amount of metal and open aisles may have rms delay spreads as large as 300ns
    - cannot support data rates more than a few hundred kbps without equalization
- Path loss:
    - the following formula that we have seen earlier also describes the indoor path loss:
    $$PL(d)(dB) = \overline{PL}(d_0) + 10n \log\left(\frac{d}{d_0}\right) + X_\sigma$$
    - n and $\sigma$ depend on the type of the building
    - a smaller value of $\sigma$ indicates better accuracy of the path loss model.

## In-Building Path Loss Factors

- Partition losses (same floor)
    - 2 kinds:
        - hard partitions: walls of the room
        - soft partitions: moveable partitions that do not span to the ceiling
    - path loss depends on the type of partitions
    - various losses:
        - ![Same floor losses](attachments/partition-losses-same-floor.png)
- Partition losses between floors
    - depends on:
        - external dimensions and materials of the building
        - type of construction used to create floors
        - external surroundings
        - number of windows
        - presence of tinting on windows
    - various losses:
        - ![Between Floor losses](attachments/partition-losses-between-floors.png)
- Signal penetration into buildings

## Ericsson Multiple Breakpoint Model

*(Frequently asked directly, short 2-mark definition)*

- Measurements in multi-floor office building.
- Uses uniform distribution to generate path loss values between minimum and maximum range, relative to distance.
- 4 breakpoints consider upper and lower bound on path loss.
- Assumes 30 dB attenuation at $d_0$ = 1m
    - accurate for f = 900 MHz and unity gain antenna
- Provides deterministic limit on the range of path loss at a given distance.
- Diagram of its graph:
    - ![Attenuation in Ericsson model](attachments/ericsson-model.png)

## Attenuation Factor Model

- Obtained by measurement in a multiple floor office building
    $$\overline{PL}(d)(dB) = \overline{PL}(d_0)(dB) + 10n_{SF}\log\left(\dfrac{d}{d_0}\right) + FAF(dB) + \sum PAF (dB)$$
    - where $n_{SF}$ = path loss exponent of the same floor
    - FAF = floor attenuation factor
    - PAF = partition attenuation factor

---

# 3.6 Small-Scale Fading and Multipath

## Fading: Overview

- Rapid fluctuations of received signal strength over short time intervals and/or travel distances.
- Caused by interference from multiple copies of the Tx signal arriving at Rx at slightly different times.
- Three most important effects:
    1. Rapid changes in signal strengths over small distances or short time period
    2. Changes in the frequency of signals
    3. Multiple signals arriving at different times (time dispersion)
- When added together at the antenna, signals are spread out in time.
- This can cause a smearing of the signal and interference between bits that are received.
- Even stationary Tx/Rx wireless links can experience fading due to motion of objects (cars, people, trees, etc.) in the surrounding environment off which come the reflections.
- Multipath signals have randomly distributed amplitudes, phases & direction of arrival.
    - vector summation of ($A\angle\theta$) at Rx of multipath leads to constructive/destructive interference as mobile Rx moves in space with respect to time.
- Fading occurs around received signal strength predicted from large-scale path loss models.
- Effect of fading:
    - ![Received power vs distance during fading](attachments/fading-graph.png)

### Types of Fading

```mermaid
flowchart TD
    A[Fading Types] --> B[Large Scale<br>Fading]
    A --> C[Small Scale<br>Fading]
    B --> D[Path Loss]
    B --> E[Shadowing]
    C --> F[Multipath<br>delay spread]
    C --> G[Doppler<br>spread]
    F --> H[Flat Fading]
    F --> I[Frequency<br>Selective Fading]
    G --> J[Fast<br>Fading]
    G --> K[Slow<br>Fading]
```

- **Large scale fading**
    - is the result of signal attenuation due to signal propagation over large distances and diffraction around large objects in the propagation path.
    - It is due to the following reasons:
        - **Attenuation** in free space: power degrades with $1/d^2$
        - **Shadows**: signal is blocked by obstructing structures.
- **Small-scale fading**
    - characterizes the rapid fluctuations of the received signal strength over very short travel distance or short time duration.
    - rapid fluctuation due to:
        - sum of many contributions from different directions with different phases
        - random frequency modulation due to varying Doppler shifts on different multipath signals
    - As the mobile moves over small distances, the instantaneous received signal will fluctuate rapidly giving rise to small-scale fading.
        - the reason is that the signal is the sum of many contributors coming from different directions
        - Since the phases of these signals are random, the sum behaves like a "noise"
    - the received signal power may change as much as 3-4 orders of magnitude (30dB or 40dB), when the receiver is only moved a fraction of the wavelength
    - Multipath in the radio channel produces small scale fading effects.
    - Important effects:
        - rapid changes in signal strength over a small travel distance or time interval
        - random frequency modulation due to varying Doppler's shifts on different multipath signals
        - Time Dispersion (echoes) caused by multipath propagation delays.
        - Small scale fading occurs specially in heavily populated urban areas.
- The shift in received signal frequency due to motion is called **Doppler's shift** and is directly proportional to velocity and direction of the mobile with respect to the direction of arrival of the received multipath wave.

### Factors Influencing Small-Scale Fading

*(Frequently asked directly, almost always bundled with "types of small-scale fading")*

1. **Multipath propagation**
    - the random phase and amplitude of the different multipath components cause fluctuation in signal strength, thereby inducing small scale fading.
    - multipath propagation often lengthens the time required for the baseband portion of the signal to reach the receiver, which can cause signal smearing (blur) due to inter-symbol interference.
2. **Speed of the mobile**
    - relative motion between BS and MS causes random frequency modulation due to Doppler shift ($f_d$)
    - different multipath components may have different frequency shifts.
3. **Speed of surrounding objects**
    - if the surrounding objects move at a greater rate than the mobile, then this effect dominates the small-scale fading.
4. **The transmission bandwidth of the signal**
    - if Tx signal's bandwidth > bandwidth of the multipath channel, this means the received signal will be distorted.
    - but the received signal will not fade much over a local area
        - the small scale fading is not significant
    - however, if Tx signal's bandwidth < bandwidth of the multipath channel, the amplitude of the signal will change rapidly, but the signal will not be distorted in time.
5. **Transmitted signal bandwidth (relationship to MRC bandwidth)**
    - The mobile radio channel (MRC) is modeled as a filter with specific bandwidth (BW)
    - The relationship between the signal BW & the MRC BW will affect fading rates and distortion, and so will determine:
        - if small scale fading is significant
        - if time distortion of the signal leads to inter-symbol interference (ISI)
    - An MRC can cause distortion/ISI or small-scale fading, typically one or the other.

### Doppler Shift

*(Frequently asked directly: "derive the relation for Doppler shift/spread", pairs naturally with the small-scale fading question above)*

- Motion causes frequency modulation due to Doppler shift $(f_d)$.
- Receiver moving toward the source: receiving frequency is higher.
- Receiver moving away from the source: receiving frequency is lower.
- This resulting effect is the Doppler shift.
- Consider a mobile moving at a constant velocity $v$, along a path segment having length $d$ between points X and Y, while it receives signals from remote source S, as in the figure:
    - ![Figure for analysis](attachments/doppler-illustration.png)
    - the difference in path lengths travelled by the wave from source S to the mobile at points X and Y is $\Delta l = d \cos(\theta) = v \Delta t \cos(\theta)$, where $\Delta t$ is the time required for the mobile to travel from X to Y, and $\theta$ is assumed to be very far away.

#### Derivation

- Phase change due to difference in path length:
    $$\Delta \phi =\frac{2\pi \Delta l}{\lambda }=\frac{2\pi v\Delta t}{\lambda }\cos \left(\theta \right)$$
- Apparent change in frequency, or Doppler Shift:
    $$f_{d}=\frac{1}{2\pi }\cdot \frac{\Delta \phi }{\Delta t}=\frac{v}{\lambda }\cdot \cos \left(\theta \right)$$
- where:
    - $v$ = velocity (m/s)
    - $\lambda$ = wavelength (m)
    - $\theta$ = angle between mobile direction and arrival direction of RF energy
    - `+` shift $\leftarrow$ mobile moving towards S
    - `-` shift $\rightarrow$ mobile moving away from S

## Impulse Response Model of Multipath Channel

### Time and Frequency Dispersions

- **Time Dispersion**
    - when the received signal has a longer duration than that of the transmitted signal, due to different delays of the signal paths, i.e. delay spread into the received signal.
- **Frequency Dispersion**
    - when the received signal has a larger bandwidth than that of the transmitted signal due to the different Doppler shifts introduced by the multipath components, i.e. Doppler Spread into the received signal.

### Delay Spread

- Delay spread effect is mainly due to small-scale fading.
- Because multiple reflections of the transmitted signal may arrive at the receiver at different times and all get added constructively or destructively.
- This can cause a smearing of the signal and interference between bits that are received.
- Representative figure:
    - ![Effect of delay spread](attachments/Effect%20of%20delay%20spread.png)

#### Power Delay Profile

- Random and complicated radio-propagation channels can be characterized using the impulse response approach.
- If the input signal is a unit impulse, the channel impulse response can be written as
    $$h\left(t\right)=\sum_{n=1}^{N}A_{n}\exp \left(-j\phi _{n}\right)\delta \left(t-\tau _{n}\right)$$
- where $A_n, \tau_n$ and $\phi_n$ are the attenuation, delay in time of arrival, and phase corresponding to path $n$ respectively.
- Multipath propagation causes severe dispersion of the transmitted signal, and the expected degree of dispersion is determined through the measurement of the power-delay profile of the channel.
- The power-delay profile provides an indication of the dispersion or distribution of transmitted power over various paths in a multipath model.
    - the delay profile is the expected power variation per unit of time received with a certain excess delay.
    - it is obtained by averaging a large set of impulse responses.

#### Parameters Characterizing Delay Spread Categories

1. **First-Arrival Delay ($\tau_A$)**
    - this is a time delay corresponding to the arrival of the first transmitted signal at the receiver.
    - It is usually measured at the receiver.
    - This delay is set by the minimum possible propagation path delay from the transmitter to the receiver.
    - it serves as a reference, and all delay measurements are made relative to it.
    - any measured delay longer than this reference delay is called an excess delay.
2. **Mean excess delay**
3. **RMS Delay Spread**
4. **Excess delay spread**

### Multipath Channel Performance Parameters

- The time dispersion of the channel is called multipath delay spread, which is one of the important parameters.
- A common measure of multipath delay spread is the root mean square (RMS delay spread $T_{RMS}$)
    - The $T_{RMS}$ is the standard deviation or RMS value of the delay of reflections, weighted proportional to the energy in the reflected waves.
- **Maximum excess delay ($T_m$)**
    - there is some delay between the time when the antenna receives the first copy of the signal on the shortest path and when it receives the last copy of the same signal on the longest path.
    - The maximum delay time spread $T_m$ is the total time interval during which reflections with significant energy arrive.
    - in practice, we use RMS delay spread more than $T_m$.

## Coherence Time and Coherence Bandwidth

*(Very frequently asked directly, either alone or paired with Doppler spread / rms delay spread classification)*

### Coherence Time

- Measure of expected time duration over which the channel appears highly correlated.
- i.e. the coherence time is a measure of the length of time for which the channel can be assumed to be nearly constant.

### Coherence Bandwidth

- it is a measure of the approximate bandwidth within which the channel can be assumed to be nearly constant.
- range of frequencies over which the channel can be considered flat:
    - i.e. channel passes all spectral components with equal gain and linear phase
    - it is a definition that depends on RMS delay spread
- Two sinusoids with frequency separation greater than the Coherence Bandwidth ($B_c$) are affected quite differently by the channel.
- Frequency correlation between two sinusoids: $0 \le C_{r1, r2} \le 1$.
- if we define coherence bandwidth ($B_c$) as the range of frequencies over which the frequency correlation is above 0.9, then
    $$B_c = \frac{1}{50\sigma_\tau}$$
    - where $\sigma_\tau$ is the rms delay spread
- If we define coherence bandwidth as the range of frequencies over which the frequency correlation is above 0.5, then,
    $$B_c = \frac{1}{5\sigma_\tau}$$
    - this is called the 50% coherence bandwidth.
- Example:
    - for a multipath channel, $\sigma_\tau$ is given as 1.37ms
    - the 50% coherence bandwidth is given as: $\dfrac{1}{5\sigma_\tau}$ = 146kHz.
        - this means that for a good transmission from a Tx to a Rx, the range of Tx frequency (channel bandwidth) should not exceed 146kHz, so that all frequencies in this band experience the same channel characteristics.
        - equalizers are needed in order to use transmission frequencies that are separated more than this value.
        - This coherence bandwidth is enough for an AMPS channel (30kHz band needed per channel), but is not enough for a GSM channel (200 kHz needed per channel).

### Doppler Spread and Coherence Time

- Delay Spread and Coherence Bandwidth describe the time-dispersive nature of the channel in a local area.
    - they don't offer information about the time-varying nature of the channel caused by relative motion of Tx and Rx.
- Doppler spread and coherence time are parameters which describe the time-varying nature of the channel in a small-scale region.

#### Doppler Spread

- Measure of spectral broadening caused by the time rate of change of the mobile radio channel.
- Doppler spread, $B_D$, is defined as the maximum Doppler shift: $f_m = v/\lambda$
- Characterizes **frequency-dispersiveness** of the channel, or the spreading of transmitted frequency due to different Doppler shifts.

#### Coherence Time

- Coherence time is the time duration over which the channel impulse response is essentially time invariant.
- If the symbol period of the baseband signal (reciprocal of the baseband signal bandwidth) is greater than the coherence time, then the signal will distort, due to the channel changing during the transmission of the signal.
- Coherence time ($T_C$) and Doppler spread are inversely proportional to one another and is defined as:
    $$T_c \approx 1/f_m$$
- Also defined as:
    $$T_c \approx \sqrt{\frac{9}{16\pi f_m^2}}$$
- Coherence time definition implies that 2 signals arriving with a time separation greater than $T_C$ are affected differently by the channel.
- Large coherence time implies that the channel changes slowly.

---

# 3.7 Types of Small-Scale Fading; Rayleigh and Ricean Distribution

*(Both the classification and the two distributions are frequently asked, often in the same question)*

## Classification Based on Multipath Time Delay Spread

1. **Flat Fading**
    1. BW of signal < BW of channel
    2. Delay spread < symbol period
        - i.e. $B_S << B_C \leftrightarrow \sigma_\tau << T_S$
    3. Spectral characteristics of the transmitted signal are preserved.
2. **Frequency Selective Fading**
    1. BW of signal > BW of channel
    2. Delay spread > symbol period
        - i.e., $B_S > B_C \leftrightarrow \sigma_\tau >> T_S$
    3. Spectral characteristics of the Tx signal are not preserved.

## Classification Based on Doppler Spread

1. **Fast Fading**
    1. High Doppler Spread
    2. Coherence time < Symbol period
    3. Channel variations faster than baseband signal variations
        - i.e. $T_C < T_S$
2. **Slow Fading**
    1. Low Doppler spread
    2. Coherence time > Symbol period
    3. Channel variations slower than baseband signal variations
        - i.e. $T_C >> T_S$

### Frequency Flat Fading

- Occurs when the symbol period of the transmitted signal is much larger than the delay spread of the channel
    - bandwidth of the applied signal is narrow
- May cause deep fades.
    - increase the transmit power to combat this situation

### Fast Fading

- Occurs due to Doppler spread:
    - rate of change of the channel characteristics is larger than the rate of change of the transmitted signal
    - the channel changes during a symbol period
    - the channel changes because of relative motion between the receiver and the baseband signal
    - coherence time ($T_C$) of the channel is smaller than the symbol period ($T_S$) of the transmitted signal
- Occurs when: $B_S < B_D$ and $T_S > T_C$
- where:
    - $B_S$: bandwidth of the signal
    - $B_D$: Doppler spread
    - $T_S$: symbol period
    - $B_C$: coherence bandwidth

### Slow Fading

- Due to Doppler spread:
    - rate of change of the channel characteristics is much smaller than the rate of change of the transmitted signal.
- Occurs when: $B_S >> B_D$ and $T_S << T_C$
- where:
    - $B_S$: bandwidth of the signal
    - $B_D$: Doppler spread
    - $T_S$: symbol period
    - $B_C$: coherence bandwidth

#### Fast vs Slow Fading: deciding factor

- The velocity of the mobile (or the velocity of objects in the channel), and the baseband signaling, together determine whether a signal undergoes fast fading or slow fading.

## Fading Distributions

- Describes how the received signal amplitude changes with time.
    - remember that the received signal is a combination of multiple signals arriving from different directions, phases and amplitudes.
- It is a statistical characterization of the variation of the envelope of the received signal over time.
- Two most common distributions:
    - Rayleigh fading
    - Ricean fading

### Rayleigh Fading

- If all the multipath components have approximately the same amplitude, i.e., MS is far from BS, the envelope of the received signal is Rayleigh distributed.
- No dominant signal component (such as the LoS component).
- Rayleigh Distribution has the probability density function (PDF) given by:
    $$p(r) =
    \begin{cases}
    \dfrac{r}{\sigma^2} e^{-\dfrac{r^2}{2\sigma^2}}\ &(0 \le r \le \infty)\\
    0 & (r \lt 0)
    \end{cases}$$
- $\sigma$ is the rms value of the received voltage signal before envelope detection.
- $\sigma^2$ is the time average power of the received signal before envelope detection.
- Its graph looks like:
    - ![Rayleigh Distribution](attachments/rayleigh-distribution.png)

### Ricean Fading

- When there is a stationary (non-fading) LoS signal present, then the envelope distribution is Ricean.
- The Ricean distribution degenerates to Rayleigh when the dominant component fades away.
- The Ricean distribution is given by
    $$p(r) =
    \begin{cases}
    \dfrac{r}{\sigma^2} e^{-\dfrac{r^2+A^2}{2\sigma^2}} I_0\left( \dfrac{Ar}{\sigma^2} \right)\ &(0 \le r \lt \infty)\\
    0 & (r \le 0)
    \end{cases}$$
    - where A denotes the peak amplitude of the dominant signal, and
    - $I_0$ denotes the zeroth order Bessel function of the first kind.
- The Ricean distribution is often described in terms of a parameter $K$ (Ricean K-factor)
- $K = A^2/(2\sigma^2)$
- In terms of dB, $K(dB) = 10\log(\dfrac{A^2}{2\sigma^2})$ dB
- For $K >> 1$, the Ricean distribution tends towards a Gaussian distribution about the mean.
- Its graph looks like:
    - ![Ricean Distribution](attachments/riciean%20distribution.png)

---

# Additional Info (Numericals: to be revisited)

The following numerical problem types are frequently asked from this chapter but are deferred here per current study focus (theory-first). Revisit once theory is locked in:

- Free-space received power / E-field / power flux density / rms voltage computations (Friis equation).
- Link budget design numericals (Okumura-based, given TX/RX gains, antenna heights, cable losses).
- Far-field distance computation given antenna dimension and frequency.
- Two-ray model path loss numericals (compare with free-space path loss).
- Okumura and Hata model path loss / correction factor computations.
- Mean excess delay, RMS delay spread, and coherence bandwidth computations from a given power-delay profile.
- Smallest symbol period / greatest symbol rate given a power delay profile and $\sigma_\tau / T_S$ criterion.
- Flat vs frequency-selective fading classification numericals (given channel BW vs system BW, e.g. AMPS/GSM).
