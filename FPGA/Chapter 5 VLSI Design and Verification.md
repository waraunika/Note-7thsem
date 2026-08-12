# VLSI Design Introduction

VLSI:

- very large-scale integration
- is the current level of computer microchip miniaturization
- refers to microchips containing hundreds of thousands of transistor.
- LSI means microchips containing thousands of transistors.

Use of VLSI:

- used in creating many chips and circuits on a single mini chip of silicon

## VLSI Design

VLSI Design Cycle starts with a formal specification of a VLSI chip.

## IC Technology

### Integration

- SSI
    - Small Scale Integration
    - 1960
    - Less than 10 logic gates per chip
    - Logic Gaates (AND/OR/NAND/NOR)
- MSI
    - Medium Scale Integration
    - 1966
    - 10 to 100 gates per chip
    - Flip flops, adders, counters, multiplexers
- LSI
    - Large Scale Integration
    - 1970
    - 100 to 10,000 gates per chip
    - Small memory chips, PLDs
- VLSI
    - Very Large Scale Integration
    - 1980
    - 10,000 to 100,000 gates per chip
    - Microprocessors with cache memory, floating point arithmetic units, RAM, ROM, complex PLDs

### Types of Transistors

```mermaid
flowchart LR
A[Transistor Types] --> B[BJT]
A --> C[FET]
B --> D[NPN]
B --> E[PNP]

C --> F[JFET]
C --> G[MOSFET]
F --> H[Depletion<br>Mode]
G --> I[Depletion<br>Mode]
G --> J[Enhancement<br>Mode]
H --> K[N-Channel]
H --> L[P-Channel]
I --> M[N-Channel]
I --> N[P-Channel]
J --> O[N-Channel]
J --> P[P-Channel]
```

### CMOS Logic Circuit

<img src="./attachments/cmos-logic-circuit.png" style="max-width: 400px; width: 100%; height: auto;"></img>

## Processing Technology in VLSI

- Bipolar
    - TTL (Transistor to Transistor Logic)
    - ECL (Emitter Coupled Logic)
- MOS
    - NMOS
        - less masking steps,
        - denser,
        - less power
    - CMOS
        - low power consumption,
        - less fabricatiheaderon steps
- BiCMOS: Bipolar and CMOS (for high speed)
- Ga-As: Gallium Arsenide (for high speed)
- SOI: Silicon on Insulator (for high temperature applciation)

## CAD tools on VLSI

| CAD Tool            | OS/License  | Type                    | Function                      |
| ------------------- | ----------- | ----------------------- | ----------------------------- |
| Cadence EDA         | Licensed    | Analog and Mixed Signal | Complete CAD Flow             |
| Master Graphics EDA | Licensed    | ""                      | ""                            |
| Synopsys EDA        | ""          | ""                      | ""                            |
| Tanner EDA          | ""          | ""                      | ""                            |
| Alliance            | Open Source | Mixed Signal            | Logic to Layout"              |
| Electric CAD        | ""          | ""                      | ""                            |
| Magic               | ""          | ""                      | Circuit Layout                |
| SystemC             | ""          | Electronic System Level | Library for Digital Deisng    |
| myHDL               | ""          | ""                      | Hardware Description Language |

# VLSI Designing

## VLSI Design Flow

![Design Flowchart](attachments/design-flow.png)

### Four Levels of Design Representation

- Behavioral Representation
    - For functional blocks, FSM
    - ![Behavioral Representation](./attachments/behavioral-representation.png)
- Logic (Gate-Level) Representation
    - For logic Blocks, Gates
    - ![Logic Representation](attachments/logic-representation.png)
- Circuit (Transistor-Level) Representation
    - For Transistor Schematics
    - ![Circuit Representation](attachments/transistor-schematics.png)
- Layout Representation
    - For Physical Devices
    - ![Layout Representation](attachments/layout-representation.png)

### Design Design Flow

There are two basic types of digital design methodologies in VLSI flow

1. Top-Bottom design methodology
    - Define top-levle block and identify the sub-blocks
    - Divide sub-block until we come to leaf cells
