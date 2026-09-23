# Exam Frequency Table

| Topic | Typical Marks | Frequency |
|---|---|---|
| Behaviour of microwave vs conventional low-frequency circuits (working principles) | 3–10 | Very High |
| Advantages/disadvantages of microwaves compared to lower frequencies / acoustic-seismic waves | 4–8 | Very High |
| IEEE classification of microwave frequency bands | 2–5 | High |
| Areas of application of microwave systems + detailed protocols of specific systems | 4–10 | High |
| Lumped vs distributed circuit analysis | 2–6 | Moderate–High |
| Why S-parameter based analysis is a must at microwave frequencies | 3 | Moderate |

# Standard Frequency Bands

- The EM spectrum refers to any signal that can be decomposed into frequency components, and it extends from seismic to cosmic waves.
- **Microwaves in the EM spectrum vary from 300 Mhz to 300 GHz**,
    - equivalent to wavelength of 1 mm to 1 m.
- The term "micro" includes both the microwave and millimeter-wave spectrum:
    - Ultra High frequcny: UHF, 0.3 - 3 GHz
    - Super High frequency: SHF, 3 - 30 GHz
    - Extremely High frequency: EHF, 30 - 300 GHz
- Above 300 Ghz, absorption of EM radiation by Earth's atmosphere is so great,
    - that it is effectively opaque,
    - until the atmosphere becomes transparent again
    - in the so-called infrared and optical window frequency range.

## IEEE Classification of Microwave Frequency Bands

(*Frequently Asked*)

my mnemonics to memorize: Lets see Cun (kun) ex kurdai, k ka q-u dai (xudai), EV win gardai xa. 

| Band (GHz) | RSGB | IEEE |
| ---        | ---  | --- |
| L          | 1 - 2     | 1 - 2 |
| S          | 2 - 4     | 2 - 4 |
| C          | 4 - 8     | 4 - 8 |
| X          | 8 - 12    | 8 - 12 |
| Ku         | 12 - 18   | 12 - 18 |
| K          | 18 - 26.5 | 18 - 27 |
| Ka         | 26.5 - 40 | 27 - 40 |
| Q          | 33 - 50   | Milimeter (40 - 300) |
| U          | 40 - 60   | " " |
| E          | 50 - 75   | " " |
| V          | 60 - 90   | Submilimeter (> 300)  |
| W          | 75 - 110  | " " |

# Microwave Application

- The foundation of modern electronics and communication engineering using radio frequency (RF) and microwaves
    - was laid in 19th century, after Michael Faraday's observation of the effect of a magnetic field on light
    propagation (1845)
    - and Maxwell's derivation of the four basic equations of the EM theory of lighth (1864).
- Because of the short physical wavelength of these frequencies,
    - microwaves present several unique features,
    - making them suitable for various unique and specific applications.
    - including:
        - Short-distance and long-distance communication
        - Target detection at short distance
        - Identifying small objects to identifying stars in space
        - Mapping surface of planets
        - Study of linear particle accelerators and plasma
        - Domestic cooking and industrial heating.

## Broad Application Areas

- **Communications**
- **Remote Sensing**
- **Biomedical Engineering**
- **Navigation**
- **Power Transfer**

## Detailed Application Area with Protocols

### Communications

- **Satellite Communication**
    - Microwave frequencies (C-band, Ku-Band, Ka-band) are used for uplink/downlink
    - between ground stations and geostationary or LED satellites
    - enabling television broadcast, internet backhaul, and global telephony.
    - Operates via LoS transmission through the atmosphere,
    - exploiting the low atomspheric "window" in these bands.
- **Terrestrial Microwave Links** (Point-to-Point Links)
    - Used for telecom backhaul between cellular towers/babse stations,
    - typically in the 2-40 GHz range,
    - using highly directional dish/horn antenna over LoS paths
    - spanning several km to 10's of km.
- **Mobile/Cellular Communications** (GSM, LTE, 5G)
    - Modern cellular standards operate in UHF and low-SHF microwave bands
    - e.g., 900 Mhz, 1800 Mhz, 2.1 Ghz, and mmWave bands for 5G,
    - leveraging the compact antenna size and high bandwidth available at these frequencies.
