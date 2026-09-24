# Microwave Waveguides as Transmission Lines

- Waveguides are hollow metallic structure inside of which are filled with dielectrics (usually air) to transmit electromagnetic wave energy through multiple scattering along the walls of the guide.
- In waveguides electric and magnetic fields (E- and H-field) are confined to the space within the guide, so that no power is lost through radiation and also the dielectric loss is negligible since the guides are air filled.
- Only small amount of power loss is possible as heat in the walls of the waveguide
- Waveguides have more power handling capacity and less attenuation.
- Most commonly used waveguides are of two types, rectangular waveguide and circular waveguide.
- Waveguides are characterized by two main modes of EM wave propagation
    - i.e., transverse electric and transverse magnetic (TE and TM) waves
    - the E-field component in the direction of propagation (i.e. z direction) is zero
    - and propagation takes place in the transverse i.e., x and y directions.
- Similarly, in the TM mode,
    - the magnetic field component in the z-direction in zero and propagation exists in x and y directions.

## Rectangular Waveguide

- Rectangular waveguides are hollow tube with rectangular cross section.
- The conducting walls confine the EM fields and guide the waves in the direction of propagation as the component of Te or TM modes.
- In both TE and TM modes,
    - two subscripts m and n are used to denote the number of half sine wave variations of electric or magnetic fields,
    - where m is wider dimension (a) and n for the narrow dimension (b).
- In each mode, there is one dominant mode which provides low loss and minimum distortion.

### Solution of wave equation in rectangular coordinates.

- Though there exists time domain and frequency domain for the solutions of the wave equations.
- For simplicity, the solution to the wave equation in three dimensions plus time-varying variables, only the sinusoidal steady-state condition or the frequency-domain solution will be considered.
- Below figure showhs the considered waveguide.
    - ![Rectangular coordinate system in Rectangular Waveguide](attachments/WG-rect-dimensions.png)
- The electric and magnetic wave equation from Maxwell's field equations in frequency domains can be given as:
    $$\begin{align}
        \nabla^2E = \gamma^2E\\
        \nabla^2H = \gamma^2H
    \end{align}$$
- Where the propagation constant, $\gamma = \sqrt{j\omega\mu(\sigma + \omega\epsilon)} = \alpha + j\beta$.
- These are the vector wave equations.
- Rectangular components of E or H in the rectangular coordinates satisfy the complex wave equation or Helmholtz wave equation:
    $$\begin{align}
        \nabla^2\psi = \gamma^2\psi
    \end{align}$$
- The helmholtz equation in rectangular coordinate system is:
    $$\begin{align}
        \frac{\partial^2\psi}{\partial x^2} + \frac{\partial^2\psi}{\partial y^2} + \frac{\partial^2\psi}{\partial z^2} = \gamma^2\psi
    \end{align}$$
- The solutions of this linear and inhomogeneous partial differential equation in three dimensions can be given in the form of
    $$\begin{align}
        \psi = X(x) \cdot Y(y) \cdot Z(z)
    \end{align}$$
- Where, X(x) is a function of x coordinate only, and same for Y and Z.
- Solution of equation (5) using (4) and division of the resultant by (5) gives
    $$\begin{align}
        \frac1x \frac{d^2x}{dx^2} + \frac1y \frac{d^2y}{dy^2} + \frac1x \frac{d^2z}{dz^2}
    \end{align}$$
- The general solution of (6) will be
    $$\begin{align}
        \frac{d^2x}{dx^2} &= -k_x^2 X\\
        \frac{d^2y}{dy^2} &= -k_y^2 X\\
        \frac{d^2z}{dz^2} &= -k_z^2 X\\
    \end{align}$$
- will be in the form of
    $$\begin{align}
        X &= A \sin(k, x) + B \cos(k, x)\\
        Y &= C \sin(k, y) + D \cos(k, y)\\
        Z &= E \sin(k, z) + F \cos(k, z)
    \end{align}$$
- where, $k_x$, $k_y$, $k_z$ are the constants in the direction of x, y, z.
- The total solution of Helmholtz equation is
    $$\begin{align}
        \psi = XYZ
    \end{align}$$
- Note: propagation constant in the guide $\gamma_g$ differs from intrinsic propagation constant $\gamma$ of the dielectric given as
    $$\begin{align}
        \gamma_g^2 = \gamma^2 + k_x^2 + k_y^2 = \gamma^2 + k_c^2
    \end{align}$$
- where, $k_c$ is the cutoff wave number.
- For a lossless dielectric, $\gamma^2 = -\omega^2 \mu \epsilon$, then
    $$\begin{align}
        \gamma_g = \pm \sqrt{\omega_c^2 \mu \epsilon - k_c^2}
    \end{align}$$
- There will be three cases for the propagation constant $\gamma_g$ in the waveguide

#### Case I

- There will be no propagation if $\omega_c^2 \mu \epsilon = k_c^2$ and $\gamma_g = 0$
- This is the critical condition for cutoff propagation, where the cutoff frequency $f_c$ will be
    $$\begin{align}
        f_c = \frac{1}{2\pi \sqrt{\mu\epsilon}} \sqrt{k_x^2 + k_y^2}
    \end{align}$$

#### Case II

