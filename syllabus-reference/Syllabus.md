
RF and microwave engineering	EX 716
artificial intelligence		CT 710
DSAP				EX 710
Wireless Communication		EX 715

# A Rf and Microwave engineering:

## A.1 Introduction (3 hours)

Standard frequency bands
Behaviour of circuits at conventional and RF/microwave bands
Microwave applications

## A.2 RF and M/W Transmission Lines (6 hours)

Types of transmission lines
Transmission line theory
Smith Chart analysis
Impedance transformations and matching analysis


## A.3 RF an M/W Network Theory and Analysis(4 hours)

Scattering matrix and its properties
S-Parameter derivation and analysis


## A.4 RF/Microwave Components and Devices(8 hours)

Coupling probes
Coupling loops
Waveguide
Termination, E-plane Tee, H-plane Tee, Magic Tee
Phase-Shifter
Attenuators
Directional coupler
Gunn diode
Microwave transistor
MASER
Resonator and circulators


## A.5 Microwave Generators (5 hours)

Transit-time effect
Limitations of conventional tubes
Two-cavity and multi-cavity klystrons
Reflex klystron
TWT and magnetrons


## A.6 RF Design Practices (10 hours)

RF Low pass filter
	Insertion loss
	Frequency scaling
	Microstrip implementation
RF Amplifier
	Amplifier theory
	Design and real world consideration
Oscillator and mixer
	Oscillator and super mixing theory
	Design and real world consideration


## A.7 Microwave Antennas and Propagation(3 hours)

Antenna types
Propagation characteristics of microwave antennas
RF an M/W radiation, safety practices and standards


## A.8 RF/Microwave Measurements (6 hours)

Power measurement
Calorimeter method
Bolometer bridge method
Thermocouples
Impedance measurement
RF frequency measurement and spectrum analysis
Measurement of unknown loads
Measurement of reflection coefficient
VSWR and Noise


Practicals:

Illustration of Smith Chart and load analysis
Introduction to RF and M/W signal and circuits, measuring techniques, instrumentations, and practices
Designing and analysis of simple strip-line and two-port circuits using network and spectrum analysers
Software-based (ADS-like) RF signal & circuit simulation practices

References:

Microwave Principles - Herbert J. Reich and et al., Van Nostard Reinhold.
Microwave Electronics– K.C. Gupta, Tata McGraw Hill.
Microwave Engineering – A. K. Gautam, S. K. Kataria & Sons.
Microwave Techniques – D.C. Agrawal, Tata McGraw Hill.
Elements of Microwave Engineering – R. Chatterjee, Tata McGraw Hill.
Microwave Devices & Circuits – Samuel Y. Liao, PHI 3rd Edition, 1994.
Microwave Engineering - David M. Pozar, 2nd Edition, John Wiley & Sons.
ARRL UHF/Microwave Experimenter’s Manual, 4th Edition, Newington CT: 1997.
Engineering Electromagnetics – W. H. Hayt, McGraw-Hill Book Company.
Microwave Engineering – A. Das, 2nd Edition, Tata McGraw Hill.
Electronic Transmission Technology: Lines, Waves, and Antennas - William Sinnema, Prentice Hall.



# B artificial intelligence		CT 710

## B.1 Introduction (4 hrs)
Definition of Artificial Intelligence
Importance of Artificial Intelligence
AI and related fields
Brief history of Artificial Intelligence
Applications of Artificial Intelligence
Definition and importance of Knowledge, and learning.

## B.2 Problem solving (4 hrs)
Defining problems as a state space search,
Problem formulation
Problem types, Well- defined problems, Constraint satisfaction problem,
Game playing, Production systems.

## B.3 Search techniques (5 hrs)
Uninformed search techniques- depth first search, breadth first search, depth limit search, and search strategy comparison,
Informed search techniques-hill climbing, best first search, greedy search, A* search Adversarial search techniques-minimax procedure, alpha beta procedure

## B.4 Knowledge representation, inference and reasoning (8 hrs)
Formal logic-connectives, truth tables, syntax, semantics, tautology, validity, well- formed-formula,
Propositional logic, predicate logic, FOPL, interpretation, quantification, horn clauses,
Rules of inference, unification, resolution refutation system (RRS), answer extraction from RRS, rule based deduction system,
Statistical Reasoning-Probability and Bayes' theorem and causal networks, reasoning in belief network

## B.5 Structured knowledge representation (4 hrs)
Representations and Mappings,
Approaches to Knowledge Representation,
Issues in Knowledge Representation,
Semantic nets, frames,
Conceptual dependencies and scripts

