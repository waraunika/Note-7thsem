# Introduction

- Three techniques are used independently or one after another to improve receiver signal quality.
- Equalization compensates for ISI created by multipath with time dispersive channels ($B_s > B_c$)
    - Linear equalization, nonlinear equalization
- Diversity also compensates for fading channel impairments, and is usually implemented by using two or more receiving antennas.
    - Spatial diversity, antenna polarization diversity, frequency diversity, time diversity
- The former counters the effect of time dispersion (ISI), while the latter reduces the depth and duration of the fades experienced by a receiver in a flat fading channel.

# Equalization

- Equalization is used for compensating Inter Symbol Interference (ISI).
- An equalizer with in a receiver compensates for average range of expected channel amplitude and delay characteristic
- As the mobile fading channels are random and time varying, equalizer must track the time varying characteristic of the mobile channel, and thus are called adaptive equalizer.
- An adaptive equalizer has two phases of operation:
    - Training and Tracking.

## Training Mode

- To measure the channel
- Initially, a known fixed length training sequence is sent by the transmitter so that the receiver equalizer may average to a proper setting.
- Training sequence is typically a pseudo-random binary signal or a fixed prescribed bit pattern.
- The training sequence is designed to permit an equalizer at the receiver
    - to acquire proper filter coefficient
    - in the worst possible channel condition
- An adaptive filter at the receiver thus uses a recursive algorithm to evaluate the channel and estimate filter coefficients to compensate for the channel.
- Worst scenario: Deepest Fade, Maximum ISI, Maximum delay.
