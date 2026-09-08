## efficiency of TDMA

the efficiency of a TDMA system is a measure of the percentage of transmitted data that contains information as opposed to providing overhead for the access scheme.
The frame efficiency, $\eta_f$, is the percentage of bits per frame which contains transmitted data.
Note that the transmitted data may include source and channel coding bits, so the raw end-userefficiency of a system is generally less than $\eta_f$.
The frame efficiency can be found as follows.

The number of overhead bits per frame is:
$$b_{OH} = N_r b_r + N_t b_p + N_t b_g + N_r b_g$$

where $N_r$ is the number of reference burts per frame
$N_t$ is the number of traffic bursts per frame
$b_r$ is the number of overhead bits per reference burst,
$b_p$ is the number of overhead bits per preamble in each slot,
$b_g$ is the number of equivalent bits in each guard time interval.
The total number of bits per frame is $b_T$ is
$$b_T = T_f R$$

where $T_f$ is the frame duration and $R$ is teh channel bit rate.
The frame efficiency $\eta_f$ is thus given as
$$\eta_f = \left( 1 - \dfrac{b_{OH}}{b_T}\right)\times 100\%$$

# Frequency Hopped Multiple Access

_(Multiple notes:)_

FHMA is a digital multiple access system in whcih the carrier frequencies of the individual users are varied in a pseudorandom fashion within a wideband channel.
Spectrum allocation figure:
![Spread spectrum multiple acess in which each channel is assigned a unique PN code which is orthogonal or approximately orthogonal to PN codes used by other users, channel share time and frequency, differ in code](attachments/fhss-spectrum.png)

Each user dwells at a specific narrowband channel at a particular instance of time, based on the particular PN code of the suer.
THe digital data of each user is broken into uniform sized bursts which are transmitted on different channels within the allocated spectrum band.
The instantaneous bandwidth of any one transmission burst is much smaller than the total spread bandwidth.
the pseudo random change of the channel frequencies of the user randomizes the occupancy of a specific channel at any given time, tehreby allowing for multiple access over a wide range of frequencies.
in the FH receiver, a locally generated PN code is used to synchronize the receiver's instaneous frequency with that of the transmitter.
at any given point in time, a frequency hopped signal only occupies a single, relatively narrow channel since narrowband FM or FSK is used.
the difference between FHMA and a traditional FDMA system is that the requency hopped signal changes channels at rapid intervals.
If the rate of change of the carrirer frequency is greater than the symbol rate, then the system is referred to as a fast frequency hopping system.
if the channle changes at a rate less than or eqaual to the symbol rate, it is called slow frequency hopping.
a fast frequency hopper thus may be thought of as an FDMA system which employs frequency diversity.
FHMA systems often employ energy efficient constant envelope modulation.
Inexpensive receivers may be built to provide noncoherent detection of FHMA.
this implies that linearity is not an issue, and the power of multiple users at the receiver does not degrade FMHA performance.

A frequency hopped system provides a level of security, especially when a large number of channels are used, since an unintended (or an intercepting) receiver that does not know the pseudo-random sequence of frequency slots must retune rapidly to search for the signal it wishes to intercept.
In addition, the FH signal is somwhat immune to fading, since error control coding and interleaving can be used to protect teh frequency hopped signal against deep fades which occasionally occur during the hopping sequence.
Error control coding and interleaving can also be combined to guard against _erasures_ which can occur when two or more users transmit on the same channel at the samne time.
Bluetooth and HomeRF wireless technologies have adopted FHMA for power efficiency and low cost implementation.

---

FHSS is a method of transmitting radio signals by rapidly switching a carrier among many frequency channels, using a pseudorandom sequence known to both Tx and Rx.
the data signal is modulated with a narrowband carrier signal that "hops" in a random but predictable sequence from frequency to frequency as a function of time over a wide band of frequnecies
It is used as multiple access method in FH-CDMA scheme
Two types of FHSS
1. Slow frequency hopping spread spectrum (S-FHSS)
2. Fast frequency hopping spread spectrum (F-FHSS)

![Data transmission during slow fhss](attachments/fhma-slow-fhss.png)

![Data transmission during fast fhss](attachments/fhma-fast-fhss.png)

Uses:
1. Military use
2. Bluetooth
3. Walkie-Talkie
4. Other radios

Block diagram for transmission

![Transmission of FHMA from input to output data](attachments/fhma-block-diagram.png)

# CDMA

in CDMA, the power of multipath users at a reciever determines the noise floor after decorrelation.
If the power of each user is not controlled, the near-far problem occurs.
The near-far problem occurs when many mobile users share the same channel.
Since one transmission is the other's noise, the SNR for further transmitter must be higher.
If the nearer transmits a signal in magnitudes of the order over the further transmitter may be below the required value making the singal undetectable and the farther transmitter may just as well not transmit.
To overcome this problem, a power control mechanism is used.

Power control mechanism is provided by each base station in a cellular system and assures that each mobile within the base station coverage area provides the same signal level to the abse station receiver.
Problem scenario is described by the figure:
![With different transmitters, the BTS may not acknowledge farther transmitter](attachments/cdma-near-far-scenario.png)
