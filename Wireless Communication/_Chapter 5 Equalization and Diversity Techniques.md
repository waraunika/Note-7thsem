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

### Equalization Techniques

- Two general categories - linear and non-linear equalization
- If d(t) is not the feedback path to adapt the equalizer, the equalization is linear
- If d(t) is fed back to change the subsequent outputs of the equalizer, teh equalization is nonlinear.

#### Linear Equalization

##### Linear Transveral Equalizer (LTE)

- LTE is made up of tapped delay lines as shown in the block diagram.
    - ![Basic Linear Transversal Equalizer Structure](attachments/equalizer-lte-structure.png)
- Assuming the delay elements have a unity gain, and delay $T_S$, the transfer function of the linear equalizer can be written as a function of the delay operation: $\exp(-jw T_s)$ or $z^{-1}$.
- the simple LTE uses only feed forward taps.
- The equalizer can also use both feed forward and feedback taps.
    - Example in the block diagram:
    - ![Tapped delay line filter with both feedforward and feedback taps](attachments/equalizer-lte-feedback.png)
- The equalizer using both feed forward and feedback taps are unstable and are rarely used.

#### Non-Linear Equalization

- Used in applications where the channel distortion is too severe.
- In attempt to compensate for the distortion, the linear equalizer places too much gain in the vicinity of the spectral null, thereby enhancing hte noise present in those frequencies
- 2 effective methods
    - Decision Feedback Equalization (DFE)
    - Maximum Likelihood Sequence Estimator (MLSE)

##### Decision Feedback Equalizer

- Block diagram:
    - ![Decision Feedback Equalizer](attachments/equalizer-dfe.png)

##### Nonlinear Equalization - MLSE

- MLSE tests all possible data sequences
    - rather than decoding each received symbol by itself
    - and chooses the data sequence with the maximum probability as the output.
- Usually has a large computational requirement.
- First proposed by Forney using a basic MLSE estimator structure and implementing it with the Viterbi Algorithm.
- Here, statet of radio channel is estimated by receiveing using $L$ most recent input samples.
- If $M$ is the size of symbol alphabet of modulation, then channel has $M^L$ states.
- Viterbi algorithm then traces the state of channel by paths through the $M^L$ trellis and give it at stage $k$ the most probable sequence.
- MLSE is optimum equalizer
    - as it iminimizes the probability of sequence error.

### Solutions for Optimum Weights

- Let input vector $y_k$ and weight vector $w_k$.
- then
    $$\begin{align}
        y_k = [y_k,\ y_{k-1},\ y_{k-2},\ ...\ y_{k-N}]^T\\
        \omega_k = [\omega_{k},\ \omega_{k-1}, \omega_{k-2}, ... \omega_{k-N}]^T
    \end{align}$$
- Output:
    $$\begin{equation}
        \hat d_k = y_k^T w_k = w_k^T y_k
    \end{equation}$$
- Desired equalizer output
    $$\begin{equation}
        d_k = x_k
    \end{equation}$$
- Error Signal
    $$\begin{align}
        e_k &= d_k - \hat d_k = x_k - d_k\\
        &= x_k - y_k^T \omega_k = x_k - \omega_k^T y_k\\
        |e_k|^2 &= x_k^2 + \omega_k^T y_k y_k^T \omega_k - 2x_k y_k^T \omega_k
    \end{align}$$
- Expected Value
    $$\begin{equation}
        E\left[ |e_k|^2\right] = E[x_k^2]+\omega_k^TE\left[y_k y_k^T\right] \omega_k 
    \end{equation}$$
- The weight values $w_k$ of the filter is not included in the calculation of time average,
    - as it is assumed as an optimum value that has been converged.
- Therefore $w_k$ does not change with time period.
- Input correlation matrix defined as the (N+1)(N+1) square matrix R
    $$\begin{equation}
        R = 
        E[y_k y_k^*] = E
        \begin{bmatrix}
            y_k^2 & y_k y_{k-1} & y_k y_{k-2} & \dots & y_k y_{k-N}\\
            y_{k-1} y_k & y_{k-1}^2 & y_{k-1}{k-2} & \dots & y_{k-1} y_{k-N} \\
            \vdots & \vdots & \vdots & \ddots & \vdots \\
            y_{k-N} y_k & y_{k-N} y_{k-1} & y_{k-N} y_{k-2} & \dots & y_{k-N}^2
        \end{bmatrix}
    \end{equation}$$
- Cross correlation vector p between the desired response and the input signal.
    $$\begin{equation}
        p = E[x_k y_k] = E[x_k y_k \hspace{2mm} x_k y_{k-1} \hspace{2mm} x_k y_{k-2} \hspace{2mm} \dots \hspace{2mm} x_k y_{k-N}]^T
    \end{equation}$$
- Mean Square Error
    $$\begin{equation}
        \zeta = E\left[\left|e_{k}\right|^{2}\right]=E\left[x_{k}^{2}\right]+\omega ^{T}R\omega -2p^{T}\omega
    \end{equation}$$
- Minimizing the MSE leads to optimal solutions $w_k$

### Algorithm for Adaptive Equalization