## B.6 Machine learning (6 hrs)
Concepts of learning,
Learning by analogy, Inductive learning, Explanation based learning
Neural networks,
Genetic algorithm
Fuzzy learning
Boltzmann Machines

## B.7 Applications of AI (14 hrs)
Neural networks
	Network structure
	Adaline network
	Perceptron
	Multilayer Perceptron, Back Propagation
	Hopfield network
	Kohonen network
Expert System
	Architecture of an expert system
	Knowledge acquisition, induction
	Knowledge representation, Declarative knowledge, Procedural knowledge
	Development of expert systems
Natural Language Processing and Machine Vision
	Levels of analysis: Phonetic, Syntactic, Semantic, Pragmatic
	 Introduction to Machine Vision

Practical:
Laboratory exercises should be conducted in either LISP or PROLOG. Laboratory exercises must cover the fundamental search techniques, simple question answering, inference and reasoning.

References:

E. Rich and Knight, Artificial Intelligence, McGraw Hill, 2009.
D. W. Patterson, Artificial Intelligence and Expert Systems, Prentice Hall, 2010.
P. H. Winston, Artificial Intelligence, Addison Wesley, 2008.
Stuart Russel and Peter Norvig, Artificial Intelligence A Modern Approach, Pearson, 2010



# C DSAP				EX 710

## C.1 Discrete time signals and systems [8 hours]
1.1. Discrete time signal, basic signal types
1.2. Energy signal, power signal
1.3. Periodicity of discrete time signal
1.4. Transformation of independent variable
1.5. Discrete time Fourier series and properties
1.6. Discrete time Fourier transform and properties
1.7. Discrete time system properties
1.8. Linear time invariant (LTI) system convolution sum, properties of LTI system
1.9. Frequency response of LTI system
1.10. Sampling of continuous time signal, spectral properties of sampled signal.

## C.2 Z-transform [4 hours]
2.1. Defintion, convergence of Z-transform and region of convergence
2.2. Properties of Z-transform (linearity, time shift, multiplication by exponential sequence, differentiation, time reversal, convolution, multiplication)
2.3. Inverse z-transform by long division and partial fraction expansion.

## C.3 Analysis of LTI system in frequency domain [6 hours]
3.1. Frequency response of LTI system, response to complex exponential
3.2. Linear constant co-efficient difference equation and corresponding system function
3.3. Relationship of frequency response to pole-zero of system
3.4. Linear phase of LTI system and its relationship to causality.

## C.4 Discrete filter structures [8 hours]
4.1. FIR filter, Structures for FIR filter (direct form, cascade, frequency sampling, lattice)
4.2. IIR filter, structures for IIR filter (direct form I, direct form II, cascade, lattice, lattice ladder)
4.3. Quantization effect ( truncation, rounding), limit cycles and scaling.

## C.5 FIR filter design [6 hours]
5.1. 5.1 Filter design by window method, commonly used windows ( rectangular window, Hanning window, Hamming window)
5.2. 5.2 Filter design by Kaiser window
5.3. 5.3 Filter design by frequency sampling method
5.4. 5.4 Filter design using optimum approximation, Remez exchange algorithm.

## C.6 IIR filter design 6 [hours]
6.1. Filter design by impulse invariance method
6.2. Filter design using bilinear transformation
6.3. Design of digital low pass Butterworth filter
6.4. Properties of Chebyshev filter, properties of elliptic filter, properties of Bessel filter, Spectral transformation.

## C.7 Discrete Fourier transform [7 hours]
7.1. Discrete Fourier transform (DFT) representation, properties of DFT (linearity, time shift, frequency shift, conjugation and conjugate symmetry, duality, convolution, multiplication), circular convolution
7.2. Fast Fourier Transform (FFT) algorithm (decimation in time algorithm, decimation in frequency algorithm)
7.3. Computational complexity of FFT algorithm.

Practical:
1. Introduction to DSP tools.
2. Signal generation and manipulation
3. Convolution
4. Cascade of second order systems
5. IIR filter
6. FIR filter

References
1. Alan V. Oppenheim, Ronald W. Schafer, John R. Buck, “Discrete-Time Signal Processing”, Pearson Education.
2. John G. Proakis, Dimitris G. Manolakis, “Digital Signal Processing”, Prentice Hall.

# D Wireless Communication		EX 715


## D.1 Introduction(2 hours)
Evolution of wireless (mobile) communications, worldwide market, examples
Comparison of available wireless systems, trends
Trends in cellular radio (2G, 2.5G, 3G, beyond 3G) and personal wireless communication systems

