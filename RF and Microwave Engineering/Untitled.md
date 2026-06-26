- Z = R + j X
	- impedance = resistance + j Reactance
- Y = G - jB
	- admittance = conductance - j succeptance
- load <-> Source
- Series <-> Parallel/Shunt
- $\G$ <-> SWR
### Z.1.1 Smith Chart
- horizontal: equator
	- prime left 0 <- 1.0 is prime center -> prime right infinity
	- R = 0, G = $\infty$, Vmin, Imax
	- R = 1, G = 1
	- R = $\infty$, G = 0, Vmax, Imin
- vertical: equator
	- 0 -> 1 -> $\infty$
- Resistance circle, center at prime right
- Reactance:
	- clockwise: +jX
	- anticlockwise: -jX
- Reactance circle

lets say:
- Z$_L$ = 100 +j100
- Z$_0$ = 100
- to normalize: divide by Z$_0$ 
- Z$_{L_{N}}$ = 1 + j 1
- angles
	- 63 degree reflection
	- 32 degree transmission
- swr
	- Zl : Zin = 1 :  2.6
- W-towards-g = 0.338
- W-towards-l = 0.162
- load deko xa, so design from w-t-g
- Z-l = 50 +j 150, 
- Z-l = 120 - j 90
- Z-0 = 100
# Chapter 4

$$\large
\begin{align}
\nabla^2 E = \g^2 E\\
\nabla^2 H = \g^2 H\\
\end{align}
$$

$$\large
\begin{align}
X = A sin(k, x) + B cos(k, x)\\
Y = C sin(k, y) + D cos(k, y)\\
Z = E sin(k, z) + F cos(k, z)\\
\end{align}
$$
k is wave number
$$\large
\begin{align}
\psi = XYZ\\
\g^2_g = \g^2 +k_x^2+k_y^2 = \g^2 + k_c^2\\
\g_g = \pm \sqrt{\omega_c^2 \mu \epsilon - k_c^2}\\
\psi = \left[ Acos(k_x, x) + Bsin(k_y, y) \right] \left[ C \cos(k_y, y) + Dsin(k_y, y)\right]e^{-j\ \beta_g\ z}
\end{align}
$$
helmholtz solution of maxwell equation

## TE Mode in rectangular
characterized by E$_z$ = 0 and H$_z$ != 0. it means H$_z$ exists in order to have energy propagation
$$\large
\begin{align}
H_z &= H_0 \cos\left( \dfrac{m\pi}{a}x \right) \cdot \cos\left( \dfrac{n\pi}{b}y \right) \cdot e^{-j \beta_z}\\
H_x &= H_0 \sin\left( \dfrac{m\pi}{a}x \right) \cdot \cos\left( \dfrac{n\pi}{b}y \right) \cdot e^{-j \beta_z}\\
H_y &= H_0 \cos\left( \dfrac{m\pi}{a}x \right) \cdot \sin\left( \dfrac{n\pi}{b}y \right) \cdot e^{-j \beta_z}\\
E_x &= E_0 \sin\left( \dfrac{m\pi}{a}x \right) \cdot \sin\left( \dfrac{n\pi}{b}y \right) \cdot e^{-j \beta_z}\\
E_y &= E_0 \sin\left( \dfrac{m\pi}{a}x \right) \cdot \cos\left( \dfrac{n\pi}{b}y \right) \cdot e^{-j \beta_z}\\
E_z &= 0
\end{align}
$$
## TM Mode
H$_z$ = 0, and E$_z$ != 0
E$_z$ exists in order to carry energy transmission