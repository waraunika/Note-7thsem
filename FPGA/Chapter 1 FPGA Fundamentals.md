<p style="text-align: center">
    <b> 5 Hours <br> 9 Marks</b>
</p>
<hr style="width:500px; height:5px;">

# ⁠A. FPGA overview and its evolution
## ⁠A.1. FPGA
- FPGA is:
    - Field Programmable Gate Array
    - a reprogrammable chip which contains hundreds of thousands of logic gates that internally connects together to build digital circuitry.
- It is dominant in digital design implementation
- ABility to re-configure FPGA to implement any digital logic function
- Partial re-configuration allows a portion of the FPGA to be continuously running while another portion is being re-configured.
- FPGAs also contain analog circuitry features including a programmable slew rate and drive strength, differential comparators on I/O designed to be connected to differential signalling channels.
- Mixed-signal FPGAs contain ADCs and DACs with analog signal conditional blocks allowing them to operate as a system-on-chip (SoC)
- FPGA now become Heterogenous System on Chip so it contain FPGA Fabric, CPU to GPU in single chip.
    - So workloads can be offloaded.
## ⁠A.2. Characteristics of FPGA - Feature
- FPGA consists of logical resources like LUT, FF, BRAM, DSP, IO, etc.
- It can be programmed with HDL or hardware description language based generated files called BITSTREAM files.
- FPGA can have smaller number of logical resources or blocks to million of units of those blocks.
- FPGA can be re-programmed number of times as user need.
## ⁠A.3. FPGA vs MCU/Microprocessor
<table>
    <tr>
        <th>Microcontrollers
        <th>FPGA
	</tr>
    <tr>
        <td>MCU has less processing capacity on the basis of memory and processes.
        <td>
            <ul>
                <li>User can configure with own architecture.
                <li>FPGA consists of large Clock (MHz)
                <li>Large programmable blocks
                <li>Memory elements (RAM, ROM)
                <li>Large IO Pool
            </ul>
	 </tr>
	 <tr>
        <td>It can process single or specific process only
        <td>Can process multiple task parallel (concurrent processing)
	</tr>
    <tr>
        <td>Process time is high
        <td>
            <ul>
                <li>FPGA is target for multiprocessing
                <li>Less non-recurring engineering (NRE) cost
                <li>Fast design period (time to market)
			</ul>
	</tr>
    <tr>
        <td>DSP and algorithms can't be implemented on it.
        <td>
            <ul>
                <li>We can design and verify Microcontrollers in FPGA
                <li>Design Flexibility
			</ul>
		</td>
	</tr>
</table>


## ⁠A.4. FPGA and ASIC

- Comparison:
	- FPGA benefits vs ASICs:
        - Design time: 9 month design cycle vs 2-3 years
        - Cost: No $3-5M upfront (NRE) cost, no $100-500K mask set cost
        - Volume products: High initial ASIC cost recovered only in very high volume
    - Due to Moore's law, many AISC design requirements now met by FPGAs
        - Example, current FPGA architecture and also with SoC, MPSoC architecture
        can give the ddiverse processing capability, I/O and resource as once
        provided by ASIC
    - FPGA are more power consuming than ASIC
    - The unit price while manufacturing is higher for FPGA
    - ASIC are more application specific so can perform better in temrs of
        processing any logic in it

## ⁠A.5. History of FPGA

- 1960: First MOSFET
- 1961: First Communication IC
- 1962: First TTL
- 1963: First CMOS
- 1985: First FPGA
- 1987: A test with 600,000 reprogrammable gates was created
- 1992: Casselman was successful and a patent related to the system was issued.
- 1993: Actel was serving about 18% of market shares
- 2013: 77% of FPGA market was represented by Alterra, Actel and Xilinx
- 2014: Microsoft began using FPGAs to accelerate Bling
- 2018: Started deploying FPGAs across other data center workloads
- 2019: The largest share in the market for FPGAs was Asia Pacific
- 2020: The worldwide Market for FPGA was valued at 5132.4 million USD
- 2021: The global FPGA market site was valued at USD 5721.1 million
- 2022: FPGA is used by many industries.