## D.2 Cellular mobile communication concept(4 hours)
 Frequency re-use and channel assignment strategies
Handoff strategies, types, priorities, practical considerations
Interference and system capacity, co-channel and adjacent channel interference, power control measures
Grade of service, definition, standards
Coverage and capacity enhancement in cellular network, cell splitting, sectoring, repeaters, microcells

## D.3 Radio wave propagation in mobile network environment(12 hours)
ReviewFree space propagation model, radiated power and electric field
ReviewPropagation mechanisms (large-scale path loss) - Reflection, ground reflection, diffraction and scattering
Practical link budget design using path loss models.
Outdoor propagation models (Longley-Rice, Okumura, Hata, Walfisch and Bertoni, microcell)
Indoor  propagation models (partition losses, long-distance path loss, multiple breakpoint, attenuation factor)
Small scale fading and multipath (factors, Doppler shift), Impulse response model of multipath channel, multipath measurements, parameters of mobile multipath channel (time dispersion, coherence bandwidth, Doppler spread and coherence time)
Types of small-scale fading (flat, frequency selective, fast, slow), Rayleigh and Ricean fading distribution

## D.4 Modulation-Demodulation methods in mobile communications(4 hours
Review of amplitude (DSB, SSB, VSB) and angle (frequency, phase) modulations and demodulation techniques
Review of line coding,  digital linear   (BPSK, DPSK, QPSKs) and constant envelop (BFSK, MSK, GMSK) modulation and demodulation techniques
M-ary (MPSK, MFSK, QAM and OFDM) modulation and demodulation techniques
Spread spectrum modulation techniques, PN sequences, direct sequence and frequency hopped spread spectrums
Performance comparison of modulations techniques in various fading channels

## D.5 Equalization and diversity techniques(4 hours)
Basics of equalization. Equalization in communications receivers, linear equalizers
 Non-linear equalization, decision feedback and maximum likelihood sequence estimation equalizations
Adaptive equalization algorithms, zero forcing, least mean square, recursive least squares algorithms, fractionally spaced equalizers
Diversity methods, advantages of diversity, basic definitions
Space diversity, reception methods (selection, feedback, maximum ratio and equal gain diversity)
Polarization, frequency and time diversity
RAKE receivers and interleaving

## D.6 Speech and channel coding fundamentals(4 hours)
Characteristics of speech signals, frequency domain coding of speech (sub-band and adaptive transform coding)
Vocoders (channel, formant, cepstrum and voice-excited ), Linear predictive coders (multipulse, code and residual excited LPCs), Codec for GSM mobile standard
Review of block codes, Hamming, Hadamard, Golay, Cyclic, Bosh-Chaudhary- Hocquenghgem (BCH), Reed-Solomon (RS) codes
Convolutional codes, encoders, coding gain, decoding algorithms (Viterbi and others)
Trellis Code Modulation (TCM), Turbo codes

## D.7 Multiple Access in Wireless communications(9 hours)
Frequency Division Multiple Access (FDMA), principles and  applications 
Time Division Multiple Access (TDMA), principles and applications
Spread Spectrum Multiple Access, Frequency Hopped Multiple Access, Code Division Multiple Access, hybrid spread spectrum multiple access techniques
Space Division Multiple Access
Standards for Wireless Local Area Networks

## D.8 Wireless systems and standards(6 hours)
Evolution of wireless telephone systems: AMPS, PHS, DECT, CT2, IS-94, PACS, IS-95, IS-136, IS-54 etc.
Global system for Mobile (GSM): Services and features, system architecture, radio sub-system, channel types ( traffic and control), frame structure, signal processing, example of a GSM call 
CDMA standards: Frequency and channel specifications, Forward and Reverse CDMA channels
WiFi, WiMAX, UMB, UMTS, CDMA-EVDO, LTE, and recent trends
Regulatory issues (spectrum allocation, spectrum pricing, licensing, tariff  regulation and interconnection issues)

Practical:

Case Study and Field Visit
Visits to mobile service operators, network service providers, internet service providers

References:

K. Feher,  Wireless Digital Communications, latest editions
T. Rappaport, Wireless Communications, Latest editions
J. Schiller, Mobile Communications
Leon Couch, Digital and analog communication systems, latest edition
B.P.Lathi, Analog  and Digital communication systems, latest edition
J. Proakis, Digital communication systems, latest edition
D. Sharma, Course manual “Communication Systems II”.  
