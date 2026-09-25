# Propagating Regions

- Once an antenna is excited by a source, two types of fields are generated in its surroundings:
    - **non-propagating fields** and **propagating fields**.
- The **non-propagating field** remains close to the antenna and does not contribute to energy propagation.
    - These fields are reactive in nature and are also called **near fields**.
- The **propagating fields** are also known as **radiation fields**, **far fields**, or **inverse-square fields**.
- The boundary between the near field and far field from the antenna can be approximated by the distance:
    $$d_{far} = \frac{2D^2}{\lambda}$$
    - where $D$ is the maximum dimension of the antenna and $\lambda$ is the operating wavelength.
- The total space surrounding the antenna can be divided into **three regions**:
    - The **reactive field** dominates immediately around the antenna, extending up to a distance:
    $$d_{reactive} = 0.62\sqrt{\frac{D^3}{\lambda}}$$
    - The distance between $d_{reactive}$ and $d_{far}$ ($2D^2/\lambda$) is the **near-radiating (Fresnel) field**.
    - The field beyond $d_{far}$ is the **far-radiating (Fraunhofer) field**.
- Microwave communication is basically **line-of-sight (LOS)**.
    - Therefore, microwave antennas are typically very directive and small in size,
    - proportional to their operating wavelength.
- Since power attenuation increases with frequency,
    - microwave antennas require **high power** and **high gain**.
- Large power is also required to achieve better performance with a high SNR.

---

# Antenna Radiation Parameters

- If a transmission line propagating energy is left open at one end,
    - there will be radiation from that end.
- The **radiation pattern** of an antenna is a diagram of field strength
    - (or, more often, power intensity) as a function of the aspect angle,
    - at a constant distance from the radiating antenna.
- An antenna pattern is inherently three-dimensional,
    - but for practical reasons it is normally presented
    - as a two-dimensional pattern in one or several planes.
- An antenna pattern consists of several **lobes**: the **main lobe**, **side lobes**, and the **back lobe**.
    - The major power is concentrated in the main lobe;
    - power in the side lobes and back lobe should be kept as low as possible.
- **Gain** of the antenna: the power intensity at the maximum of the main lobe,
    - compared to the power intensity from an imaginary omni-directional antenna fed with the same input power.

![directional radiation pattern in (a) polar coordinate and (b) Cartesian coordinate](attachments/2026-09-24-20-34-51.png)

## Radiation Beam and Beam Width

- A **radiation beam** (also known as a lobe) is a part of the radiation pattern
    - surrounded by regions of relatively weak radiation intensity.
- Depending on the maximum radiated field strength, a lobe can be classified as a **major lobe** or **minor lobe**:
    - The **major lobe** contains the direction of maximum radiation.
    - A **minor lobe** is any lobe except the major lobe, further classified as:
        - **Side lobe**: a lobe in a direction other than the main lobe or back lobe direction.
        - **Back lobe**: a lobe in the direction directly opposite the main lobe.
    - Minor lobes generally correspond to undesired radiation and
        - should be minimized in a properly designed antenna.
- **Half Power Beam Width (HPBW)**:
    - the angle between the two directions in the main lobe at which
        - the field intensity drops to half of the maximum field intensity.
    - Also known as the **3 dB beam width**.
    - A radiation lobe is often characterized by its 3 dB beam width.
    - If the antenna has a relatively narrow beam width in both elevation and azimuth planes,
        - it is called a **pencil beam** antenna.
    - If the beam width is narrow in one plane but much broader in the orthogonal plane,
        - it is called a **fan beam** antenna.
- **First Null Beam Width (FNBW)**:
    - the angle between the directions of the nulls immediately following the major lobe.

## Radiation Pattern

- The radiation pattern of an antenna is the graphical representation of the field strength, or power per unit solid angle, radiated by the antenna at a given distance, as a function of elevation angle, azimuth angle, or both.
    - If **field strength** is plotted against angle, it is called a **field pattern**.
    - If **power per unit solid angle** is plotted against angle, it is called a **power pattern**.
    - Depending on whether the parameter is plotted against elevation or azimuth angle, the pattern is called the **elevation pattern** or **azimuth pattern** respectively.
    - If plotted against both elevation and azimuth angle, the resultant plot is called a **3D pattern**.
