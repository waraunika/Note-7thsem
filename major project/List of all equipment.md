## Z.1 Bill of Materials: Complete Hardware List

### Z.1.1 Already in Your Possession

|Component|Quantity|Notes|
|---|---|---|
|Raspberry Pi (2018 Model B / 3B+)|1|Your existing unit; quad-core 1.4GHz, 1GB RAM [](https://www.ampheo.com/blog/raspberry-pi-hifi-audio-system-design-guide)|
|PCM1808 ADC|1|24-bit, 96kHz stereo ADC; will be configured for mono input|
|PCM5102 DAC|1|32-bit, 384kHz stereo DAC; stereo output (will use one channel)|
|7805 Voltage Regulator|1|5V regulator for power conditioning|
|9V DC Adapter (0.6A)|1|For analog section power|

> **⚠️ Critical Note on Power:** Your existing 0.6A adapter is **NOT sufficient** for the Raspberry Pi. The Pi 3B+ requires a **5V/3A USB-C power supply** (see below) [](https://www.ampheo.com/blog/raspberry-pi-hifi-audio-system-design-guide). Your 9V adapter will be used exclusively for the analog audio section (ADC and any preamp/buffer stages).

---

### Z.1.2 Core Processing (Raspberry Pi & Audio)

|Component|Quantity|Specifications|Notes|
|---|---|---|---|
|Raspberry Pi 3B+ (already owned)|1|1.4GHz quad-core, 1GB RAM|Confirmed sufficient for real-time DSP [](https://www.ampheo.com/blog/raspberry-pi-hifi-audio-system-design-guide)|
|MicroSD Card|1|32GB Class 10 (A1 or A2 rated)|For OS and storage; A2 rating recommended for faster random I/O|
|USB-C Power Supply|1|5V / 3A minimum|**DO NOT use the 9V/0.6A adapter for the Pi** [](https://www.ampheo.com/blog/raspberry-pi-hifi-audio-system-design-guide)|
|USB-C Cable|1|Good quality, <1m|For power connection|
|Heatsink Kit for Pi|1 set|3-piece (CPU, RAM, regulator)|Prevents thermal throttling during heavy DSP|
|Cooling Fan (optional)|1|5V, 30mm x 30mm|Recommended if enclosed in sealed pedal chassis|

### Z.1.3 Audio Interface (ADC/DAC Integration)

|Component|Quantity|Specifications|Notes|
|---|---|---|---|
|PCM1808 ADC Module|1|Breakout board|Already owned; verify breakout includes 3.5mm jack or solder pads|
|PCM5102 DAC Module|1|Breakout board|Already owned; verify breakout includes line output|
|Jumper Wires (Female-Female)|20|20cm length|For breadboard prototyping between modules|
|Jumper Wires (Male-Female)|20|20cm length|For connecting modules to Pi GPIO|

**PCM1808 Connection Details (from TI datasheet) [](https://www.ti.com/document-viewer/lit/html/SLES177B#detailed_description/SLES1772498)[](https://www.ti.com/product/PCM1808?HQS=ocb-tistore-invf-buynowlink_partpage-invf-store-snapeda-wwe):**

- **Power:** 5V (from 7805 or Pi 5V pin) and 3.3V (from Pi 3.3V pin)
    
- **I2S Pins:** BCK, LRCK, DOUT
    
- **System Clock (SCKI):** Needs 11.2896 MHz for 44.1kHz operation (256 fs mode) [](https://www.ti.com/product/PCM1808?HQS=ocb-tistore-invf-buynowlink_partpage-invf-store-snapeda-wwe)
    
- **Control Pins:** MD0, MD1, FMT (pull high/low for I2S, 24-bit, slave mode) [](https://www.ti.com/document-viewer/lit/html/SLES177B#detailed_description/SLES1772498)
    

**PCM5102 Connection Details:**

- **Power:** 5V and 3.3V (can share rails with ADC)
    
- **I2S Pins:** BCK, LRCK, DIN
    
- **Control Pins:** XMIT (connect to 3.3V), FLT (connect to GND), DEMP (connect to GND)
    
- **Output:** Left and Right channels; use one channel for mono output
    

---

### Z.1.4 Enclosure & Mechanical Hardware

|Component|Quantity|Specifications|Notes|
|---|---|---|---|
|Hammond 1590BB Enclosure|1|120mm × 95mm × 35mm (approx)|Industry standard for guitar pedals; aluminum for shielding [](https://www.pcbway.com/project/sponsor/Guitar_Feedback_Pedal_Boost_and_Phase_Reversal_8dd427ae.html)[](https://bitsboxuk.com/data/kits/MammBox1590.pdf#1#1)|
|3PDT Footswitch (Latching)|1|9-pin, true bypass|Main bypass switch [](https://www.pcbway.com/project/sponsor/Guitar_Feedback_Pedal_Boost_and_Phase_Reversal_8dd427ae.html)[](https://www.taydakits.com/instructions/pcb-for-1590bb-enclosure-horizontal/pages/designators-and-components--59)|
|Momentary Pushbuttons|2|SPST, normally open, 6mm|For preset up/down controls|
|LED Indicators|3|3mm or 5mm (Green, Red, Blue)|Power/bypass status + preset indicators [](https://www.pcbway.com/project/sponsor/Guitar_Feedback_Pedal_Boost_and_Phase_Reversal_8dd427ae.html)[](https://www.taydakits.com/instructions/pcb-for-1590bb-enclosure-horizontal/pages/designators-and-components--59)|
|LED Bezels|3|3mm or 5mm matching|For panel mounting LEDs|
|1/4" Mono Guitar Jacks|2|Switchcraft 11 or Neutrik NMJ6HC-S|Guitar input, amplifier output [](https://www.pcbway.com/project/sponsor/Guitar_Feedback_Pedal_Boost_and_Phase_Reversal_8dd427ae.html)[](https://www.vertexeffects.com/diy-interface)|
|1/4" TS Instrument Cable|1|6-10 feet|For connecting guitar to pedal|
|1/4" TS Patch Cable|1|1-3 feet|For connecting pedal to amplifier|
|9V Battery Clip|1|Standard|For 9V battery operation (alternative to DC adapter)|
|M3 Screws (6mm)|8|For mounting PCB, Pi, and jacks|Countersunk for jacks; pan head for board mounting|
|M2.5 Standoffs (12mm)|4|For mounting Raspberry Pi|Ensure sufficient clearance for airflow|
|Rubber Feet|4|Self-adhesive|For bottom of enclosure|
|Step Drill Bit|1|3mm-15mm range|For drilling enclosure holes [](https://www.vertexeffects.com/diy-interface)|
|Drill Punch (Center Punch)|1|For marking drill locations|Prevents bit wandering on aluminum [](https://www.vertexeffects.com/diy-interface)|

---

### Z.1.5 Control Interface Components

|Component|Quantity|Specifications|Notes|
|---|---|---|---|
|MCP3008 (10-bit ADC)|1|8-channel, SPI interface|Reads potentiometer positions|
|Potentiometers (Linear)|3|10kΩ linear (B10K)|Mix, Morph, Decay controls [](https://www.pcbway.com/project/sponsor/Guitar_Feedback_Pedal_Boost_and_Phase_Reversal_8dd427ae.html)|
|Potentiometer Knobs|3|6mm shaft, setscrew type|Choose size that fits enclosure spacing|
|10kΩ Resistors|10|1/4W, 5% or 1%|For pull-ups, LED current limiting [](https://www.pcbway.com/project/sponsor/Guitar_Feedback_Pedal_Boost_and_Phase_Reversal_8dd427ae.html)[](https://www.taydakits.com/instructions/pcb-for-1590bb-enclosure-horizontal/pages/designators-and-components--59)|
|4.7kΩ Resistors|3|1/4W, 5%|For LED current limiting [](https://www.pcbway.com/project/sponsor/Guitar_Feedback_Pedal_Boost_and_Phase_Reversal_8dd427ae.html)|
|100µF Capacitor|1|16V, electrolytic|Power supply filtering at the 7805 input/output [](https://www.taydakits.com/instructions/pcb-for-1590bb-enclosure-horizontal/pages/designators-and-components--59)|
|100nF Capacitor|4|Ceramic, 50V|Decoupling for IC power pins [](https://www.taydakits.com/instructions/pcb-for-1590bb-enclosure-horizontal/pages/designators-and-components--59)|
|1N4001 Diode|2|1A, 50V|Reverse polarity protection for 9V input [](https://www.taydakits.com/instructions/pcb-for-1590bb-enclosure-horizontal/pages/designators-and-components--59)|

### Z.1.6 I2C Display

|Component|Quantity|Specifications|Notes|
|---|---|---|---|
|OLED Display Module|1|128×32 pixels, I2C interface, SSD1306 driver|Shows current instrument preset|
|4.7kΩ Resistors|2|1/4W|Pull-up resistors for I2C clock and data lines|

---

### Z.1.7 Passive Components & Interconnect

| Component                        | Quantity | Specifications                              | Notes                                              |
| -------------------------------- | -------- | ------------------------------------------- | -------------------------------------------------- |
| 22 AWG Solid Core Wire           | 1 roll   | Multiple colors (Red, Black, Green, Yellow) | For power and signal wiring inside enclosure       |
| 24 AWG Stranded Wire             | 1 roll   | Multiple colors                             | For flexible connections to footswitches and jacks |
| 40-pin GPIO Breakout Cable       | 1        | Female-Female                               | For easier access to Pi GPIO during prototyping    |
| Solderless Breadboard            | 2        | Full-size                                   | For prototyping and testing before PCB design      |
| 40-pin Male-to-Female Jumper Kit | 1 set    | Various lengths                             | For connecting Pi GPIO to breadboard               |