- **WiFi and WLAN (IEEE 802.11)**
    - Operates in the 2.4 GHz and 5 GHz ISM microwave bands
    - providing short-range wireless local area networking
- **Radar (Radio Detecting and Ranging)**
    - Uses microwave pulses
    - typically X, S, or Ku-band,
    - reflected off targets to determine range, velocity, and direction.
    - Used in Air Traffic Control (ATC), weather monitoring, maritime navigation, military surveilance.
    - Works on the principle of measuring the time delay and Doppler shift of the reflected microwave pulse.

### Remote Sensing

- **Synthetic Aperture Radar (SAR)**
    - An airborne or satellite based microwave imaging system
    - that synthesizes a large "virtual" antenna aperture by
    - exploiting the motion of the platform, 
    - enabling high-resolution imaging of the Earth's surface regardless of
    - weather of lighting condition (since microwave penetrate clouds.)
- **Weather Radar**:
    - uses microwave backscatter from precipitation to estimate rainfall intensity and storm movement.

### Biomedical Engineering

- **Microwave Hyperthermia/Diathermy**
    - uses microwave energy to selectively heat tissue for cancer treatment
    - in combination with radiation/chemotherapy,
    - or for therapeutic deep-tissue heating
- **Microwave Imaging**
    - An emerging non-ionizing alternative to X-ray for certain diagnostic applications
    - e.g., breat tumor detection,
    - exploiting the dielectric contrast between healthy and malignant tissue.

### Navigation

- **GPS and other GNSS**
    - GPS: Global Positioning System
    - GNSS: Glolabl Navigation Satellite System
    - Satellites transmit microwave signals
    - around 1-2-1.6 GHz, L-band
    - that receivers use to triangulate position via precise time-of-flight measurements.
- **Microwave Landing Systems (MLS)**
    - used in aviation for precise approach and landing guidance.

### Power Transfer

- **Wireless Power Transfer**
    - microwave beams,
    - e.g., at 2.45 GHz or 5.8 GHz ISM bands (Industry-Scientifc-Medical bands),
    - can be used to transmit power over moderate/small distances without wire
    - proposed for applciations like space-based solar power transmission to Earth.
- **Microwave Heating**
    - domestic and industrial microwave ovens use 2.45 GHz microwave
    - to excite water molecules in food via dielectric heating
    - providing rapid and efficient heating.

# Behavior: Conventional vs RF/Microwave Circuits

## Characteristic Features of Microwave Compared to Long Waves

### Why Lumped-element analysis breaks down above 1 GHz

- Up to **around a frequency** of 1 GHz, most circuits are designed and constructed using
    - **lumped parameter circuit components**.
- Above 1GHz, the **propagation time of the signal** becomes comparable with **time period of the signal**.
- The lumped parameter **circuit component length**, also becomes comparable to the wavelength
- This results in **rapid amplitude and phase varaitions** of the signal with distance
- The **phase difference caused by interconnection** of different components is also not negligble above 1GHz
- As a result, at microwave frequencies, normal voltage-current concepts, like **KCL/KVL are not applicable**
- Instead, we use **field theory**

### Shift to Distributed Elements

- Above 1 GHz, the lumped circuit elements are replaced by **distributed circuit elements**
- Distributed circuit elements are small transmission line sections, defined over an infinitesimal length.
- In this model, the connecting wires between different elements are not perfect conductors.
- At high frequencies, the distributed circuit model is more accurate than lumped model
    - but is also more complex in nature.
- The existence of non-uniform current in the branches and non-uniform voltages at the nodes further complicates circuit analysis.
- The use of infinitesimals in the distributed model requires
    - application of **calculus** instead of linear algebra.

### Consequences for active design and measurement

- The high freuqency nature of microwave has also brought
    - complexity and challenges in designing **active component**
- At microwave frequencies,
    - the transit time of carriers through ordinary low-frequency triodes and transistors
    - become comparable with the time period of the wave,
    - resisting its operation at these frequencies.
- A number of new principles of oepration have been employed to generate microwave signals:
    - velocity modulation, interaction fo space-chahrge waves with EM field,
    - quantum mechanical tunneling, avalanche breakdown, and transferred electron techniques, etc.
- At microwave frequencies,
    - **measurement** of voltages and currents
    - is not possible with a multimeter or other low-frequency circuits.