- Since power is proportional to the square of field strength, the power pattern is also proportional to the square of the field-strength pattern.
- Unless otherwise specified, "radiation pattern" generally refers to the **field strength pattern**.
- Based on radiation pattern, antennas can be classified as:
    - **Isotropic antenna**: radiates uniform field strength in every direction (any plane).
    - **Omni-directional antenna**: radiates the same field strength only in a particular plane.
    - **Directional antenna**: radiated field varies with direction; power is concentrated in one or a few particular directions.

## Friis Transmission Equation

- The radiation pattern is fundamentally related to power intensity, directivity, and antenna gain.
- If $P_t$ is the transmitted power, $P_r$ is the received power, $G_t$ and $G_r$ are the gains of the transmitting and receiving antennas respectively, $R$ is the radial distance between the two antennas, and $\lambda_0$ is the free-space wavelength, the received power is:
$$P_r = \frac{P_t\,\lambda_0^2\,G_t\,G_r}{(4\pi R)^2}$$
- If both antennas are identical, with gain $G$, this reduces to:
$$P_r = \frac{P_t\,\lambda_0^2\,G^2}{(4\pi R)^2}$$
- For a directional antenna, the radiated power is expressed as the **Effective Isotropic Radiated Power (EIRP)**
    - the power an isotropic antenna would need to radiate to produce the same radiation intensity, in a given direction, as the directional antenna:
$$EIRP = P_t\,G_t$$

---

# Microwave Radiation Hazards

- The term **electromagnetic radiation (EMR)** in microwaves refers to the fact that microwave energy can radiate
    - not to any special nature or effect distinguishing it from other forms of energy.
- Microwaves contain **insufficient energy to directly ionize** substances
    - (i.e., to break chemical bonds via ionization),
    - hence microwaves are an example of **non-ionizing radiation**.
- Radiation hazards derive entirely from the
    - **interaction of the electromagnetic field with the human body**,
    - or with ordnance/explosive objects.

## Named Radiation Zones (Fields Around an Antenna/Emitter)

Using the same boundary distances derived earlier
- ($d_{reactive}=0.62\sqrt{D^3/\lambda}$ and $d_{far}=2D^2/\lambda$),
- the radiation field around any microwave source (antenna, BTS, or microwave oven)
- is divided into three named zones:

Classification:

1. **Reactive Near-Field Zone**
    - The region immediately surrounding the antenna/source, extending up to $d_{reactive}$.
    - Energy here is predominantly **stored** (reactive), not radiated
        - fields do not propagate away as usable radiated power.
    - This is the zone of highest field intensity, and
    - the primary concern for exposure very close to an emitting source
    - e.g., standing directly against a microwave oven door, or very close to an antenna.
2. **Radiating Near-Field (Fresnel) Zone**
    - Extends from $d_{reactive}$ out to $d_{far}$.
    - Fields here begin to radiate,
    - but the angular field distribution still depends on the distance from the antenna
    - the pattern has not yet "settled" into its final far-field shape.
3. **Far-Field (Fraunhofer) Zone**
    - The region beyond $d_{far} = 2D^2/\lambda$.
    - The radiation pattern's angular distribution becomes independent of distance from this point onward,
        - this is the zone in which conventional antenna gain, EIRP, and the Friis transmission equation calculations (above) are valid.
    - Most practical human exposure assessments for base stations (BTS) are made in this zone,
    - since it is the region typically accessible to the general public at a meaningful distance from the antenna.

- **Application to a microwave oven**:
    - the same three-zone classification applies to the leakage field around an oven's door/seal
    - exposure standards for ovens are generally set based on the reactive/near-field leakage level
    - measured directly at the surface,
    - since a user's hands/body are frequently within this zone during normal use.
- **Application to a BTS at different frequencies (e.g., 900 MHz vs 1800 MHz)**:
    - since $\lambda$ is inversely proportional to frequency,
    - a higher-frequency antenna (1800 MHz) of the same physical size $D$ has a **smaller** $\lambda$,
    - which, from the formulas above,
    - pushes both $d_{reactive}$ and $d_{far}$ **closer** to the antenna compared to the 900 MHz case.
    - This is the basis for comparing radiation field extents at two different BTS frequencies
    - using quarter-wavelength antennas of each.