- The wave will be propagating in the guide if $\omega_c^2 \mu\epsilon > k_c^2$ and
    $$\begin{align}
        \gamma_g = \pm \beta_g = \pm j\omega\sqrt{\mu\epsilon} \sqrt{1 -\left( \frac{f_c}{f} \right)^2}
    \end{align}$$
- This means that the opearting frequency $f$ must be above the cutoff frequency in order to have the wave propagation

#### Case III

- The wave will be attenuated if $\omega^2\mu\epsilon < k_c^2$ and
    $$\begin{align}
        \gamma_g = \pm \alpha_g = \pm \omega\sqrt{\mu\epsilon} \sqrt{\left( \frac{f_c}{f} \right)^2 - 1}
    \end{align}$$
- This means that the operating frequency $f$ must be below theh cutoff frequency.
- The wave will decay exponentially withh respect to a factor of $\alpha_g z$.
- The final solution of Helmholtz equation in rectangular coordinates, will be:
    $$\begin{align}
        \psi\ = \left[ A\sin(k_x, x) + B\sin(k_x, x) \right] \left[ C\sin(k_y, y) + D\sin(k_y, y) \right] e^{-j\beta_g z}
    \end{align}$$

### TE mode in rectangular wave guides.

- The $TE_{mn}$ modes in rectangular waveguides are characterized by $E_z = 0$ and $H_z \neq 0$.
- It means $H_z$ exists in order to have energy propagation.
- From the given Helmholtz equation
    $$\begin{align}
        \nabla^2H_z = \gamma^2H_z
    \end{align}$$
- Gives the solution in the form of (19) as:
    $$\begin{align}
        H_z &= H_{0z} \cos\left(\frac{m\pi x}{a}\right) \cos\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        H_x &= \frac{-j\beta}{kc^2} \frac{\partial H_z}{\partial x} = H_{0x} \sin\left(\frac{m\pi x}{a}\right) \cos\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        H_y &= \frac{-j\beta}{kc^2} \frac{\partial H_z}{\partial y} = H_{0y} \cos\left(\frac{m\pi x}{a}\right) \sin\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        E_x &= \frac{-j\beta\mu}{kc^2} \frac{\partial H_z}{\partial x} = E_{0x} \cos\left(\frac{m\pi x}{a}\right) \cos\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        E_y &= \frac{-j\beta\mu}{kc^2} \frac{\partial H_z}{\partial y} = E_{0x} \cos\left(\frac{m\pi x}{a}\right) \cos\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        E_z &= 0
    \end{align}$$
- where $E_0$ and $H_0$ are amplitudes and
    $$\begin{align}
        k_c^2 &= \left(\frac{m\pi}{a}\right)^2 + \left(\frac{n\pi}{b}\right)^2\\
        \beta &= \sqrt{\omega^2\mu\epsilon - \left(\frac{2\pi}{\lambda c}\right)^2}
    \end{align}$$
- Where $\lambda c$ is the cutoff wavelength.
    $$\begin{align}
        \lambda_c &= \frac{2\pi}{k_c} = \frac{1}{\sqrt{\left(\frac{m}{2a}\right)^2+\left(\frac{n}{2b}\right)^2}}\\
        k_c &= \omega_c \sqrt{\mu\epsilon}\\
        f_c &= \frac{1}{2\sqrt{mu\epsilon}} \sqrt{\left(\frac{m}{a}\right)^2+\left(\frac{n}{b}\right)^2}
    \end{align}$$
- where $f_c$ is the cutoff frequency
    $$\begin{align}
        \beta_g &= \omega\sqrt{\mu\epsilon} \sqrt{1-\left(\frac{f_c}{f}\right)^2}\\
        \alpha_g &= \frac{1}{\sqrt{1-\left(\frac{f_c}{f}\right)^2}}\\
        \nu &= \frac{v_p}{\sqrt{1-\left(\frac{f_c}{f}\right)^2}}\\
        Z_g &= \frac{E_x}{E_y} = \frac{\omega\mu}{\beta_g} = \frac{\eta}{\sqrt{1-\left(\frac{f_c}{f}\right)^2}}
    \end{align}$$
- where $v_p = 1/\sqrt{\mu\epsilon}$ is the phase velocity
- and $\eta = \sqrt{\mu/\epsilon}$ is the intrinsic impedance.

### TM Mode in Rectangular Waveguide

- The $TM_{mn}$ mode in rectangular wave guide is characterized by $H_z = 0$ and $E_z \neq 0$.
- It means $E_z$ exists in order to carry energy transmission.
- The EM field equations for this mode can be derived analytically as is done for TE mode which is defined by Helmholtz equation for E-field in z-direction.
- The boundary conditions for $E_z$ require that the field vanishes the waveguide walls, since the tangent component of $E_z$ is zero on the conduction surface.
- Thus the solution of (19) reduces to

$$\begin{align}
    E_z &= E_{0z} \sin\left(\frac{m\pi x}{a}\right) \sin\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