## ⁠A.6. FPGA Application

- Application of FPGA are targeted at different areas and industries
    - Medical Electronics
    - Security Systems
    - Wireless Communications
    - Distributed Monetary Systems
    - Aerospace & Defense
    - Scientific Instruments
    - FPGA Application
    - Video & Image Processing
---

# ⁠B. General FPGA Building Blocks

## ⁠B.1. LUT
## ⁠B.2. FF
### ⁠B.2.a. CLB: Configurable  Logic Blocks

![CLB](attachments/clb.png)
- It consists of LUT (Look Up Table), FF and multiplexers.
- LUT implement the logic gates or combinational logical gates or combinational logic functions.
- MUX is used for switching or selection logic.
- D FF are used for storing the output of LUT.
- The basic building block of the FPGA is the LUT based function generator.
- The number of LUT vary from 4 to 6 or more.
- The current architecture of FPGAs can consists of multiple thousands of CLBs.

# ⁠C. DSP Slices

- DSP slices are dedicated blocks for arithmetic and logic operations in recent FPGAs.

![DSP Block](attachments/dsp-block.png)
- A DSP block in FPGA implements specific arithmetic operations (addition and multiplication) that cna reduce the need to build equivalent logic from general purpose CLB or adaptive logic module (ALM)s.
- Some FPGAs support floating-point arithmetic in DSP blocks in addition to integer/fixed-point arithmetic.
- The following figure illustrates a simplified three-input DSP block consisting of a multiplier (x) and an adder (+):
![DSP Operation](attachments/dsp-operation.png)

## ⁠C.1. BRAM: Block RAM

- Block RAM modules can be used to store data
- They can form buffers, large LUTs or shift registers.

## ⁠C.2. IO Blocks

- Used to interface the logic blocks and routing architecture to the external components.
- Used to connect external input or output devices or component with in-side logic.
- The I/O pad and the surrounding logic circuit form as an I/O Cell.
- The I/O cells consume large portion of FPGA device area.

## ⁠C.3. Programmable Interconnects
- It incterconnects CLB and I/O blocks ot complete the user defined logical design or operation.
- It consists of multiplexers, pass transistors and tri-state buffers (for I/O both operation).
- Pass transistors and multiplexers are used in a logic cluster to connect the logical elements.
## ⁠C.4. Clock Management

- Artix-7 FPGA does not have an internal clock generating circuitry.
    - Therefore the user should feed a clock signal to the FPGA
- Some input/output pins are capable fo receiving such clock signals
- As the clock signal is fed to the FPGA, it can be processed by the clock management tile (CMT) and dsitributed through FPGA.

## ⁠C.5. Recent Advancement on FPGA building blocks

- The new architecture of FPGA devices also consist of application specific logical components inside FPGA.
- like component for video encoding/decoding, DSP processing, AI processing, etc.

## ⁠C.6. Specific to Xilinx FPGA
- Building Blocks in Xilinx Artix-7 FPGA:
- The Xilinx Artix-7 XC7A35T FPGA is basically composed of nine different components:
    - input/output blocks
    - interconnect resources
    - block RAM
    - DSP slices
    - CMB
    - XADC block
        - An analog signal can be processed by a digital system after being sampled and quantized.
        - Module performing these operations is called as the analog to digital converter (ADC). Since recent advances in digital systems rqeuire processing analog signals, the Artix-7 FPGA has a dedicated block called as XADC.
    - high speed serial I/O transreceivers
        - HSSIO are specialized circuity to transfer and receive serial data.
    - PCIe interface
        - PCIe is a high speed serial connection bus standard
---

# ⁠D. FPGA Architectures

- The FPGA device could have different types of logical components or building blocks.
- Based on targeted application or also based on vendor, the architecture could have different arrangement of those logical building blocks inside a single FPGA device or chip.
- In general, every vendor or every application oriented FPGA device consists of common building blocks.
    - ![General Architecture of Xilinx](attachments/example-architecture-xilinx.png)