- The impedance of
    - the parasitics of measurement cables and connectors
    - becomes large enough to frequently exceed the component value.
- Thus,special cables and connectors are required.
- The meter's own impedance and capacitance also affect the measurement.

## Why S-Paramater Based Analysis is a Must at Microwave Frequencies

- Conventional two-port network parameters (Z, Y, H, ABCD)
    - require measuring **open-circuit** or **short-circuit** conditions
    - at the ports to determine the parameters.
- At microwave frequencies, creating a true open or short circuit is **practically difficult**
    - since, even a small length of wire or a small stray capacitance introduces
    - significant reactance at these frequencies.
    - An open or short is never truly ideal, and parasitic effects distort measurements.
- Additionally, since voltage and current are not uniquely well-defined quantities,
    - along a distributed transmission line at microwave frequencies
        - they vary with position along the line due to standing waves
    - Z/Y/H/ABCD parameters become impractical and unstable to measure directly.
        - as they are directly defined in terms of port voltages and currents
- **S-parameters** (Scattering Parameters) instead relate the **incident and reflected power waves**
    - at each port,
    - which can be measured directly and accurately using matched loads (like 50$\Omega$)
    - without requiring true open/short circuit conditions.
- This makes S-parameters theh practical and standard choice for characterizing microwave networks,
    - and why S-parameter-based analysis is needed at these frequencies

## Comparison of Long Wave vs Microwave

| Long Wave | Microwave |
| --- | --- |
| Applies lumped element theory | Applies distributed circuit theory |
| Twisted pair, open wire, coaxial cable used as transmission lines | Waveguides, fiber optic, microstrips used as transmission lines |
| ABCD, Y, Z parameters used to model/analyze | Scattering (S) parameters used to model/analyze |
| Current modulation is applied | Density modulation is applied |
| Most commonly, solid-state devices are used as active devices | Transit-time cavity-controlled devices and FET transistors are more common as active devices |
| Generally high power is required | Generally low power is required |
| Cheaper than microwave devices | More expensive than low-frequency devices |
| Less complexity | More complexity |
| Almost no EM radiation hazard | Hazardous EM radiation to living bodies and electrically explosive devices |

## Microwave vs Acoustic/Seismic Waves

- Acoustic (sound) and seismic (earth) waves are **mechanical waves**
    - requiring a physical medium (air, ground, water) to propagate
    - and travel at much lower velocities
        - hundreds to a few thousand m/s
    - compared to microwaves, which are **EM waves**
    - propagating at the speed of light through vacuum.
- Because sesimic/acoustic circuit analogy problems
    - e.g., analyzing a transducer or an acoustic delay line circuit
    - are sometimes set at frequencies where
    - the physical component size becomes comparable to acoustic wavelength
    - the same lumped-vs-distributed reasoning above applies.
- At seismic band frequencies, conventional lumped reasoning may still hold,
    - since acoustic wavelengths at typical seismic frequencies are extremely large
    - but if analyzed at a scale/frequency where wave effects dominate
    - the same field-theory-based, distributed-element treatment used for microwaves becomes necessary.
- **Key differences**
    - Microwaves offer vastly high usable bandiwdthh than acoustic/seismic frequencies
        - enabling far higher data rates for communication
    - Microwaves can propagate through vacuum/space
        - essential for satellite links
        - whereas acoustic/seismic waves cnanot
    - Microwave systems are subject to LoS nad atmospheric/weathehr attenuation
        - while acoustic/seismic waves propagate differently
        - depending on the medium's mechanical properties
        - like density, elasticity
        - and are far less affected by weather
    - Equipment for generating/detecing microwaves (klystrons, magnetrons, waveguides)
        - is generally more complex and costly than
        - the transducers used for acoustic/seismic signals

## Merits/Demerits of Microwaves

| Advantages | Disadvantages |
| --- | --- |
| High bandwidth is available in microwaves | Requires line-of-sight (LOS) propagation |
| Improved gain and directive properties | Subject to electromagnetic interference |
| Reduction in antenna physical size | Weather affects microwaves badly (rain fade, atmospheric attenuation) |
| Low power requirement | Costly equipment |
| Higher degree of reliability | Adverse fading effects |
| Transparency properties of microwaves (can penetrate clouds, etc.) | Hazardous EM radiation |