\end{align}$$
- where m = 1, 2, 3 and n = 1, 2, 3...
- Note: if either m = 0, n = 0, the field intensities all vanish.
- For $H_z$ = 0, the field equations after expanding $\nabla \times H = j\omega\epsilon E$ are given by
    $$\begin{align}
        E_x &= \frac{-j\beta}{kc^2} \frac{\partial E_z}{\partial x} = E_{0x} \cos\left(\frac{m\pi x}{a}\right) \sin\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        E_y &= \frac{-j\beta\mu}{kc^2} \frac{\partial H_z}{\partial y} = E_{0x} \sin\left(\frac{m\pi x}{a}\right) \cos\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        H_x &= \frac{-j\beta\epsilon}{kc^2} \frac{\partial H_z}{\partial x} = H_{0x} \sin\left(\frac{m\pi x}{a}\right) \cos\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        H_y &= \frac{-j\beta\epsilon}{kc^2} \frac{\partial H_z}{\partial y} = H_{0y} \cos\left(\frac{m\pi x}{a}\right) \sin\left(\frac{n\pi y}{b}\right) e^{-j\beta_z}\\
        H_z &= 0
    \end{align}$$
- Some of the relations are similar from TM Mode in comparison:
$$\begin{align}
    f_c &= \frac{1}{2\sqrt{mu\epsilon}} \sqrt{\left(\frac{m}{a}\right)^2+\left(\frac{n}{b}\right)^2}\\
    \lambda_c &= \frac{2\pi}{k_c} = \frac{1}{\sqrt{\left(\frac{m}{2a}\right)^2+\left(\frac{n}{2b}\right)^2}}\\
    \beta_g &= \omega\sqrt{\mu\epsilon} \sqrt{1-\left(\frac{f_c}{f}\right)^2}\\
    \alpha_g &= \frac{1}{\sqrt{1-\left(\frac{f_c}{f}\right)^2}}\\
    \nu &= \frac{v_p}{\sqrt{1-\left(\frac{f_c}{f}\right)^2}}\\
    Z_g &= \frac{E_x}{E_y} = \frac{\omega\mu}{\beta_g} = \frac{\eta}{\sqrt{1-\left(\frac{f_c}{f}\right)^2}}
\end{align}$$

## Circular Waveguide

- Circular waveguide is a tubular circular structure with hollow metallic where a plane wave propagates in TM and TE modes.
- The solution of wave equation for circular waveguide follows the cylindrical coordinate system.
- The scalar Helmholtz equation in a cylindrical coordinates is given by
$$\begin{align}
    \frac1r \frac{\partial}{\partial r} \left(r \frac{\partial \psi}{\partial r}\right) + \frac{1}{r^2} \frac{\partial^2 \psi}{\partial\phi^2} + \frac{\partial^2}{\partial z^2} = \gamma^2\psi
\end{align}$$
- Using method of separation, the solution can be assumed in the following form
$$\begin{align}
    \psi = R(r)\cdot \Phi(\phi)\cdot Z(z)
\end{align}$$
- where R is a function of r and similarly for $\Phi$ and Z
- Substitution of (49) in (48) and division of the resultant by (49) yield
$$\begin{align}
    \frac{1}{rR} \frac{d}{dr}(r\frac{dR}{dr}) + \frac{1}{r^2\phi}\dfrac{d^2\Phi}{d\phi^2} + \frac{d^2z}{dz^2} = \gamma^2
\end{align}$$
- Since the sum of the three independent term is a constant, each of the three terms must be a constant. THe third term can be set equal to a constant $\gamma_g^2$, giving
$$\begin{align}
    \frac{d^2z}{dz^2} = \gamma_g^2 Z
\end{align}$$
- The solution of this equation is given by
$$\begin{align}
    Z = Ae^{-\gamma_gz} + Be^{\gamma_gz}
\end{align}$$
- where $\gamma_g$ is the propagation constant in the waveguide.
- Insert $\gamma_g^2$ for third term in the left hand size of the equation (5), and multiplying the resultant by $r^2$ yield
$$\begin{align}
    \frac{1}{rR} \frac{d}{dr}\left(r \frac{dR}{dr}\right) + \frac{1}{r^2\phi}\frac{d^2}{d\phi^2} - (\gamma^2 - \gamma_g^2)r^2 = 0
\end{align}$$
- The second term is a function of $\phi$ only; hence equating the second term to a constant ($-n^2$) yields
$$\begin{align}
    \frac{d^2\Phi}{d\phi^2} = -n^2 \phi
\end{align}$$
- The solution of this function is a harmonic function of the form
$$\begin{align}
    \Phi\ = A_n \sin(n\phi) + B_n \cos(n\phi)
\end{align}$$
- Replacing the $\Phi$ term by $-n^2$ in (53) and multiplying by R gives:
$$\begin{align}
    \frac{1}{rR} \frac{d}{dr}\left(r\frac{dR}{dr}\right) + \left[(k_c - r)^2 - n^2\right]R = 0
\end{align}$$
- This is Bessel's equation of order n in which
$$\begin{align}
    k_c^2 + \gamma^2 = \gamma_g^2
\end{align}$$
- This equation is called characteristic equation of Bessel's equation.
- For a lossless guide, (57) reduces to
$$\begin{align}
    \beta_g = \pm \sqrt{\omega^2\mu\epsilon - k_c^2}
\end{align}$$
- The solution of Bessel's equations are
$$\begin{align}
    R = C_n J_n(k_cr) + D_n N_n(k_cr)
\end{align}$$
- where $J_n(k_cr)$ is the nth order Bessel function of the first kind, representing a standing wave of $\cos(k_cr)$ for r < a and $N_n(k_cr)$ is the nth-order bessen function of the second kind, representing a standing wave of $\sin(k_cr)$ for r > a
- The total solution of the Helmholtz equation in cylindrical coordinates is, therefore
$$\begin{align}
    \psi\ = [C_n J_n (k_cr) + D_n N_n(k_cr)][A_n \sin(n\phi) + B_n \cos(n\phi)] e^{-j\beta_gz}