## Hazards of Electromagnetic Radiation to Personnel (HERP)

- The effect of radio waves on the human body occurs
    - once the radiation penetrates exposed tissues and
    - causes **thermal biological effects**.
- The force produced by an electric field on charged objects
    - (such as mobile ions present in the body) causes them to move,
    - resulting in electric currents.
    - The electrical resistance of the tissue through which these currents flow causes **heating**.
- This heat input raises tissue temperature until it is balanced by the rate of heat removal
    - mostly via blood flow to and from other parts of the body.
- The rate of temperature rise in body tissue due to microwave heating is expressed as:
    $$\frac{dT}{dt} = \frac{Q}{C_p} \quad (°C/s)$$
    - where $C_p$ is the specific heat of the biological substance, and
    - $Q$ is the sum of SAR and the metabolic rate of heat production per unit mass.

### Why EMR Is Non-Ionizing

- EMR is absorbed by the body in the form of **quanta of energy**, given by:
    $$E = hf$$
    - where $E$ is the quantum energy,
    - $h$ is Planck's constant, and
    - $f$ is the frequency of the EM wave.
- For example, at 900 MHz and 1800 MHz,
    - the quantum energy equals about $4\ \mu eV$ and $7\ \mu eV$ respectively
    - extremely small compared to the roughly **1 eV** needed
    - to break the weakest chemical bonds in genetic molecules (DNA).
- Therefore, EMR at these frequencies **cannot ionize** atoms and molecules,
    - and is classified as **Non-Ionizing Radiation (NIR)**.
- Ionizing radiation, by contrast,
    - operates at much higher frequencies and correspondingly higher photon energies.

### Specific Absorption Rate (SAR)

- Despite being non-ionizing, EMR is **not harmless at all intensities**
    - at higher intensities, it can be equally harmful
    - due to its **heating effect** (the same principle used deliberately in a microwave oven).
- This heating effect is quantified by the **Specific Absorption Rate (SAR)**
    - the energy absorbed per unit mass of tissue:
        $$SAR = \frac{\sigma E^2}{\rho}$$
    - where $\sigma$ is the conductivity of the tissue,
    - $\rho$ is the density of the tissue, and
    - $E$ is the RMS value of the electric field.
- SAR produced by a given electric field is
    - **larger in children than in adults**,
    - since children's tissue typically contains a larger number of ions,
    - and hence has higher conductivity.
- Example: the SAR of a human being is about $0.03\ W/kg$ at 700 MHz, for an incident power density of $1\ mW/cm^2$.

### WHO Position and Reported Health Effects

- Per the **World Health Organization (WHO)**,
    - considering the very low exposure levels involved and research results collected so far,
    - there is **no convincing scientific evidence** that weak RF signals 
        - e.g., from cell towers and wireless networks
    - cause adverse health effects.
- Mobile phones transmit RF electromagnetic fields which,
    - unlike ionizing radiation (X-rays, gamma rays),
    - cannot break chemical bonds or cause ionization in the human body.
- However, a number of studies have reported links between RF exposure and various health effects,
    - including:
    - cell growth, cell differentiation, DNA effects, immune system effects, hormonal effects,
    - reproduction, neurological and cardiovascular effects, blood-brain barrier effects,
    - interference with medical devices/gadgets, stress proteins, skin effects, and sleep disorders.

## International Exposure Guidelines

- Various national and international organizations have published guidelines for protecting people from EMF exposure and radiation.
- Concerns about RF exposure began roughly sixty years ago, leading to standards and recommendations for both:
    - **Uncontrolled (general public) exposure**, and
    - **Occupational (controlled) exposure**.
- These guidelines are generally similar, based on thresholds for known adverse effects, and include a margin of safety for both short- and long-term exposure.

### Organizations Involved

- World Health Organization (**WHO**)
- International Commission on Non-Ionizing Radiation Protection (**ICNIRP**)
- Federal Communications Commission (**FCC**)
- Institute of Electrical and Electronic Engineers (**IEEE**)
- Environmental Protection Agency (**EPA**)
- Food and Drug Administration (**FDA**)
- American Cancer Society (**ACS**)
- National Institute for Occupational Safety and Health (**NIOSH**)
- Occupational Safety and Health Administration (**OSHA**)
- National Council of Radiation Protection and Measurements (**NCRPM**)
- Australian Radiation Protection and Nuclear Safety Agency (**ARPNSA**)