## ⁠D.1. Examples

### ⁠D.1.a. Open Sourced FPGA Architecture
- The architecture is released by OpenFPGA Project.
- Example
    - ![OpenFPGA](attachments/open-sourced-fpga-arch.png)

## ⁠D.2. based in SRAM Programming Technology

- Employs SRAM cells to control pass transistors and/or transmission gates
- SRAM cells control the configuration of logic block as well.
- Volatile
    - Needs an external storage
    - Needs a power-on configuration mechanism
    - In-circuit re-programmable
- Lesser configuraiton time
- Occupies relativey larger area.
- Xilinx and Altera FPGA Architecture are mainly based in SRAM Technology.
    - ![SRAM Architecture](attachments/sram-arch.png)
## ⁠D.3. Anti-Fuse Programmable Technology

- Very low ON resistance (faster implementation of circuits)
- Limited size of anti-fuse elements; Interconnects occupy relatively lesser area
    - Offset: larger transistors required for programming
- One Time Programmable
    - Cannot be re-programmed
        - design changes are not possible
    - Retain configuration after power off
- Actel based FPGA used to have anti-fuse architecture.

# ⁠E. General Architecture
![architecture](attachments/2026-08-09-16-50-27.png)
## ⁠E.1. Vendor Specific Architeture
# ⁠F. Recent Developments in FPGA Architecture

## ⁠F.1. FPGA Architecture - SoC Architecture

- Zynq Architecture
    - Complete ARM-based processing system
        - Application Processor Unit (APU)
            - Dual ARM Cortex-A9 processors
            - Caches and support blocks
        - Fully integrated memory controllers
        - I/O peripherals
    - Tightly integrated programmble logic
        - Used to extend the processing sytem
        - Scalable density and performance
    - Flexible array of I/O
        - Wide range of external multi-standard I/O
        - High-performance integrated serial transreceivers
        - Analog-to-digital converter inputs
    - Figure
        - ![Zynq Architecture](attachments/zynq-arch.png)
    
## ⁠F.2. Intel (Altera) FPGA Architecture

- Intel (Altera) FPGA consists of following logical componenets in the FPAGs:
    - Logic Modules, also called adaptive logic modules (ALMs).
    - Programming Routing Switch
    - DSP Block
    - Memory Block
    - ![Altera Architecture](attachments/altera-arch.png)
- Intel Stratix 10 Soc FPGA - Cloud based FPGA
    - Programmable Fabric
    - High Speed Interfaces - PCIe
    - High speed and bandwidth memory - HBM

## ⁠F.3. Microchip FPGA Architecture

- Microchip as ILGOOa, PolarFire and Smartfusin family of FPGA.
- PolarFire FPGAs are cost optimized, high performance devices implemented in 28 nm processor technology.
- PolarFire FPGA consists of:
    - Programmable Fabric with 100,000 to 500,000 Logic Elements (LEs)
    - Features 12.7 Gbit transceivers.

# ⁠G. FPGA Architecture targeted for cloud and edge platforms