\end{align}$$
- At $R = 0$, $k_cr = 0$; then the function $N_n$ approaches infinity, so $D_n$ = 0.
- It means that at $r = 0$ on the z axis, the field must be finite.
- Also by theh use of trigonometric manipulations, the two sinusoidal terms become
$$\begin{align}
    A_n \sin(n\phi) + B_n \cos(n\phi) = \sqrt{A_n^2 + B_n^2} \cos\left[n\phi + \tan^-1\left(\frac{A_n}{B_n}\right)\right] = F_n \cos(n\phi)
\end{align}$$
- Finally the solution of the Helmholtz equation is reduced to
$$\begin{align}
    \psi\ = \psi_0 J_n(k_cr) \cos(n\phi) e^{-j\beta_gz}
\end{align}$$
- Where $\psi_0$ is the amplitude constant, $n$ is the Bessel's constant of nth order, r is the radius
- $\phi$ is the azimuth angle, $k_c$ is the wave number and $\beta$ is the phase constant

### TE Mode in Circular Waveguide

- The $TE_{rp}$ mode in circular waveguide is characterized by $E_z = 0$ and $H_z \neq 0$.
- Taking solution of field equation of $H_z$ defined by Helmholtz equation as
$$\begin{align}
    H_z = H_{0z} J_n(k_cr) \cos(n\phi) e^{-j\beta_gz}
\end{align}$$
- Maxwell's curl equation in frequency domain for a lossless dielectric are
$$\begin{align}
    \nabla \times E &= -j\omega\mu H\\
    \nabla \times H &= j\omega\epsilon E
\end{align}$$
- Solving these equations using their field components, the TE mode field equations can be given as
$$\begin{align}
    H_r &= \frac{-j\beta}{k_c^2} \frac{\partial H_z}{\partial r} = \frac{E_{0\phi}}{z_g} J_n(k_cr) \cos(n\phi) e^{-j\beta_gz}\\
    H_\phi &= \frac{-j\beta}{k_c^2} \frac1r \frac{\partial H_z}{\partial \phi} = \frac{E_{0r}}{z_g} J_n(k_cr) \sin(n\phi) e^{-j\beta_gz}\\
    E_r &= \frac{-j\omega\mu}{k_c^2} \frac1r \frac{\partial H_z}{\partial \phi} = E_{0r} J_n(k_cr) \sin(n\phi) e^{-j\beta_gz}\\
    E_\phi &= \frac{-j\omega\mu}{k_c^2} \frac{\partial H_z}{\partial r} = E_{0\phi} J_n(k_cr) \cos(n\phi) e^{-j\beta_gz}\\
\end{align}$$
- where
$$\begin{align}
    Z_g &= \frac{E_r}{H_\phi} = \frac{-E\phi}{H_r}\\
    k_c &= \omega\sqrt{\mu\epsilon}\\
    \beta &= \sqrt{\omega^2\mu\epsilon} - k_c^2\\
    f_c &= \frac{k_c}{2\pi r\sqrt{\mu\epsilon}}\\
    \nu_g &= \frac{\omega}{\beta} \frac{v_p}{\sqrt{1-\left(\frac{f_c}{f}\right)^2}}\\
    v_p &= \frac{1}{\mu\epsilon}\\
    \eta &= \sqrt{\frac{\mu}{\epsilon}}\\
    \lambda &= \frac{v_p}{f}
\end{align}$$

### TM Mode in Circular Waveguide

- The $TM_{mn}$ mode in circular waveguide is characterized by $H_z = 0$ and $E_z \neq 0$
- It means $E_z$ exists in order to carry transmission energy.
- The field equations for this mode is analytical to that for TE mode which are defined by solving the Helmholtz equation given in the form of
$$\begin{align}
    E_z = E_{0z} J_n(k_cr) \cos(n\phi) e^{-j\beta_gz}
\end{align}$$
- Maxwell's curl equation in the frequency-domain for a lossless dielectric gives in cylindriacl coordinates
$$\begin{align}
    \nabla \times E = -j\omega\mu H\\
    \nabla \times H = -j\omega\epsilon E
\end{align}$$
- Solving these equations using their field components, the TM mdoe field equations can be derived as
$$\begin{align}
    E_r &= \frac{-j\beta}{k_c^2} \frac{\partial E_z}{\partial r} = E_0 J_n(k_cr)\cos(n\phi)e^{-j\beta_gz}\\
    E_\phi &= \frac{-j\beta}{k_c^2} \frac1r \frac{\partial E_z}{\partial\phi} = E_0 J_n(k_cr)\sin(n\phi)e^{-j\beta_gz}\\
    H_r &= \frac{-j\omega\epsilon}{k_c^2} \frac1r \frac{\partial E_z}{\partial\phi} = \frac{E_{0r}}{z_g} J_n(k_cr)\sin(n\phi)e^{-j\beta_gz}\\
    H_\phi &= \frac{-j\omega\epsilon}{k_c^2} \frac{\partial E_z}{\partial r} = \frac{E_{0\phi}}{z_g} J_n(k_cr)\cos(n\phi)e^{-j\beta_gz}\\