### WHO and ICNIRP

- **WHO** established the **International EMF Project** to review the scientific literature concerning the biological effects of electromagnetic fields.
- **ICNIRP** is considered the most important organization specifying RF EMF limits, because:
    a. ICNIRP guidelines were published in **1998**.
    b. Limits are based on all available scientific research, and include large safety margins.
    c. Limits are set to protect all people from established adverse health effects, for both short- and long-term exposure.
    d. Specifies limits for **both** general public and occupational exposure.
    e. Endorsed by **WHO**.

### The IEEE Standard

- The relevant **IEEE safety standard for RF/microwave exposure is IEEE C95.1** ("IEEE Standard for Safety Levels with Respect to Human Exposure to Radio Frequency Electromagnetic Fields, 3 kHz to 300 GHz").
- IEEE C95.1 specifies **Maximum Permissible Exposure (MPE)** limits for both occupational (controlled) and general public (uncontrolled) exposure, in terms of electric field strength, magnetic field strength, and power density, across the RF/microwave frequency range.

### Field Strength and Power Density Metrics

- When the distance to a radio transmitter is in the **far field** (greater than a few wavelengths,
    - around one meter for typical RF), safety limits are usually expressed in terms of **field strength**.
- Since RF waves have both electric and magnetic components:
    - **Electric field strength** is measured in volts per meter ($V/m$).
    - **Magnetic field strength** is measured in amperes per meter ($A/m$).
- A commonly used unit for far-field exposure is the **plane-wave power density (PD)**
    - the power per unit area, expressed in $W/m^2$, $mW/cm^2$, or $\mu W/cm^2$.
- For exposure assessment, the **highest power absorption per unit mass** in a small part of the body
    - must be compared against recommended limits
    - this is quantified by **SAR**, in units of $W/kg$ or $mW/kg$.

### Maximum Permissible Exposure (MPE)

- The **MPE** for power density is based on a threshold SAR value; specific guideline values vary somewhat by operating frequency.
- Whole-body human absorption of RF energy varies with frequency; the **30–300 MHz** range is considered the **resonance range** for the human body, where whole-body exposure is absorbed most efficiently.
- The MPE limits adopted by the FCC in 1996 (for both occupational and general public exposure) are expressed in terms of:
    - Electric field strength, $E$ (V/m)
    - Magnetic field strength, $H$ (A/m)
    - Power density, $S$ ($W/m^2$)
- In the far field of a transmitting antenna, the magnetic field strength can be derived from the electric field strength as $H = E/377$ (the free-space wave impedance), and the power density is calculated from $S$ accordingly.

![RF exposure limits](attachments/fcc-recommended-rf-exposure.png)

---

# Hazards of Electromagnetic Radiation to Ordnance and Fuel (HERO/HERF)

- Microwave signals are dangerous to various electronic equipment used in households, industries, and battlefields.
- Among these, **ordnance** used in battlefields is probably the most affected, since it is subjected to high-power microwave radiation from RADAR antennas.
- Such high-power radiation can affect:
    - Weapon systems
    - Electro-Explosive Devices (**EED**)
    - Missile control systems
    - Emergency devices
    - Attending personnel
- These radiations can **trigger EEDs and missiles** inadvertently.
- **Example**: the destruction of the US aircraft carrier *Forrestal*, deployed off the coast of North Vietnam on July 29, 1967, with its deck loaded with numerous attack aircraft.
- **Example**: the crash of several US UH-60 Black Hawk attack helicopters, due to interference with citizen-band transmitters, RADAR antennas, and radio antennas.

## Why Ordnance Is More Sensitive Than Humans

- Ordnance is **more sensitive** to electromagnetic signals than living beings like humans, because:
    - Ordnance lacks a circulatory system to dissipate internal heat (unlike the human body, which uses blood flow to remove excess heat).
    - Ordnance responds to **peak power**, whereas humans respond to **average power over time**.

## Effects on Fuel

- Microwave and electromagnetic signals also have adverse effects on fuels.
- They have a tendency to **ignite fuel vapors** through RF-induced sparks.
- This risk is heightened during fuel handling in the presence of **high-level RF fields**.

---