- Based on recent developments and application of FPGAs, we can define its architectures based on edge and cloud based applications.
    - Edge based Architecture
        - The FPGA architecture targeted for edge platform which runs independently, can perform a set of task and may/may not communicate with master or server device for updates
        - General Features of Edge based Architecture:
            - FPGA device must be able to run on low power and low resource configuration in compared to cloud targeted FPGA architeccture
            - Must be able to perform the edge processing task for Computer Vision, ML Specific Task.
            - The cost of edge based FPGA devices is significantly lower than the cloud based FPGAs.
    - Cloud based Architectures
        - Cloud based FPGA architectures are targeted for larger workload or processing operation.
        - For complex problems and low latency requirement CPU or Host platform get limitation at such scenario the cloud based architecture FPGA used to offload or accelerate those CPU limiting task.
        - General Features of Cloud based Architecture:
            - Cloud based FPGA consists of very high amount of logical resources and can consume large amount of power
            - Have to work with other host processor or server processing archtiectures
            - The physical form factor of edge based FPGA are smaller than the FPGA targeted for cloud applications.
            - The cost of cloud based FPGAs are high due to its processing capabilities.
            - Mainly, the FPGA targeted for cloud are linked/interfaced with host processor via PCIe interface.
            - In general, it also consists of high bandwidth memory (HBM).
            - Mainly used for high performance computing applications like - Genome Sequencing, Solving large AI or math problems, hundreds of camera data processing for smart city applications etc.
        - ![General Architectures - AMD (Xilinx) and Intel (Alterra)](attachments/cloud-based-arch.png)
        - [Intel Stratix 10 SoC FPGA](#intel-altera-fpga-architecture) is also a cloud based FPGA.
        - General Usage of Cloud based FPGAs
            - Baidu Cloud Xilinx
            - Huwaei Cloud Xilinx
            - Microsoft Azure Intel
            - Amazon AWS Xilinx
            - TACC Intel
            - Alibaba Cloud Xilinx and Intel
            - Tencent Cloud Xilinx
            - OVH Intel
            - Nimbix Xilinx

# ⁠H. FPGA Design Flow - Summary

- The FPGA Design flow consists of steps or phases from inception of any design, writing HDL code, synthesis, implementation, bit file generation to programming in hardware
- Simulation based design verification apporach is followed along with synthesis to verify the functional behavior of the algorithm or written HDL code.
    - Simulation approach allows to faster debug and correction of any unexpected behavior of the algorithm.
- Flowchart
    - ![Design Flow](attachments/design-flow.png)

- Steps in short:
    1. High Level Description of Logic Design (HDL)
    2. Simulate the Design
    3. Synthesize into a Netlist
        - boolean logic representation
    4. Implementation: Target FPGA Device
        - Translate
        - Mapping
        - Routing
    5. Bit File for FPGA

## ⁠H.1. Steps

### ⁠H.1.a. Architecture Design

- Analysis of the project requirements
- problem decomposition and functional simulation
- Writing algorithm, flowchart and pseucode can be performed

### ⁠H.1.b. HDL Design entry

- Described architecture in a formal hardware description language (HDL).
- Here VHDL or verilog based implementation will be done.

### ⁠H.1.c. Test Environment Design.

- Writing of test environments and behavioral models.

### ⁠H.1.d. Behavioral Simualtion

- Checks HDL correctness by comparing output of the HDL model and the behavioral model.
- For simulation the testbench have to be written up based on the top module
    - Simulation step generates the waveform based on defined stimulus or condition in the testbench
    - By analyzing the waveform we can verify the functional behavior of the written code or top module.
    - After simulation confirms the function we can proceed for below step else not we have to correct the top module logic and redo the simulation.

### ⁠H.1.e. Synthesis

- Conversion of an HDL description to a netlist by a synthesizer.
- Figure
    - ![Synthesis Process](attachments/synthesis-levels.png)

### ⁠H.1.f. Implementation
- A synthesizer-generated netlist is mapped onto particular device's internal structure (place and route or layout) which allocates hardware resources (such as logic cells and connection wires).
- then the data are written as bitstream.
- Figure
    - ![Placement and Routing Stages](attachments/placement-routing.png)
### ⁠H.1.g. Timing Analysis

- Checks whether the implemented design satisfies timing constraints

## ⁠H.2. Xilinx VIVADO Tool Flow

- Vivado Tool Flow on FPGA Design
    - Xilinx VIVADO Tool follows the generic FPGA design flow for designing for FPGAs.
    - VIVADO has some specialized steps in each stage.
    - For example, implementation consists of:
        - optimization of design
        - power optimization
        - place design
        - physical optimization
        - route design
        - timing analysis, etc.
    - Pictorial Representation:
        - ![Vivado Processes](attachments/vivado-toolchain.png)
        - ![Vivado Tool Flow](attachments/vivado-toolflow.png)