#### Zero forcing

- Zero forcing equalizer refers to a form of linear equalization algorithm used in communication systems
    - which applies the inverse of the frequency response of the channel.
    - This form of equalizer was first proposed by Robert Lucky.
- For a channel with frequency resposne $F(f)$,
    - the zero forcing equalizer $C(f)$ is constructed by $C(f) = \dfrac{1}{C(F)}$
    - thus the combination of channel and equalizer gives a flat frequency response and linear phase.
- the equalizer coeffficients $c_n$ are chosen to force the samples of the combined channel and equalizer impulse response to zero at all but one of the NT spaced sample points in the tapped delay line filter.
- by letting the number of coefficients increase without bound,
    - an infinite length equalizer with zero ISI at the output can be obtained.
- In reality, zero-forcing equalization does not work in most applications:
    - Even though the channel impulse response has finite length, the impulse response of the equalizer needs to be infinitely long
    - At some frequenceis, the received signal may be weak.
        - To compensate, the magnitude of zero-forcing filter ("gain") grows very large.
        - As a consequence, any noise added after the channel gets boosted by a large factor and destroys the overall signal-to-noise ratio.
        - Further, the channel may have zeros in its frequency response that cannot be inverted at all. (Gain $\times$ 0 = still 0)

#### Least Mean Square Algorithm

- The criterion used in the minimization of the MSE between the desired equalizer output and the actual equalizer output.
- Use derivation of MSE, we have eqn (14).
- The LMS algorithm seeks to minimize the mean square error.
- For a specific channel condition, the prediction error $e_k$ is dependent on the tap gain vector $w_k$, so the MSE of an equalizer is a function of $w_N$.
- Let the cost function $J(w_N)$ denote the MSE as a function of tap gain vector $w_N$.
- To obtain the optimal tap gain vector $w_N$, the normal equation must be solved iteratively as the equalizer converges to an acceptably small value of $J_{opt}$.
$$\begin{align}
    \frac{\partial}{\partial w_n} J(w_N) &= -2p_N + 2R_{NN} w_N = 0\\
    R_{NN} \hat w_N &= p_N\\
    J_{opt} = J(\hat w_N) &= E[x_k x_k^*] - p_N^T \hat w_N
\end{align}$$

# Diversity Methods

- Diversity is a powerful communication receiver technique that provides wireless link improvement at relatively low cost.
- Can provide significant link improvement with little added cost.
- Diversity decision are made by the RX and are unknown to the TX
- Diversity Concept:
    - If one radio path undergoes a deep fade, another independent path may have a strong isgnal.
    - By having more than one path to sleect from, both the instantaneous and average SNRs at the receiver may be improved,
        - often by as much as 20 dB to 30 dB

## Microscopic Diversity

- used for small-scale fading
- If the antenna are separated by a fraction of a meter, one may receive a null while the other receives a strong signal.
- By selecting the best signal at all times, a receiver can mitigate small-scale fading effect.
- This is called antenna diversity (or **space diversity**)

## Macroscopic Diversity

- Used in large-scale fading caused by shadowing due to variations in both the terrain profile and the nature of surroundings.
- In deeply shadowed conditions, the received signal strength at a mobile can drop well below that of free space.
- by selecting a base station, which is not shadowed, when others are, the mobile can improve substantially the average SNR on the forward link.
- This is called macroscopic diversity, since the mobile is taking advantage of alrge separations between the serving base stations.

## Diversity Techniques (Space Diversity)

- Space diversity, aka antenna diversity
- The signal receieved from spatially separated antennas on the mobile would have essentially **uncorrelated envelopes** for antenan separations of one half wavelenegth ($\lambda/2$) or more.
- general block diagram
    - ![Generalized Block diagram for space diversity](attachments/diversity-space-block.png)
- Four categories:

### Selection Diversity

- $m$ diversity branches whose gains are adjusted to provide the same average SNR for each branch.
- The receiver branch having the highest instantaneous SNR is connected to the demodulator i.e., the antenna signals are sampled and the best one sent to a single demodulation.
- A practical selection diversity system has to be designed carefully such that reciprocal of the mobile signal fading rate is longer than the internal time constant values of selection diversity circuitry.
- General block diagram for its working
    - ![Working Block Diagram of Space Diversity](attachments/diversity-selection-working.png)
    - Principle: selecting the best signal among all the signal received from different branches at the receiving end

### Feedback or Scanning Diversity

- The $M$ signals are scanned in a fixed sequence until one is found to be above a predetermined threshold.
- The signal is then received until it falls below threshold and the scanning process is again initiated.
- The resulting fading statistics are somewhat inferior to those obtained by the other methods.
- Simple to implement, only one receiver is required.
- Working Block Diagram
    - ![Basic Form for scanning diversity](attachments/diversity-feedback-block.png)
    - Principle: The $M$ signals are scanned in a fixed sequence until one is found to be above predetermined threshold.

### Maximal Ratio Combining Technique

- The signals from all the m branches are weighted according to their signal voltage to noise power ratios and then summed.
- The individual signals must be co-phased before being summed. i.e. it considers all


