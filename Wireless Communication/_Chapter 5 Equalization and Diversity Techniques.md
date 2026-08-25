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

## Mode of Operation

### Training Mode

- To measure the channel
- Initially, a known fixed length training sequence is sent by the transmitter so that the receiver equalizer may average to a proper setting.
- Training sequence is typically a pseudo-random binary signal or a fixed prescribed bit pattern.
- The training sequence is designed to permit an equalizer at the receiver
    - to acquire proper filter coefficient
    - in the worst possible channel condition
- An adaptive filter at the receiver thus uses a recursive algorithm to evaluate the channel and estimate filter coefficients to compensate for the channel.
- Worst scenario: Deepest Fade, Maximum ISI, Maximum delay.
- Three factors affect the time spanning over which equalizer converges:
    - equalizer structure
    - equalizer algorithm
    - time rate of change of the multipath radio channel.
- TDMA wireless systems are particularly well suited for equalizers.

### Tracking Mode

- Followed by training mode
- When the training sequence is finished the filter coefficients are near optimal
- Immediately following training sequence, user data is sent
- When the data of the users are received, the adaptive algorithms of the equalizer tracks the changing channel.
- As a result, the adaptive equalizer continuously changes the filter characteristics over time.

## Implementation

- Is usually implemented at baseband or at IF in a receiver
    $$\begin{equation}
        y(t) = x(t) * f(t) + n_b(t)
    \end{equation}$$
- x(t): transmitted signal
- f(t): combined impulse response of the transmitter, channel and the RF/IF section of the receiver.
- $n_b(t)$: baseband noise at the input of the equalizer
- $h_{eq}(t)$: impulse response of the equalizer
- $*$: denotes convolution operation.
- Here: we take $d(t)$ as desired output, convolved of output y(t) with equalizer
    $$\begin{align}
        d(t) &= y(t)*h_{eq}(t)\\
        &= x(t) * f(t) * h_{eq}(t) + n_b(t) * h_{eq}(t)
    \end{align}$$
- Here, we need $f(t) * h_{eq}(t)$ = $\delta(t)$
- Therefore, $F(f) H_{eq}(f) = 1$
- This indicates that an equalizer is actually an inverse filter of the channel.
- If the channel is frequency selective, the equalizer enhances the frequency components with small amplitudes and attenuates the strong frequencies in the received frequence response.
- For a time varying channel, an adaptive equalizer is needed to track the channel variations.

## Adaptive Equalization

- An adaptive equalizer is a time-varying filter which must constantly be retuned.
- Transversal filter with N delay elements, N+1 taps, and N+1 tunable complex weights.
- These weights ar eupdated continuously by an adaptive algorithm,
    - either on sample by sample basis or on block by block basis.
- The adaptive algorithm is controlled by the error signal $e_k$.

### Block Diagram


![Adaptive Equalizer during training](attachments/adaptive-equalization-training.png)

### Operation

- the error signal is derived by comparing the output of the equalizer $\hat d_k$
    - with some signal $d_k$ which is either an exact replica of the transmitted signal $x_k$
    - or which represents a known property of the transmitted signal.
- Adaptive algorithm uses $e_k$ to minimize a cost function and update the equalizer weights in a manner that iteratively reduces the cost function
- The Least Mean Squares (LMS) algorithm searches for the optimum or near optimum filter weights by performing the following iterative operation.
- New weights = Previous weights + (constant) $\times$ (Previous error) $\times$ (Current input vector)
    - where, Previous error = Previous desired outptut - Previous actual output
- the constant may be adjusted by the algorithm to control the variation between filter weights on successive iterations
- This process is repeated rapidly in a programming loop while the equalizer attempts to converge, and many techniques may be used to minimize the error.
- Upon reaching convergence
    - the adaptive algorithm freezes the filter weights,
    - until the error signal exceeds an acceptable level
    - or until a new training sequence is sent.
- the msot common cost function is the mean square error (MSE) between the desired signal and the output of the equalizer
- The MSE is denoted by $E[e(k)*e(k)]$

