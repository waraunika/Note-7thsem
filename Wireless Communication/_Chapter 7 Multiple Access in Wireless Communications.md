# Narrow and Wideband Systems

- Narrowband systems
    - the available radio spectrum is divided into a large number of narrowband channels.
    - The channels are usually operated using FDD.
- Wideband systems
    - Transmission bandwidth of signal is much larger than the coherence bandwidth of the radio channel.
    - Frequency selective fading occurs in only a small fraction of signal bandwidth.
- Diagramatic Representation:
    - ![Power vs f of NB and WB](attachments/nb-wb-coherence-bandwidth.png)
# Frequency Division Multiple Access

![FDMA where different channels are assigned different frequency bands](attachments/fdma-channel-allocation.png)

- FDMA assigns individual channels to individual users
- Each user is allocated a unique frequency band or channel
- The channels are assigned on demand to users who request service.
- During the period of the call, no other user can share the same channel.
- Features
    - usually immplemented in narrowband systems.
    - carries only one phone circuit at a time
    - If an FDMA channel is not in use, it sits idle and cannot be used by others to increase or share capacity.
    - FDMA is usually implemented in narrowband systems.
    - The symbol time is large to the average delay spread.
    - This implies that the amount of intersymbol interference is low and thus,
    - little or no equalization is required in FDMA narrowband systems.
- The complexity of FDMA mobile systems is lower when compared to TDMA systems.
- Since FDMA is a continuous transmission scheme, fewer bits are needed for overhead purposes.
- The FSMA mobile unit uses duplxers since both the transmitter and receiver operate at the same time.
- This results in an increase in the cost of FDMA subscriber units and base stations.
- FDMA requires tight RF filtering to minimze adjacent channel interference.
- The number of channels supported by FDMA is:
    - $$ N = \frac{B_t - 2B_{guard}}{B_c}$$
    - where $B_t$ is the total spectrum allocation
    - $B_{guard}$ is the guard band allocated at the edge of the spectrum

# Time Division Multiple Access

![TDMA scheme where each channel occupies a cyclically repeating time slot](attachments/tdma-channel-allocation.png)

- TDMA shares a single carrier frequency with several users, where each user makes use of non-overlapping time slots.
- Data transmission for users of a TDMA system is not continuous, but occurs in bursts
    - specific amount of data sent or received in one intermittent operation.
- This results in low battery consumption
- Because of discontinuous transmissions in TDMA, the handoff process is much simpler for a subscriber unit
    - since it is able to listen for other base stations during idle time slots.
- TDMA uses different time slots for transmission and reception, thus duplexers are not required.
- equalization is usually necessary in TDMA systems, since the transmission rates are generally very high as compared to FDMA channels
- High synchronization overhead is requried in TDMA systems because of burst transmissions.
- TDMA has an advantage in that it is possible to allocate different numbers of time slots per frame to different users.
- number of channel slots in a TDMA system
    - $$N = \dfrac{m(B_{tot} - 2B_{guard})}{B_c}$$
    - where m is the number of time slots on each channel.
    - $B_c$ is the carrier channel bandiwdth in Hz

## Frame

![TDMA frame structure](attachments/tdma-frame-structure.png)

- The preamble contains the address and synchronization information that both the base station and the subscribers use to identify each other.
- Guard times (bits) between the time slots helps in minimizing the interface due to propagation delay.
- the frame so-defined is split into time slots, and each user is assigned a time slot in which to transmit its information.
- the preamble contains the address and synchronization information that both the base station and the subscribers use to identify each other
- Guard times (bits) between the time slots help in minimzing the interference due to propagation delay
- Trail bits: error correction bits (usually checksum or CRC)

## Features

- TDMA shares a single carrier frequency with several users
- Data transmission for a user is not continuous
    - low battery consumption: transmitter can be turned off when not in use
    - MAHO: listening to other BTS when on an idle slot
- Different slots for transmission and reception: duplexers are not required even when FDD is used.
- Usually transmission rates are very high (equalization is needed)
- Guard time should be minimized. However, this could increase the interference to the adjacent channels.
- High overhead bits (TDMA frame structure)
- can allocate different number of slots to different users: adjustable bandwidth to different users.

# Code Division Multiple Access

- CDMA technology is known as spread spectrum technique which allows users to occupy the same time and frequency allocations in a given band and space.
- The narrowband message signal is multiplied by a very large bandwidth signal called the spreading signal.
- Individual conversations are encoded with the help of pseudo-random digital sequence.
- Multiple accesses: The use of pspreading codes which is independent for each user along with synchronous reception will allow multiple users to access the same channel simultaneously.
- Use of Wide Bandwidth:
    - CDMA like other spread-spectrum technologies uses a wider bandwidth that would otehrwise be needed for the transmissino of data.
    - This results in a number of advantages including an increased immunity to interference and multiple user access.
- Level of Security:
    - in order to receive the data, the receiver synchronizes the code to recover the data.
    - the use of an independent data and synchronous reception allows multiple users to access the same frequency band at the same time.