\end{align}$$
- where,
$$\begin{align}
    z_g = \frac{E_r}{H_\phi} = \frac{\beta}{\mu\epsilon} = \eta\sqrt{1 - \left(\frac{f_c}{f}\right)^2}
\end{align}$$
- Other characteristic equations are identical to thohse of TE mode

## Degenerate Modes

- In waveguides, the higher order mode, hahving the same cutoff ferquency are called generate mode.
- In waveguide the possible $TE_{mn}$ and $TM_{mn}$ modes are always degenerate.
- The dimension of waveguide are always chosen such that only the higher modes are allowed to propagate.

## Dominant Modes

- In waveguides, the propagation mode that has the lowest cutoff frequency is called the domainant mode.
- In rectangular waveguide the $TE_{01}$ and $TM_{11}$ provide theh lowest cutoff frequency, hence are called the dominant modes.

# Input-Output Coupling of Waveguides

- The input and output coupling of microwave energy into or from a waveguide by inserting a small probe or loop inside it, which set up E-field and H-field in the waveguide, respectivey.
- Accordingly they are known as probe coupling and loop coupling.

## Probe Coupling

- Probe coupling are primarily for setting up an E-field, where a small probe inserted inside of a waveguide acts as quarter-wave antenna as shown in figure:
![Probe Coupling for Rectangular Waveguide](attachments/WG-coupling-probe.png)
- By probe coupling in rectangular waveguide, 
    - first an E-field is produced which causes an H-field.
- A coaxial line maybe coupled to a waveguide by means of parallel placement to the E-field or near E-field of maximum value.
- The most efficient place to locate the probe is the center of the wider wall, parallel to the narrower wall, and one quarter-wavelength from shorted end of teh waveguide.
- Therefore, the energy transfer is maximum at this point.
- The output coupling of the energy from the waveguide is simply a reversal of the input coupling using the same type of probe.

## Loop Coupling

- The loop coupling is basically for coupling of H-field, where the loop of conductor is placed near the maximum H-field as shown below.
![Loop coupling in a rectangular WG](attachments/WG-coupling-loop.png)
- By loop coupling in rectangular waveguide
    - first an H field is produced which causes an E-field.
- The loop can be mounted at the end of shorted wavelength or in the middle of top or bottom wall at a distance of half-wavelength.
- The plane of the probe should be perpendicular to H-field for maximum coupling
- The degree of coupling also depends on the loop shape, size, orientation and number of loops.
- For the most efficient coupling to the waveguide, the loop is inserted at one of several points where the H-field will be of greatest strength.

# Microwave Cavity Resonators

- Microwave resonators are tuneable resonant circuits built for different frequency ranges and applications.
- By definition, a resonant cavity is any space completely enclosed by conducting walls that can contain oscillating EM fields and possess resonant properties.

## Properties

The characteristic properties of the cavity resonator can be described as

1. Resonant Frequency
    - this is theh frequency (and wavelength) in which the energy in waveguide attains maximum value
2. Quality or Q-factor
    - thish is known as measure of frequency selectivty of teh resonator.
    - Resonant cavities have a very high Q-factor.
    - The high Q-factor gives these devices a narrow band pass and allow very accurate tuning.
    - It is defined by the following equation
        $$Q = \frac{\omega_0 W}{P} = 2\pi \frac{\text{Maximum energy stored in tank circuit}}{\text{Energy dissipated per cycle}}$$
    - where $\omega_0$ is the angular resonant frequency,
    - $W$ is the maximum stored energy
    - $P$ is the average power loss
3. Input Impedance
    - it specifies the matching/mismatching with the line and load impedances.

## Types of Cavity Resonators

### Rectangular Cavity Resonator

- Rectangular cavity resonators are the hollow metallic enclosures which exhibit resonant behavior when excited by EM fields.
![Rectangular Resonator](attachments/WG-resonator-rect.png)
- Figure below is RCR using RWG which is shorted at both ends.
- The resonant frequency ($f_0$) of the resonator is calculated as
    $$f_r = \frac{c}{2\sqrt{\mu\epsilon}} \sqrt{\left(\frac{m}{a}\right)^2 + \left(\frac{n}{b}\right)^2 + \left(\frac{p}{l}\right)^2}$$
    - where, c is the speed of light
    - a, b, l are dimensions of waveguide
    - m, n are mode of waveguide
    - $p$ is positive integer representing number of half wave variation in z-direction.
- The modes are called $TE_{mnp}$ and $TM_{mnp}$
- The resonance frequency is different for different modes and modes with lowest resonance frequency is called primary mode.

### Cylindrical Cavity Resonator

- Cylindrical cavity resonator is a circular waveguide shorted at both ends.
- Figure is shown below
![Cylindrical resonator](attachments/WG-resonator-cyl.png)
- The modes are $TE_{mnp}$ and $TM_{mnp}$.
- Resonant frequency is given as:
    $$f_r = \frac{c}{2\pi \sqrt{\mu\epsilon}} \sqrt{\left(\frac{Pmn}{a}\right)^2 + \left(\frac{p\pi}{l}\right)^2}$$

# Tuning of Cavity

- Tuning of waveguide cavities can be done by changing inductive or capacitive properties of the waveguides by inserting specially designed apertures or iris inside the cavity with the help of posts or screws.
- The tuning is classified as inductive, capacitive and resonant tuning.
- Cavity tuning provides impedance matching, tuning of the resonant frequency and the Q-factor

