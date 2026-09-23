# Microwave Spectrum

- EM Spectrum refers to any signal that can be decomposed into frequency components and it extends from seismic to cosmic waves.
- **The microwaves in EM wave spectrum vary from 300Mhz to 300GHz frequency, which is equivalent to the wavelength of 1 mm to 1m**
- The term micro includes both microwave and milimeter wave spectrum
    - i.e. ultra high frequency (UHF, 0.3-3GHz), super high frequency (SHF, 3-30GHz) and extremely high frequency (EHF, 30-300 GHz) bands.
- Above 300 Ghz, the absorption of EM radiation by Earth's atmosphere is so great that it is effectively opaque, until the atmosphere becomes transparent again in the so-called infrared and optical window frequency ranges.

## IEEE classifications

| Band (GHz) | RSGB | IEEE |
| --- | --- | --- |
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

# Microwave Applications

- The foundation of modern electornics and communciations environment using radio frequency (RF) and microwaves was laid in nineteenth century, after Michael Faraday's observation of magnetic field on the light propagation in 1845 and Maxwell's derivation of four basic equations of EM theory of light in 1864.
- Because of the short physical wavelength of these frequencies they present several unique features.
- Hence they are suitable for various unique and specific applications,
    - starting from short-distance to long-distance communciations, 
    - from detecting a target at a short distance to identifying stars light years away,
    - from identifying a small object to mapping the surface of a planet,
    - from the study of linear particle accelerator to that of plasma,
    - from domestic cooking to industrial heating and many more.
- The application may be divided in broadly in areas as appended below:
    - Communications
    - Remote Sensing
    - Biomedical engineering
    - Navigation
    - Power transfer

# Characteristic Features of Microwave Compared to Long Waves

- Unto around a frequency of 1 GHz, most circuits are designed and constructed using lumped parameter circuit components.
- Above 1 GHz the propagation time of signal becomes comparable with the time period of the signal.
- The lumped parameter circuit component length also becomes comparable to the wavelength.
- This results in a rapid amplitude and phase variations of the signal with the distance.
- The phase difference caused by the interconnection of different components is also not negligible above 1 GHz
- As a result, microwaves normal voltage-current concepts, like that in KCL/KVL are not applicable.
- Instead we use field theory.
- Above 1 GHz the lumped circuit elements are replaced by the distributed circuit element.
- The distributed circuit elements are small transmission line sections and they are defined over an infintesimal length.
- In this model, the connecting wires between different elements are not perfect conductor.
- At high frequencies the distributed circuit model is more accurate than the lumped element circuit model and also more complex in nature.
- The existence of non-uniform current in the branches and non-uniform voltages at the nodes further complicates the analysis of the circuit.
- The use of infinitesimals in distributed circuit model requires the application of calcululs rather than linear algebra.
- The high frequency nature of microwave has also brought the complexity and challenges in designing microwave active components.
- At microwave frequencies, the transit time of the carriers through ordinary low frequency triode and transistors becomes comparable with the time time period of the wave which resists its operation at these frequencies.
- A number of new principles of operation namely velocity modulation, interaction of space charge waves with EM field, quantum mechanical tunneling, avalance breakdown and transferred electron techniques, etc. have been employed to generate microwave signals.
- At microwave frequencies measurements of voltages and currents are not possible with a multi-meter or any other low frequency circuits.
- At microwave frequencies the impedance of the parasitic of the measurements cables and connectors become large enough and frequently cross the component values.
- Thus special cable and connectors are required.
- The meter impedance and capacitance also affect the measurement.

# Comparison of Long vs Microwave

| Long Wave | Microwave |
| --- | --- |
| It applies lumped elemnt theory | It applies distributed circuit theory |
| Twisted pair, open wire, co-axial cable are used at Tx lines | waveguides, fiber optic, microstrips are used Tx lines |
| ABCD, Y, Z parameters to model/analyze | Scattering parameter used to model/analyze |
| Current modulation is applied | Density modulation is applied |
| Most commonly solid state devices are used as active devices | Transit time cavity controlled devices and FET transistors are more common as active devices |
| Generally high power is required | Generally low power is required |
| Cheaper than microwave devices | Expensive than low frequency devices |
| Less complexity | More complexity |
| Almost no EM radiation hazard | Hazardous Em radiation to living bodies nad electricall explosive devices. | 

# Merits/Demerits

| Adv | Disadv | 
| --- | -----  |
| High bandwidth is available in microwave | requires LoS propagation |
| Improved gain and directive properties | subject to electromagnetic interference |
| Reduction in antenna physical size | Weather effects badly in microwaves |
| Low power requirement | Costly equipment |
| Higher degree of reliability | Adverse fading effect |
| Transparency properties of microwaves | Hazardous EM radiation |