## Working

- CDMA is entirely a different approach from TDMA.
- CDMA after digitizing the data, spreads out the data over the entire available bandiwdth
- Multiple calls are overlapped to each other on a channel which is assigned with a unique sequence code.
- CDMA is a form of spread-spectrum technique, which means data can be sent in small pieces over a number of frequencies available to use at any time in the specified range.
- all the users' data can be transmitted in a similar way to that of wide band chunk of the spectrum.
- Users signals are spread over the entire bandwidth by a unique spreading code.
- at the receiver end, the same code is used to recover the signal.
- CDMA system requires accurate time stamp on each piece of signal.
- eight and ten separate calls are carried out in the same channel space as one analog call.

## Types

- Frequency Hopping
    - Frequency hopping is the easiest of all the spread spectrum modulation technique to use.
    - the idea behind frequency hopping is to transmit data across a board spectrum; the frequency can be rapidly switched from one to another.
    - the transmitter and receiver are synchronized every time, and an accurate clocking system, and pseudo generating system make this frequency hopping very simple.
- Direct sequence
    - direct sequence is the msot famour spread spectrum technique in which the data signal is multiplied by a pseudo-random noise code.
    - a PN code is a sequence of chips which is given values as -1 and 1 (non-polar) or 0 and 1 (polar).
    - the number of chips within one code is known as the period of  this code.
    - the digital data is directly coded at higher frequency, and the code is generated pseudo randomly.
    - a receiver knows how to generate the same code and correlates the received signal with that code to extract the data.
    
## Features of CDMA

- Many users of a CDMA system share the same frequ
    - Either TDD or FDDD may be used.
- CDMA has a soft capacity limit.
    - increasing teh number of users in a cdma system raises the noise floor in a linear manner.
    - thus there is no absolute limit on the number of users in CDMA.
- Multipath pading may be substantially reduced because the signal is spread over a large spectrum.
- If the spread spectrum bandwidth is greater than the coherence bandwidth of the channel, the inherent frequency diversity will mitigate the effects of small-scale fading.
- Since PN sequences have low autocorrelation, multipath which is delayed by more than a chip will appear as noise.
    - a RAKE receiver can be used to improve reception by collecting time delayed versions of the required signal.
- in cdma, soft handoff is performed by the MSC. 
    - the msc may choose the best version of the signal at any time without switching frequencies
- Self-jamming is a problem in cdma.
    - self-jamming arises from the fact that the spreading sequences of different users are not exactly orthogonal, hence in teh despreading of a particular PN code, non-zero contributions to the receiver signal for a desired user arise from the transmissions of other users in the system.
- The near-far problem occurs at a CDMA receiver if an undesired user has a high detected power as compared to the desired user.

_Implementation already in Communication system, so will not be repeating here_

# Hybrid Spread Spectrum Technologies

- Hybrid FDMA/CDMA
    - this technique can be used as an alternative to the DS-CDMA
    - available wideband spectrum is divided into a number of subspectras with smaller bandwidths
    - each of these smaller subchannles become a narrowband CDMA system having processing gain lower than original CDMA system.
    - Different users can be allocated different subspectrum bandwidths depending on their requirements.
- Diagramtic Representation
    - ![Spectrum of Wideband CDMA occupied to the spectrum of a hybrid, frequency division, direct sequence of multiple access](attachments/hybrid-splitting-of-wb-to-nb.png)
## Techniques

- Hybrid Direct Sequence/Frequency Hopped (DS/FHMA)
    - Consists of a direct sequence modulated signal whose center frequency is made to hop periodically in a pseudorandom fashion.
    - avoids teh near-far problem as frequency diversity is introduced.
    - but not adpatable to the soft handoff because the FH base station receiver are required to be synchronized to the multiple hopped signals.
    - Figure:
        - ![Frequency Spectrum of a hybrid FH/DS System](attachments/fhds-frequency-spectrum.png)
- Time Division CDMA (TCDMA)
    - Different spreading codes are assigned to different cells.
    - only one user per cell is allotted a particular time slot
    - it avoids the near-far effect since only one user transmits at a time within a cell.
    - when a handoff takes place, the spreading code of the user is changed to that of the new cell.
- Time division Frequency Hopping (TDFH)
    - subscriber can hop to a new frequency at the start of a new TDMA frame, thus avoiding sever deep frequency selective fading or co-channel interference
    - The mobile subscriber can hop to a new frequency at the beginning of every TDMA frame.
    - At each time slot,t he mobile subscriber is hopped to anew frequency according to a pseudo random hopping sequence.

# Space Division Multiple Access

- controls the radiated energy for each user in the space.
- that is, serves different users by using spot beam antennas
- these areas covered by the antenna beam may be served by the same frequency (in TDMA or CDMA system) or different frequencies (in an FDMA system)
- Sectorized antennas are primitive application of SDMA.
- Figure
    - ![A spatially filtered base station antenna serving different users by using spot beams](attachments/sdma-conceptual-figure.png)