## Inductive Tuning

- For the inductive tuning, the conductive apertures are extended from the side walls
    - i.e. b-dimensions
    - of the WG so that it provides the effect of inductive succeptance by
    - permitting current flow and energy storage in the H-field.
- The amount of inductive succeptance depends upon the length of the window.
- Figure below
![Inductive tuning of rectangular waveguide](attachments/WG-tuning-inductive.png)

## Capactive Tuning

- In order to provide capacitve tuning, conductive aperture are considered which extend into the waveguide from top and bottom walls
    - which constitute the capacitive succeptance.
- The amount of succeptance value depends on the closeness of the window.
- Figure
![Capacitive tuning of a rectangular wg](attachments/WG-tuning-capacitive.png)

## Resonant Tuning

- This is the combination of capacitive and inductive tuning.
- An adjustable slung, screw, window, aperture or iris is used to tune resonators
    - by placing them in the area of maximum E lines (capacitive tuning) and H lines (inductive tuning)
- By moving the slung in or out,
    - meaning to the changes of the hdistance between the plates,
    - varies the resonant frequency
- Accordingly, the value of the Q-factor also increases or decreases withh the increase or decrease of the aperture size.
- Figure
![Resonant tuning of rectangular Wg](attachments/WG-tuning-resonant.png)

# Directional Coupler

- Basically is afour port junction that provides method of sampling of incident and reflected microwave power accurately with minimal disturbance to the transmission line.
- It consists of primary waveguide and secondary waveguide as shown in figure
![Directional Coupler](attachments/WG-coupler-directional.png)
- The directional coupler with its four port terminals has such characteristics that there is free transfer of power without any reflection between port-1 and port-3, and no transfer of power between port-1 and port-2, or, port-3 and port-4.
- Degree of coupling between the parts depends upon the structure of units.

## Performance parameters

1. Coupling factor
    - the coupling factor is the measure of the hincident power($P_i$) to the forward power ($P_f$)
    - in dB:
        $$CF = 10\log_{10}\left(\frac{P_i}{P_f}\right)$$
2. Directivity
    - the directivity of a directional coupler is a measure of the ratio of the forward power to the backward power ($P_b$)
    - in dB:
        $$D = 10\log_{10}\left(\frac{P_f}{P_b}\right)$$
3. Isolation
    - The ratio of the incident power to the backward power defines the isolation of the directional coupler.
    - in dB:
        $$10\log_{10}\left(\frac{P_i}{P_b}\right) = 10\log_{10}\left(\frac{P_i\cdot P_f}{P_b\cdot P_f}\right)$$
    - i.e. Coupling factor + directivity (in dB)
4. Insertion Loss
    - The IL relates the total output power from all the ports, i.e., the sum of the $P_f$, $P_b$ and reflected power ($P_r$), relative to the input power
    - in dB:
        $$10\log_{10}\left(\frac{P_f + P_b + P_r}{P_i}\right) dB$$
5. Frequency Sensitivity
    - This is also called the coupling flatness over the specified frequency range.
    - This is the measure of how coupling varies over a given frequency range.
6. Impedance:
    - Characteristic impedance ($Z_0$) for the device
7. VSWR
    - This is the measure of the impedance of the device relative to $Z_0$
8. Amplitude Balance
    - It measures the maximum variation of the input signal among the output ports due to the attenuation.
9. Phase Balance
    - It measures the maximum variation of phase between two or more output signals fed from a common input

# Microwave Junctions (Tees)

- The physical handling and installation of two or more waveguides by bending, twisting and joining help to tap the microwave power flowing  through a main line into auxiliary lines.
- Microwave Tees are formed by joining two rectangular waveguide sections to form into the shape or split two or more signals.
- The commonly used junctions are E-plane Tee, H-plane Tee, Hybrid Junctions (Magic Tee and Hybrid Ring).

## E-Plane Tee Junction

- This type of Tee is made up of a longer piece of a rectangular waveguide, called co-planner (or collinear) arms, to which a shorter piece of rectangular section, called E-arm is joinedas shown in figure:
![Schematic of an E-plane Tee](attachments/tee-e-plane.png)
- Illustration of the cross-sectional view of the E-plane Tee with input and output patterns of E-field patterns in the various arms
    - Divider
    ![wave pattern E-plane Tee Divider](attachments/tee-e-plane-pattern-divider.png)
    - Adder
    ![wave pattern E-plane Tee Adder](attachments/tee-e-plane-pattern-adder.png)
- As shown above, E-plane Tee can be used as a signal combiner or splitter.
- If a signal is feed from part-3, the E-field splits equally into port-1 and port-2 being $180^0$ out of phase, while input signals from port-1 and port-2 combine at port-3 providing phaser sum.
- Since the E-plane Tee is a three port device, the scattering matrix will be given as
    $$\begin{bmatrix} S_{11} & S_{12} & S_{13} \\ S_{21} & S_{22} & S_{23} \\ S_{31} & S_{32} & S_{33} \end{bmatrix}$$
- Further, if the fields, fed at port-1 and port-2 are of the same amplitude and phase then the output at port-3 will be zero due to the phase cancellation.
- For a symmetric three port E-plane T.
- If theh energy fed at port-3 then outputs at port-1 and port-2 are out of phase by $180^0$.
- The scattering coefficient then will be $S_{23} = -S_{13}$
- From the symmetric property,
    $$S_{ij} = S_{ji}$$