2. Bottom-Up design Methodology
    - identify building block that are available for us
    - build a bigger cell using these block
    - continue building a cell until we build top level

### Design Flow Simplified

![As the name](attachments/simplified-design-flow.png)

### Detailing VLSI Design Flow

##### System Specification

- First step of design process is to lay down the specification of the system.
- High level representation of the system
- Factors considered:
    - Performance, Functionality
    - Physical Dimension
    - Desing Technique
    - Technological and Economical Viability
- The end results are specifications of
    - Size, Speed, Power and Functionality
    - Basic architecture of VLSI system

#### Functional Design

- Main functional units, Interconnect requirements of the system are identified
- The area, power and other parameters of each unit are estimated
- The key idea is to specify behavior, in terms of Input, Output, Timing of each unit
- The outcome of functionality design is usually timing diagram
- This information leads to improvement of the overall design process and reduction of complexity of the subsequent phases

#### Logic Design

- Design Logic, that is,
- Boolean expressions, word width, register allocation, etc.

#### Circuit Design

- The purpose of the circuit design is to develop a circuit representation based on the logic design.
- The Boolean expression can be converted into a circuit representation by taking into consideration the speed and power requirements of the original design.
- Design the circuit including gates, transistors, interconnections, etc.
- The outcome is called a netlist
- Circuit simulation is used to verify the correctness and timing of component.

#### Physical Design

- Given a circuit after logic synthesis, to convert it into a layout

### Agents in Designing

| Designer          | Tasks                                                                     | Tools                                                            |
| ----------------- | ------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| Architect         | Define overall chip, C/RTL model, initial floorplan                       | Text Editor, C Compiler                                          |
| Logic Designer    | Behavioral Simulation, Logic Simulation, Synthesis, Datapath Schematics   | RTL Simulator, Synthesis Tools, Timing Analyzer, Power Estimator |
| Circuit Designer  | Cell Libraries, Circuit Schematics, Circuit Simulation, Megacell Blocks   | Schematic Editor, Circuit Simulator Router                       |
| Physical Designer | Layout and Floorplan, Place and Route, Parasitics Extraction, DRC/LVS/ERC | Place/Rotue Tools, Physical Design and Evaluation Tools          |

## VLSI Design Styles

1. Full Custom
    - Each circuit element carefully "handcrafted"
    - Huge design effort
    - High design and NRE costs / low unit cost
    - high performance
    - typically used for high-volume applications

2. Application-Specific Integrated Circuit
    - constrained design using pre-designed (and sometimes pre-manufactured) components
    - Also called semi-custom design
    - CAD tools greatly reduce design effort
    - Low Design Cost / High NRE Cost / Medium Unit Cost

3. Programmable Logic (PLD, FPGA)
    - Pre-manufactured components with programmable interconnect
    - CAD tools greatly reduce design effort
    - Low Design Cost / Low NRE Cost / High Unit Cost
    - Lower Performance

4. System-on-Chip
    - Idea: Combine several large blocks
        - predesigned custom cores, e.g., microcontroller, intellectual property (IP)
        - ASIC logic for special-purpose hardware
        - programmable logic (PLD, FPGA)
        - analog
    - Open issues
        - keeping design cost low
        - verifying correctness of design

## VLSI Verification Methodologies

### Verification methods

- Functional Verification
    - Simulation
- Emulation
- Formal Verification
    - Equivalence Checking
    - Model Checking
- Semiformal Verification
    - Assertion Based Methods

### Verification Techniques

- Simulation (functional and timing)
    - Behavioral
    - RTL
    - Gate-level (pre-layout and post-layout)
    - Switch-level
    - Transistor-level
- Model Based Formal Verification (functional)
    - Binary Decision Diagrams
    - Equivalence checking
    - Model checking
- Static and Dynamic Timing Analysis (timing)

### Verification

# CMOS Circuit and Logic Design

# Design and analysis of CMOS inverter

# Analog/Mixed Mode VLSI design concepts
