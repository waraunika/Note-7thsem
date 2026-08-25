# Characteristics of Speech Signal

## Autocorrelation Function (ACF)
- In speech signal there exists much correlation between adjacent samples of the segment of speech.
    - This implies that in every sample of speech, there is a large componnet  that is easily predicted from the value of the precious samples with a small random error.
    - All differential and predictive coding schemes are based on exploiting this property.
- Formula:
    $$\begin{equation}
        C(k) = \dfrac1N \sum_{n=0}^{N-|k|-1} x(n)\cdot x(n+|k|)
    \end{equation}$$
    - Here, x(k) is k$^{th}$ sample of speech signal.
    - Typical signals have an adjacent sample correlation
    - as high as 0.85 to 0.9.

## PSDF

- Speech signal amplitude has a non-uniform probability density function (pdf) denoted by

    $$\begin{equation}
        p(x) = \frac{1}{\sqrt{2\sigma_x}} \exp\left(\frac{-\sqrt{2} |x|}{\sigma_x}\right)
    \end{equation}$$
- The pdf of a speech signal is in general characterized by a very high probability of near-zero amplitudes, a significant probability of very high amplitudes, and a monotonically decreasing function of amplitudes between these extremes.
- Non-uniform quantizers, including vector quantizers, are used to match the distribution by allocating more quanitization levels in the regions of high probability and fewer levels in the region where the probability is low.

## Power Spectral Density Function (PSD)

- Non-flat characteristic of the power spectral density of speech makes it possible to obtain significant compression by coding speech in the frequency domain.
- That is, coding the speech signal separately in different frequency bands can lead to significant coding gain.
- it should be noted that the high frequency components, through insignificant in energy are very important carrier of speech information and hence need to be adequately represented in the coding system.
- This can be called **Frequency Domain Coding of Speech**

# Frequency Domain Coding of Speech

- This coding can be thought of as a method of distributing quantization noise across the signal spectrum.
- The speech signal is divided into a set of frequency components which are quantized and encoded separately.
- The number of bits used to encode each frequency component can be dynammically varied and shared among the different bands.
- Different frequency domain coding algorithms are as follows.

## Sub-band Coding

- The speech signal is divided into many smaller sub-bands and encodes each band separately.
- The sub-band coding aims on controlling and distributing the quanitzation noise over the entire signal spectrum.
- Speech is typically divided into 4 or 8 sub-bands by a bank of filters and then sampled at bandpass Nyquist rate and finally encoded.
- Can be used for coding speech at bit rates in the range of **9.6 kbps to 32kbps**
- There are various schemes available to process sub-bands but one of the better method is to do low-pass translation of sub-band signals to zero frequency value by applying a modulation scheme that is similar to single sideband modulation.
    - By this method, it helps in sampling rate reduction.
- Figure
    - ![Sub band coding with 4 frequency range](attachments/sub-band-coding.png)
    - LP transistor is a simple low-pass filter with **4 frequency ranges**.
    - Decimation (signal processing) in digital processing:
        - decimation is the process of reducing the sampling rate of a signal.
        - Complementary to interpolation, which increases sampling rate
        - it is a specific case of sample rate conversion in a multi-rate digital signal processing system.

## Adaptive Transform Coding (ATC)

- Involves block transformations of window input segments of the speech waveform
    - i.e. a sequence of samples.
- Each segment is represented by a set of transform coefficients, which are spearately quantized with number of bits proportional to its perceptual significance.
- Can be used to encode speech at bit rates in the range **9.6 kbps to 20 kbps**
- One of the most frequently used transforms:
    - **The Discrete cosine transform**
    $$\begin{equation}
        X_C (k) = \sum_{n=0}^{N-1} x(n) g(k) \cos\left[\frac{(2n+1)k\pi}{2N} \right]\ \text{for } k = 0, 1, 2, \dots N-1
    \end{equation}$$
    - Where g(0) = 1 and g(k) = $\sqrt{2}$, k = 1, 2, $\dots$ N-1
    - The inverse DCT is defined as:
    $$\begin{equation}
        x(n) = \frac1N \sum_{k=0}^{N-1} X_C (k) \cos\left[ \frac{(2n+1)k\pi}{2N} \right]\ \text{for } n = 0, 1, 2, \dots N-1
    \end{equation}$$

# Vocoders

- Analyze the voice signal at transmitter
- Transmit parameters derived from analysis
- Then synthesize the voice at the receiver using those parameters.
- All vocoder systems try to model the speech generation process as a dynamic system and attempt to quantify certain physical constraints of the system.
- These physical constraints are then used to provide a faint description of the speech signal.
- In general, much more complex than the waveform coders and achieve high economy in transmission bit rate.
- However, less robust, and the performance tends to be talker dependent.
- The most popular among the voding schemes is the linear predictive coder (**LPC**)

## Channel Vocoders

- First analysis-synthesis system.
- It is a frequency domain vocoder that determines the envelope of speech signal for a number of frequency bands
    - then sample, encode and multiplex these samples
    - with the encoded output of other filters
- In addition to energy details about each frequency band
    - the voice/unvoiced decision and the pitch frequency for voiced speech are transmitted.
- The sampling is done at every 10ms to 30ms.

### Analyzer

- The channel vocoder employs a number of bandpass filters
    - each having a bandwidth between 100 Hz and 300 Hz
- The output of each filter is rectified and lowpass filtered.
    - the bandwidth of the LPF is selected to match:
    - the time variations in the characteristics of the vocal tract.
- For measurement of the spectral magnitudes, a voicing detector and a pitch estimator are included in teh speech analysis.
- Block Diagram
    - ![Analyzer block diagram](attachments/channel-vocoder-analyzer.png)

### Synthesizer

- At the receiver the signal samples are passed through D/A converters.
- The outputs of the D/As are multiplied by the voiced or unvoiced signal sources.
- The resulting signal are passed through bandpass filters.
- The outputs of the bandpass filters are summed to form the synthesized spech signal
- Block Diagram
    - ![Synthesizer Block Diagram](attachments/vocoder-channel-synthesizer.png)

## Formant Vocoder

- Format meaning, as described by the figure:
    - ![Formant Vocoder](attachments/vocoder-formant.png)
- Formants:
    - Formants are frequenc peaks which have, in the spectrum, a high degree of energy.
    - They are specially prominent in vowels.
    - Each formant corresponds to a resonance in the vocal tract
    - roughly speaking, the spectrum has a formant every 1000 Hz.
- Example:
    - Spectral envelope of an \[i\] pronounced by a male speaker.
    - F1, F2, and F3 are the first 3 formants.
    - ![Example of i](attachments/formants-example.png)
- The spectral peaks of the sound spectrum | P(f) | are called formants.
- The formant vocoder can be viewed as a type of channel vocoder that:
    - estimates the first three or four formants in a segment of the speech.
- It is this information plus the pitch period that is encoded and transmitted to the receiver.
- Instead of sending samples of the power spectrum envelope,, the formant vocoder attempts to transmit the position of the peaks (formants) of the spectral envelope.
- Typically it must be able to identify at least three formants for representing the speech sounds, and also control the intensities of the formants.

### Analyzer

- Block Diagram
    - ![Analyzer Block Diagram](attachments/vocoder-formant-analyzer.png)

### Synthesizer

- Block Diagram
    - ![Synthesizer Block Diagram](attachments/vocoder-formant-synthesizer.png)

# Linear Predictive Coding (LPC)

- The objective of LP analysis is to estimate parameters of an all-pole model of the vocal tract.
- Several methods have been devised for generating the excitation sequence for speech synthesizers.
- LPC-type of speech analysis and synthesis are different 