- So
    $$S_{11} = S_{22}$$
    $$S_{12} = S_{21}$$
    $$S_{13} = S_{31}$$
    $$S_{23} = S_{32}$$
- By substituting the above properties in $[S]$ matrix, we get
    $$[S] = \begin{bmatrix} S_{11} & S_{12} & S_{13} \\ S_{12} & S_{11} & -S_{13} \\ S_{13} & -S_{23} & 0 \end{bmatrix}$$
- $S_{33} = 0$, if port-3 is perfectly matched.
- The E-plane Tee behaves as a series junction.

## H-Plane Tee Junction

- With this Tee the axis of the side arm is parallel to the planes of H-field.
- It is also called shunt Tee.
- An H-plane Tee junction is formed by cutting a rectangular slot along the width of the main guide and attaching another waveguide, the side arm called H-arm (port-3) as shown below
![Schematics of an H-Plane Tee](attachments/tee-h-plane.png)
- The collinear arms i.e. port-1 and 2 are called coplanar arms.
- All three arms lie in the plane of H-field which is equally divided.
- The magnetic fields divides itself in to the arms and therefore it is also called a current junction.
- If port-1 and port-2 are terminated with matched load, and a signal is fed into H-arm it splits equally into port-1 and port-2 in phase.
    ![wave pattern H-plane Tee Divider](attachments/tee-h-plane-divider.png)
- But if two input signals fed into port-1 and port-2, the output combines at H-arm being phaser sum as shown belo.
    ![wave pattern H-plane Tee Adder](attachments/tee-h-plane-adder.png)
- For a symmetric H-plane Tee junction, $S_{11} = S_{22} = S_{33} = 0$
- And if the network is lossless then the scattering matrix must be unitary.

## Hybrid Junction

- Hybrid junction acts as four port hybrid circuit in which the signal incident at any one of the ports gets divided between two other ports, with the forth port isolated  from isolated from the rest of the three ports.
- All the output ports are supposed to be connected to perfect matching terminations.
- There are two magic junctions Magic Tee and Hybrid ring.

### Magic Hybrid Tree

- The magic hybrid junction is a combination of E-plane and H-plane Tees.
- Rectangular slots are cut both side along the width and breadth of a waveguide and side arms are attachehd to make magic tee as shown below
![Hybrid Magic Tree Schematics](attachments/tee-hybrid.png)
- The hybrid junctions combine theh power dividing property of both E-plane and H-plane Tee and all the ports are completely matched.
- In Fig, port-1,2,3 form H-pane Tee and port-1,2,4 form E-plane Tee.
- Port 1,2 are coplanar arms, Port-3 H-arm and Port-4 is E-arm.

The input/output characteristics of this magic junction can be summarized as

1. All ports are perfectly matched and divided into equidistance
2. If a signal is fed at coplanar arms it splits equally between E-arm and H-arm
3. At each output ports the output power will be half of the input power
4. There is a complete isolation between the coplanar arms.
5. If an input signal is fed at the H-arm, it splits equally into port-1 and port-2 in phase.
6. If an input signal is fed at the E-arm, it splits equally between into port-1 and port-2 in 180 out of phase.

By using the E and H type Tee junction, its scattering matrix can be obtained as
$$ [S] = \begin{bmatrix} S_{11} & S_{12} & S_{13} & S_{14} \\ S_{21} & S_{22} & S_{23} & S_{24} \\ S_{31} & S_{32} & S_{33} & S_{34} \\ S_{41} & S_{42} & S_{43} & S_{44} \end{bmatrix}$$

Using the properties of the E-plane and H-plane Tees i.e.
- $S_{24} = -S_{14}$, $S_{23} = S_{13}$
- the isolation between port-3 and port-4 gives $S_{34} = S_{43} = 0$
- the symmetric property gives $S_{ij} = S_{ji}$ for $i \neq j$
- and the matched load conditions providing $S_{33} = S_{44} = 0$
- the scattering matrix is finally
$$ [S] = \begin{bmatrix} S_{11} & S_{12} & S_{13} & S_{14} \\ S_{21} & S_{22} & S_{13} & -S_{14} \\ S_{13} & S_{13} & 0 & 0 \\ S_{14} & -S_{14} & 0 & 0 \end{bmatrix}$$

### Hybrid Ring (rat-race junction)

- The rat-race hybrid ring coupler is a four-port network.
- Unlike the magic hybrid Tee, it was two output voltage signals which are either or out-of-phase depending on which port is chosen for feeding the input signal.
- It is a planar version of the magic Tee in rectangular waveguide
- The network can be used either as an in-phase or out-of-phahse power divider.
- Conversely, it can be obtain the sum and difference of two signals.
- Figure below shows the layout of a rat-race hybrid ring
![Rat-Race Schematics](attachments/tee-hybrid-ring.png)
- The rat-race junction consists of an annular ring of length of $3\lambda_g/2$ and four ports connected at particular intervals.
- Theoretically port-2 and port-4 are kept a distance of $3\lambda/4$ and P-1,2, P-1,3, P-3,4 are kept at $\lambda/4$ distance apart.
- Signal fed at port-1 and travelling clockwise arrive at port 2,4 in phase
- SIgnal fed at port-1 and travelling anticlockwise arrive at port 3 out of phase.
- Signal fed at port-2 and travelling clockwise arrive at port 3,1 in phase
- Signal fed at port-2 and travelling counter-clockwise direction at port 4 out of phase
- Signal fed at port-3 and travelling in clockwise arrive at port-2,4 in phahse
- Signal fed at port-3 and travelling anticlockwise arrive at port-1 out of phahse
- Signal fed at port-4 and travelling clockwise arrive at port-3,1 in phase
- Signal fed at port-4 and travelling anticlockwise arrive at port-2 out of phase

The scattering matrix of a rat race junction can be expressed as

$$ [S] = \begin{bmatrix} S_{11} & S_{12} & 0 & -S_{14} \\ S_{21} & S_{22} & S_{23} & 0 \\ 0 & S_{32} & S_{33} & S_{34} \\ -S_{41} & 0 & S_{43} & S_{44} \end{bmatrix}$$

- The sign of the S-matrix elements is representing the phase difference of the signal between theh input and outptu ports
- Since atleast ports are isolated with each other, we can match them independently without destroying the symmetry of the junction.
- After doing this, using the properties of the S-matrix of a reciprocal and lossless network and choosing proper port length, the final S-matrix of a rat race junction can be found as
$$ [S] = \frac{1}{\sqrt{2}} \begin{bmatrix} 0 & 1 & 0 & -1 \\ 1 & 0 & 1 & 0 \\ 0 & 1 & 0 & 1 \\ -1 & 0 & 1 & 0 \end{bmatrix}$$
- Like the Magic Tee Junction, a rat race junction can also be used as hybrid with port 1 and port 3 as divider and adder port respectively and port 2 and port 4 as output ports.
- However, the main advantage of rat race over magic tee is that unlike magic tee, rat race junction can also be constructed using planar technology.
- it should be noted that as the operating frequency chagnes, the ports are no more specific electrical length apart.
- therefore it is a very narrow band device.
- in practical rat race condition, there are small leakage couplings between the ports and hence the zero elements of the scattering matrix are also not perfectly zero.

# Gunn Diodes

- The Gunn diode has an I-V charactersitic that exhibits a negative differential resistance (negative slope) that can be used to generate RF power from DC.
- Its operation is based on the transferred electron effect (also known as the Gunn effect), which was discovered by J. B. Gunn in 1963s. 
- Practical Gunn diodes typically use either GaAs (Gallium Arsenide) or InP (?) materials
- Gunn diodes can produce continuous power of up to several hundred milliwatts, at frequencies from 1 to 100 GHz with efficiencies ranging from 5% to 15%.
- Oscillator circuits using Gunn diodes require a high-Q resonant circuit or cavity, which is often tuned mechanically.
- Electronic tuning by bias adjustment is limited to 1% or less, but varactor diodes are sometimes included in the resonant circuit to provide a greater range of electronic turning.
- Gunn diode sources are used extensively in low-cost applications such as traffic radars, motion detectors for door openers and security alarms, and test and measurement systems.

# Microstrip

- Microstrip line is one of the most popular types of planar transmission lines, primarily because it can be fabricated by photolithographhic processes and is easily integrated with other passive and active microwave devices.
- the geometry of a microstrip is shown below:
![Geometr of microstrip transmission line](attachments/microstrip-geometry.png)
- A conductor of width W is printed on a thin, grounded dielectric substrate d and relative permittivity $\epsilon_r$.
- Sketch of field lines
![EM lines on microstrip](attachments/microstrip-fields.png)
- if the dielectric were not present ($\epsilon_r = 1$), we could think of the line as 2 wire line consisting of 2 flat strip conductors of width W, separated by a distance of 2d (the ground plane can be removed via image theory)
- In this case we would have a single TEM transmission line, with $\nu_p = c$ and $\beta = k_0$
- the presence of the dielectric, and particularly the fact thhat the dielectric does not fill the air region above the strip (y > d), complicates the behavior and analysis of microstrip line.
- unlike stripline, where all the fields are contained within a homogenous dielectric region, MS has some of its field lines in the dielectric region, concetrated between the strip conductor and the ground plane, and some fraction in the air region above the substrate.
- for this reason, the microstrip line cannot support a pure TEM wave, since the phase velocity of tEM fields in the air region would be $c\sqrt{\epsilon_r}$.
- but the phase velocity of TEM fields in the air region would be $c$.
- Thus, a phase match at the dielectric-air interface wouldbe impossible to attain for a TEM-type wave.

In actuality
- the exact fields of amicrostrip line constitute a hybrid TM-TE wave, and require more advanced analysis techniques.
- in practical applications, the dielectric substrate is electrically very thin (d << $\lambda$)
    - and so the fields are quasi-TEM.
- in other words, the fields are essentially the same as those of the static case.
- thuhs good approximations for the phase velocity, propagation constant and characteristic impedance can be obtained from static or quasi-static solutions.
- then the phase elocity and proagation constant can be
    $$\nu_p = \frac{c}{\sqrt{\epsilon_e}}$$
    $$\beta = k_0\sqrt{\epsilon_e}$$
- where $\epsilon_e$ is the effective dielectric constant of microstrip line 
- Since some of the field lines are in the dielectric region and some are in air, the effective dielectric constant satisfies the relation
    $$1 < \epsilon_e < \epsilon_r$$
    - and is dependent on thickness d and conductor width W.

