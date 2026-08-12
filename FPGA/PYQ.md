# ⁠A. Chapter 1 FPGA Fundamentals (5 hours)

## ⁠A.1. FPGA overview and its evolution

## ⁠A.2. General FPGA Building Blocks: LUT, FF, DSP, BRAM, I/O, clocks etc

### ⁠A.2.a. Questions

#### ⁠A.2.a.I. What are the building blocks of FPGA? Explain in detail \[6\]

#### ⁠A.2.a.II. Explain about DSP, BRAM and clock resources of it in detail \[3\]

##### ⁠A.2.a.II.i. DSP Slices (Dedicated Arithmetic Blocks)

![DSP Block](attachments/dsp-block.png)

- Because arithmetic-heavy operations (multiply, multiply-accumulate, filtering) are extremely inefficient to build purely from LUTs, modern FPGAs embed **hardened DSP blocks** directly in the fabric.
- **Xilinx DSP48E2** (UltraScale/UltraScale+ family, successor to DSP48E1 in 7-Series, DSP48A/A1 in Spartan-6, and the original DSP48 in Virtex-4) is a representative example. A single DSP48E2 slice contains:
    - A **27-bit pre-adder**
    - A **27×18-bit two's-complement multiplier**
    - A **48-bit accumulator / ALU** (supporting add, subtract, and bitwise logic operations, including a 96-bit-wide XOR mode useful for CRC/GF(2ⁿ) arithmetic)
    - Multiple internal **pipeline registers** (on the A/B inputs, after the multiplier, and after the ALU) that can be individually enabled for higher clock speed
    - **Cascade ports** (ACIN/ACOUT, BCIN/BCOUT, PCIN/PCOUT) that chain adjacent DSP slices together without going back through general routing, enabling efficient wide multipliers, systolic-array MAC chains, and long FIR filters
- Intel/Altera calls the equivalent resource a **"variable-precision DSP block"**; functionality is broadly similar (hardened multiply/add/accumulate) though the exact bit-widths and modes differ by vendor.
- Some FPGA families (e.g., certain Intel Agilex/Stratix and AMD Versal devices) support **hardened floating-point arithmetic** in the DSP fabric in addition to fixed/integer point, which is valuable for HPC and some ML workloads.
- DSP slices are typically arranged in **columns**, physically adjacent to BRAM columns, so that data can move between memory and arithmetic with minimal routing delay, important for high-throughput filters and matrix operations.
- Using DSP slices instead of LUT-built arithmetic gives higher clock frequency, lower latency, and dramatically lower LUT utilization for the same function.

![DSP Operation](attachments/dsp-operation.png)

##### ⁠A.2.a.II.ii. Block RAM (BRAM)

- **BRAM** is dedicated, hardened on-chip memory distributed throughout the fabric (again, usually column-aligned near DSP columns for locality).
- Typical Xilinx BRAM is organized as **36 Kb dual-port tiles**, each splittable into two independent **18 Kb** blocks, giving designers flexibility between one large memory or two smaller/independent ones.
- Configurable as **true dual-port** RAM (two independent read/write ports, different clocks allowed), single-port RAM, simple dual-port, ROM, or **FIFO** (with built-in FIFO control logic in many families).
- Many BRAM implementations include built-in **ECC (Error Correcting Code)** support, useful for high-reliability designs (aerospace, datacenter, automotive).
- Larger UltraScale+ devices additionally offer **UltraRAM (URAM)**, a denser, larger-block memory (e.g., 4K × 72-bit per block) intended to replace external SRAM for packet buffers, lookup/coefficient tables, and other large on-chip storage needs, without consuming the (comparatively scarcer) BRAM budget.
- Beyond BRAM/URAM, small amounts of memory can also be built from LUTs configured as **distributed RAM**, useful for small, fast, register-file-like storage where a full BRAM tile would be wasteful.
- Typical uses: FIFOs and elastic buffers, packet/line buffers for video or networking, coefficient/lookup tables, cache-like structures for soft processors, and shift-register-style delay lines.

##### ⁠A.2.a.II.iii. Clock Resources

Reliable, low-skew, low-jitter clock distribution is critical since virtually every FPGA resource (FF, BRAM, DSP, transceiver) is clocked.

- **Global Clock Inputs**: dedicated pins (often paired with the I/O banks) specifically designed to bring an external clock signal onto the chip with minimal jitter.
- Some FPGAs (e.g., Xilinx Artix-7) have **no internal clock oscillator**, the user must supply an external reference clock on one of these clock-capable pins; the FPGA does not generate its own base timing reference from scratch.
- **Clock Management Tile (CMT)**: a hardened block (one or more per device, arranged in columns near the I/O banks) that processes an incoming reference clock. Each CMT typically contains:
    - **MMCM (Mixed-Mode Clock Manager)**: the more feature-rich clocking resource: frequency synthesis (multiply/divide to generate new frequencies), fine-grained phase shifting, jitter filtering/attenuation, duty-cycle correction, and in some families dynamic reconfiguration of clock parameters at runtime.
    - **PLL (Phase-Locked Loop)**: a functional subset of the MMCM (frequency synthesis and phase alignment, less flexible than the MMCM), often used when phase-shift/dynamic reconfiguration isn't needed and a leaner resource suffices.
- **Global Clock Buffers (BUFG and variants: BUFGCTRL, BUFGCE, BUFGCE_DIV, BUFH, BUFR, BUFIO, BUFMR, BUFG_GT for transceiver clocks, etc.)**: distribute the CMT's output clocks across the die on a dedicated **low-skew clock tree**, separate from general-purpose routing, so every flip-flop in a clock domain sees the edge at (nearly) the same time.
    - **BUFGCE** in particular provides glitch-free clock gating (a synchronized clock-enable), which is a standard technique for reducing dynamic power by stopping the clock tree in unused regions.
- Clocking resources are organized hierarchically by **clock region** (a fixed grid of CLB rows/I/O banks), with global clocks reaching the whole device and regional/local buffers (BUFR, BUFIO, BUFH) serving smaller areas with even lower latency for things like I/O-adjacent high-speed logic.
- **Design guidance**: use the vendor's **Clocking Wizard** IP to configure MMCM/PLL settings correctly, minimize the number of distinct clock domains, avoid cascading clock buffers unnecessarily (adds skew/delay), and use proper clock-domain-crossing (CDC) synchronizers/FIFOs whenever signals cross between asynchronous clock domains.

##### ⁠A.2.a.II.iv. LUT (Look-Up Table)

- The core combinational-logic primitive. A **k-input LUT** contains $2^k$ SRAM configuration cells, each holding one row of a truth table, so a k-input LUT can implement **any** Boolean function of up to k variables simply by loading the right bit pattern.
- **4-input LUTs** were the traditional mainstream size for many years; modern high-performance families (e.g., Xilinx 7-Series and later) use **6-input LUTs**, often with two outputs (an LUT6 can be split into two LUT5s sharing inputs), improving logic density and reducing the number of levels of logic (and hence delay) needed for wide functions.
- LUTs can also be repurposed as small **distributed RAM** or **shift registers (SRL)** when not needed purely for logic, a technique the tools use automatically or that a designer can infer explicitly.

##### ⁠A.2.a.II.v. Flip-Flops (FF)

- Provide the sequential storage element paired with each LUT, capturing the LUT's combinational output on a clock edge to build synchronous logic (registers, counters, state machines, pipelines).
- Typically D-type flip-flops, with configurable set/reset polarity, clock-enable, and sometimes selectable as latches.
- Every slice contains multiple LUT+FF pairs, wired through local multiplexers so a designer can freely mix combinational-only, sequential-only, or fully-pipelined logic within one slice.

##### ⁠A.2.a.II.vi. Configurable Logic Block (CLB): Composition

- A CLB packages together: **LUTs**, **flip-flops**, **multiplexers** (for local signal steering/selection), and dedicated **carry-chain logic** (for fast ripple-carry addition/subtraction/comparison).
- LUTs implement the combinational logic function; MUXes select/route between LUT outputs, carry logic, or wide-function combining paths; FFs register the result.
- The number of LUTs per CLB/slice varies by vendor and family, commonly 4, 6, or more inputs per LUT, with 8 LUTs and 16 FFs being a typical modern Xilinx CLB (2 slices × 4 LUTs each, in some families).
- A modern mid-to-large FPGA can contain many tens of thousands to well over a million CLB-equivalent logic cells.

---

## ⁠A.3. FPGA Architectures: general architecture, vendor specific architecture summary

### ⁠A.3.a. Questions

#### ⁠A.3.a.I. Create the general architecture of FPGA \[3\]

![General Architecture of Xilinx](attachments/example-architecture-xilinx.png)

At a high level, every FPGA, regardless of vendor, is built from three classes of resources arranged in a regular, repeating grid (an **"island-style"** layout):

1. **Configurable/Logic Blocks** (CLBs in Xilinx terms, Logic Array Blocks in Intel terms): implement combinational and sequential logic.
2. **Programmable Interconnect**: wires and switches that route signals between blocks.
3. **I/O Blocks**: interface the fabric to the outside world.

```txt
        IOB   IOB   IOB   IOB
       ┌───┬─────┬─────┬─────┬───┐
  IOB  │CLB│ CLB │ CLB │ CLB │IOB│
       ├───┼─────┼─────┼─────┼───┤
  IOB  │CLB│ CLB │ CLB │ CLB │IOB│    <- CLBs are "islands"
       ├───┼─────┼─────┼─────┼───┤       surrounded by a
  IOB  │CLB│ CLB │ CLB │ CLB │IOB│       "sea" of routing
       └───┴─────┴─────┴─────┴───┘
        IOB   IOB   IOB   IOB
```

##### ⁠A.3.a.I.i. Logic Blocks (CLBs / LABs / ALMs)

- The CLB is the fundamental logic-building unit. Internally it contains **LUTs**, **flip-flops**, and **multiplexers**, connected through a small **local routing matrix**.
- CLBs are grouped in **slices** (Xilinx), e.g., a Virtex/UltraScale CLB contains multiple slices, each with several 6-input LUTs, associated flip-flops, and fast carry-chain logic for efficient arithmetic.
- **Granularity** of a logic block can be classified as:
    - **Fine-grained**: small primitives like a single NAND/AND/OR/NOT gate (found in some older/academic architectures).
    - **Medium-grained**: LUT/MUX-based or small RAM/ROM-based blocks (the mainstream commercial approach).
    - **Coarse-grained**: larger fixed function units such as floating-point blocks or embedded processor cores.

![CLB](attachments/clb.png)

##### ⁠A.3.a.I.ii. Switch Matrix / Connection & Switch Boxes

- Each CLB sits next to a **switch matrix** (switch box) that connects it into the **general routing fabric**.
- **Connection boxes** attach a logic block's inputs/outputs to nearby routing tracks; **switch boxes** connect horizontal and vertical routing tracks to each other so a signal can turn corners and travel across the die.
- Routing tracks come in different lengths, short "local" segments for nearby connections and long "longlines" that span most of the device for wide/global signals.
- Routing/interconnect typically consumes the **majority of the chip's die area** (on the order of 80–90% in many academic architecture studies), which is why routing-aware placement and routing algorithms matter so much in the design-tool flow.

##### ⁠A.3.a.I.iii. I/O Blocks (IOBs)

- Sit at the periphery of the fabric (and increasingly inside high-speed I/O columns) and translate between the FPGA's internal logic levels and external voltage/signalling standards.
- Contain input and output buffers, often with edge-triggered flip-flops in the I/O path for fast, well-timed data transfer to/from the pin.
- Configurable for many single-ended (LVCMOS, LVTTL) and differential (LVDS, etc.) I/O standards, with programmable drive strength, slew rate, and on-chip termination.
- I/O blocks and their support circuitry occupy a large fraction of overall device area, especially on smaller devices.

##### ⁠A.3.a.I.iv. Configuration Interface

- Every FPGA needs a way to load its **bitstream** (the file that sets every SRAM configuration cell that defines the LUT contents, routing switches, and I/O settings).
- Configuration interfaces are typically **serial** (e.g., JTAG, SPI-based configuration from flash) or **parallel** (SelectMAP-style), depending on device family and required configuration speed.
- On **SRAM-based** FPGAs, configuration is volatile, it must be reloaded from an external non-volatile source (flash, EEPROM, or a host processor) every power-up.

---

## ⁠A.4. Recent developments in FPGA Architecture: heterogeneous architectures

## ⁠A.5. FPGA Architecture targeted for cloud and edge platforms

## ⁠A.6. FPGA Design Flow - summary

### ⁠A.6.a. Questions

#### ⁠A.6.a.I. Explain about FPGA design flow. \[4\]

![Design Flow](attachments/design-flow.png)

##### ⁠A.6.a.I.i. I.1. Overview

The FPGA design flow takes a design from an initial concept through HDL coding, verification, synthesis, and implementation, ending in a bitstream that configures physical hardware.

**High-level steps:**

1. **High-level description** of the logic design (architecture/algorithm definition)
2. **HDL design entry** (VHDL/Verilog)
3. **Simulate the design** (functional/behavioral verification)
4. **Synthesize** into a netlist (Boolean logic representation, technology-mapped to the target FPGA's primitives)
5. **Implementation**: translate → map → place → route, targeting the specific FPGA device
6. **Timing analysis**: verify the implemented design meets its clock constraints
7. **Generate the bitstream** and program the FPGA

**Simulation-driven verification** (running alongside synthesis/implementation, not just at the start) is standard practice: it lets designers catch functional bugs early, much cheaper to fix in simulation than after synthesis or on hardware, by comparing the simulated HDL behavior against an expected/reference behavioral model.

##### ⁠A.6.a.I.ii. I.2. Detailed Steps

###### ⁠A.6.a.I.ii.١. I.2.a. Architecture Design

- Analyze project requirements and constraints (performance, area, power, interfaces).
- Decompose the problem into functional blocks; define interfaces between them.
- Capture the intended behavior with algorithms, flowcharts, or pseudocode before committing to RTL.

###### ⁠A.6.a.I.ii.٢. HDL Design Entry

- Translate the architecture into a formal **Hardware Description Language**, **VHDL** or **Verilog** (or increasingly, **SystemVerilog**, or **High-Level Synthesis (HLS)** from C/C++ for some flows).
- This is the **RTL (Register-Transfer Level)** description of the design.

###### ⁠A.6.a.I.ii.٣. Test Environment (Testbench) Design

- Develop testbenches and behavioral/reference models independent of the RTL implementation, used to apply stimulus and check correctness.
- A good testbench should be reusable across simulation, and ideally also usable to check post-synthesis/post-implementation netlists (gate-level simulation).

###### ⁠A.6.a.I.ii.٤. Behavioral (Functional) Simulation

- Runs the HDL model against the testbench and compares its output to the expected/reference behavior.
- The testbench is generally written around the **top module** of the design; simulation produces a **waveform** based on the defined stimulus/conditions.
- The designer inspects the waveform to verify correct functional behavior.
- If simulation reveals incorrect behavior, the designer corrects the RTL and re-simulates, this loop repeats until functional correctness is confirmed **before** proceeding to synthesis (fixing bugs later in the flow is far more costly).

###### ⁠A.6.a.I.ii.٥. Synthesis

- A **synthesis tool** converts the HDL description into a **gate-level netlist**, mapping the design's logic to the specific primitives available on the target FPGA (LUTs, FFs, DSP slices, BRAM, carry chains, etc.).
- Synthesis also performs logic optimization (e.g., inferring DSP slices from multiply/MAC patterns, inferring BRAM/distributed RAM from memory-style code, resource sharing) to make efficient use of the target device's hard blocks.

![Synthesis Process](attachments/synthesis-levels.png)

###### ⁠A.6.a.I.ii.٦. Implementation

- The synthesized netlist is mapped onto the **particular target device's physical structure**:
    - **Translate**: merge the netlist with design constraints (timing, placement, I/O) into a unified design database.
    - **Map**: pack logic into device-specific primitives (e.g., grouping LUTs/FFs into physical slices).
    - **Place**: assign each mapped primitive to a specific physical location on the die.
    - **Route**: configure the programmable interconnect (switch boxes, connection boxes) to realize all required signal connections between placed elements.
- This step allocates the actual hardware resources (logic cells, connection wires) needed to realize the design, and the resulting configuration data is written out as the **bitstream**.

![Placement and Routing Stages](attachments/placement-routing.png)

###### ⁠A.6.a.I.ii.٧. Timing Analysis

- **Static Timing Analysis (STA)** checks whether the implemented (placed-and-routed) design meets all specified timing constraints: setup/hold time margins on every register-to-register path, I/O timing, and clock-domain-crossing constraints.
- If timing is not met, the design typically needs to be re-optimized (pipelining, floorplanning/placement constraints, reducing logic levels, or lowering the target clock frequency) and re-implemented.

---

---

# ⁠B. Chapter 2 FPGA logical components, architecture and interfaces (3 hours)

## ⁠B.1. Logical Interconnection and Routing architectures in FPGA

### ⁠B.1.a. Questions

#### ⁠B.1.a.I. Write about different routing architectures in FPGA \[4\]

## ⁠B.2. AXI Interface Bus protocol

### ⁠B.2.a. Questions

#### ⁠B.2.a.I. What is AXI Bus Protocol \[2\]

#### ⁠B.2.a.II. Write about it and its types \[3\]

## ⁠B.3. High speed Interfaces and usage of those interfaces

## ⁠B.4. High speed bus protocols in FPGA : USB, PCIe, Ethernet, MIPI etc

## ⁠B.5. Embedded SoC/MPSoC architectures detail and interfaces

### ⁠B.5.a. Questions

#### ⁠B.5.a.I. Write about SoC/MPSoC FPGA Architectures and some high speed interfacaes in those. \[4\]

---

# ⁠C. Chapter 3 Digital design, simulation and verification with RTL (VHDL/Verilog) (6 hours)

## ⁠C.1. Verilog HDL overview- syntax, semantics, datatypes, primitives, etc

## ⁠C.2. Behavioral versus structural design modeling

### ⁠C.2.a. Questions

#### ⁠C.2.a.I. What are different modeling techniques in Verilog \[5\]

#### ⁠C.2.a.II. Write on behavioral and structural modeling techniques with example in Verilog. \[5\]

## ⁠C.3. Logical component design with RTL/Verilog and performing simulation: combinational/sequential blocks, FSM, ALU, processor and DSP algorithms

## ⁠C.4. Verification approaches on RTL

## ⁠C.5. RTL design methodologies for FPGA and VLSI Design

## ⁠C.6. Design optimization on RTL for FPGA and VLSI Design

## ⁠C.7. Verilog Programming

### ⁠C.7.a. Questions

#### ⁠C.7.a.I. Write a Verilog code for 4-bit subtractor and also write testbench for it. \[6\]

#### ⁠C.7.a.II. Write a Verilog code for 8-bit ALU by including 8 common arithmetic & logical operation

_Acc to Me and DragonLord, there will be 8 total opcodes, not 8+8_

---

# ⁠D. Chapter 4 Advance RTL design approaches for FPGA (4 hours)

## ⁠D.1. Advance RTL design for latency critical and resource critical designs- overview

## ⁠D.2. Resource, latency, clock and power optimization methodologies

### ⁠D.2.a. Questions

#### ⁠D.2.a.I. Explain about latency and throughput optimization Verilog RTL with examples. \[7\]

#### ⁠D.2.a.II. Explain about different optimization techniques in RTL, targeting to latency, throughput and power optimization \[7\]

##### ⁠D.2.a.II.i. Latency

![Removing Pipeline registers](../attachments/latency-opt.png)

- **Goal**: minimize the time from a specific input arriving to its corresponding output being available — i.e., pass data from input to output with **minimal internal processing delay**.
- A low-latency design generally uses **parallelism** (doing more work per cycle, in combinational logic) instead of relying on deep pipelining, and looks to **remove unnecessary pipeline register stages** wherever timing allows.
- **Pipelined version** (from Section C.2) — latency: **3 cycles**, because each of the three stages is separated by a register.
- **Fully combinational / minimal-register version** — latency: **1 cycle** (with a single output register):

```verilog
reg [31:0] x1, x2;
reg [63:0] pow1;

// Process 1: x1 <= x
always @(x) begin
    x1 <= x;
end

always @(x1) begin
    x2   <= x1;
    pow1 <= x1 * x1;
end

always @(*) begin
    pow <= pow1 * x2;
end
```

- Here, all the multiplication logic is combinational (`always @(x)` / `always @(x1)` / `always @(*)` — note this style, using blocking-style continuous evaluation without a clock edge, is meant to illustrate a purely combinational datapath collapsing three pipeline stages into one; in synthesizable RTL this combinational chain would typically be captured with `assign` statements or a single combinational `always @(*)` block feeding one output register, rather than several separate always blocks).
- The trade-off versus the pipelined version: **latency drops from 3 cycles to effectively 1**, but the **combinational path is now much longer** (three levels of multiplication happen in a single clock period instead of being spread across three), which **reduces the maximum achievable clock frequency** — so "low latency" in cycles doesn't automatically mean low latency in absolute time if the achievable clock speed drops enough.
- This illustrates the fundamental **latency-vs-throughput-vs-clock-speed trade-off**: you can shrink cycle count (latency in cycles) by removing pipeline registers, but only at the cost of a longer combinational path per cycle, which either lowers Fmax or, if Fmax must be held constant, may fail timing altogether.

##### ⁠D.2.a.II.ii. Throughput

![Throughput](../attachments/throughput-opt.png)

- **Goal**: minimize the time elapsed **between successive input reads**, even if the time to fully process any single input (its own latency) is comparatively unimportant.
- The key idea is that **data item n+1 can begin being read/processed while data item n is still being processed** further down the pipeline — this is the essence of pipelining for throughput.
- **Un-pipelined / iterative implementation** (low throughput):

```verilog
reg [3:0] count;

always @(posedge CLK) begin
    if (start) begin
        count <= 4'b0010; // count <- 2
        pow   <= x;
    end else if (!stop) begin
        count <= count - 1;
        pow   <= pow * x;
    end
end

assign stop_out = (count == 0) ? 1'b1 : 1'b0;
```

- This computes `x^n` iteratively over multiple cycles per input, reusing the same multiplier repeatedly.
- Because a new `x` cannot be accepted until the current computation's `count` reaches zero, throughput is low relative to the number of cycles needed per result.
- Illustrative figures: **throughput ≈ 10.7 bits/cycle** (32-bit result over ~3 cycles of _this stage of the pipeline_), **latency = 3 cycles** — treat these as illustrative teaching numbers for the specific bit-widths/cycle counts assumed in the example, not universal constants.

- **Pipelined implementation** (high throughput):

```verilog
reg [31:0] x1, x2;
reg [63:0] pow1;

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        x1   <= 0;
        x2   <= 0;
        pow1 <= 0;
        pow  <= 0;
    end else begin
        // stage 1
        x1 <= x;

        // stage 2
        x2   <= x1;
        pow1 <= x1 * x1;

        // stage 3
        pow <= pow1 * x2;
    end
end
```

- By splitting the computation into three pipeline **stages**, each with its own register layer, a **new input `x` can be accepted every single clock cycle**, because each stage is only ever working on one "slice" of the overall pipeline at a time.
- Illustrative figures: **throughput = 32 bits/cycle** (a full new 32-bit result's worth of _work_ advances every cycle), **latency = 3 cycles** (any individual input still takes 3 cycles to fully emerge as output — latency is unchanged by pipelining, only throughput improves).
- This is the classic trade-off: pipelining **does not reduce the latency of any single item**, but it dramatically increases the **rate** at which new items can be started and finished, because the hardware is kept busy on multiple items simultaneously rather than sitting idle waiting for one item to finish.

##### ⁠D.2.a.II.iii. Power

Power optimization is, to a significant degree, an **implication** of the area/resource optimizations described above: fewer active logic resources and shorter/less-toggling combinational paths generally translate directly into lower **dynamic power** (which scales with switching activity, capacitance, and clock frequency)

- Power usage is primarily driven by the **amount of FPGA area/logical resources** the design actually uses and switches — see Section D.5.
- For **lower power**, favor **algorithmic optimization** or **pipelining** over full unrolled parallelism where possible — a fully parallel/unrolled implementation typically maximizes area (and thus static + dynamic power) in exchange for maximum throughput; a more modestly pipelined or resource-shared (Section D.2) implementation trades some throughput for meaningfully lower power.
- Power consumption also depends on the **FPGA architecture itself** and precisely **how** logical resources are used (e.g., using a hardened DSP slice for a multiply is typically both faster _and_ lower-power than the equivalent function built from general LUT fabric).
- The **synthesis/implementation tool's placement decisions** also affect power — where different operational blocks end up physically placed on the die affects routing length/capacitance and can be influenced by power-oriented synthesis/implementation strategies (again, e.g., Vivado's power-optimization strategies, which specifically target reduced switching activity and clock-gating opportunities).

## ⁠D.3. Considerations/approaches for Implementing RTL design in a real-world scenario

---

---

# ⁠E. Chapter 5 VLSI Design and Verification (6 hours)

## ⁠E.1. VLSI Design, IC technology, CAD tools on VLSI- overview

## ⁠E.2. VLSI Design flow, design styles and verification methodologies

### ⁠E.2.a. Questions

#### ⁠E.2.a.I. Explain about VLSI design flow in detail \[6\]

#### ⁠E.2.a.II. Overview

- The VLSI design flow is the structured, staged process that converts an idea/specification into a **fabricated, packaged, tested chip**.
- It is commonly split into two broad halves:
    - **Front-End Design** (logical): everything from specification through RTL design, functional verification, and logic synthesis; concerned purely with _what the chip does_, independent of physical implementation.
    - **Back-End (Physical) Design**: floorplanning, placement, routing, static timing analysis, and physical sign-off; concerned with _how the logical design is actually realized in silicon_.
- The handoff point between front-end and back-end is the **gate-level netlist** produced by logic synthesis.

![Design Flowchart](./attachments/design-flow.png)

##### ⁠E.2.a.II.i. Design Methodology: Top-Down vs. Bottom-Up

There are two basic approaches to structuring a digital VLSI design:

1. **Top-Down Design Methodology**
    - Define the **top-level block** first, and identify its major sub-blocks.
    - Recursively **divide each sub-block** into smaller sub-blocks, continuing until reaching **leaf cells** (basic gates/cells that won't be further decomposed).
    - Advantage: keeps the overall architecture and interfaces clear from the start; well suited to large, novel designs.
2. **Bottom-Up Design Methodology**
    - Start by **identifying the building blocks already available** (standard cells, IP, previously-designed modules).
    - **Build progressively larger cells** by combining these available blocks.
    - Continue combining until the **top-level design** is assembled.
    - Advantage: maximizes reuse of proven, characterized blocks; reduces design and verification effort when a strong library already exists.

- In practice, real projects generally use a **combination of both**: a top-down architectural decomposition guided by, and reconciled against, a bottom-up inventory of available reusable blocks.

![Design Flow Simplified](../attachments/simplified-design-flow.png)

##### ⁠E.2.a.II.ii. Detailed Steps of the VLSI Design Flow

The canonical VLSI design flow is typically described as an **eight-step process**: system specification, architectural design, functional/behavioral design, logic design, circuit design, physical design, fabrication, and packaging/testing. Each is detailed below.

###### ⁠E.2.a.II.ii.١. System Specification

- The **first step** of the design process: laying down the specification of the system as a whole.
- This is a **high-level representation** of the system, considering:
    - **Performance** and **functionality**
    - **Physical dimensions** (die size/area budget)
    - **Design technique** to be used
    - **Technological and economical viability**
- **Outcome**: a specification covering **size, speed, power, and functionality**, along with the **basic architecture** of the VLSI system, this document is what every later stage is validated against.

###### ⁠E.2.a.II.ii.٢. Architectural Design

- Using the system specification, the **design engineer/architect** works out the chip's architecture: major subsystems, datapaths, memory organization, and how they interconnect.
- This step produces an initial **C-model or high-level RTL model** and an initial **floorplan** sketch (a rough estimate of how major blocks will be arranged on the die).

###### ⁠E.2.a.II.ii.٣. Functional (Behavioral) Design

- The system's **main functional units** and their **interconnect requirements** are identified.
- The **area, power, and other parameters** of each functional unit are **estimated** at this stage (before detailed implementation), to catch infeasible designs early.
- The key goal is to specify each unit's **behavior** in terms of its **inputs, outputs, and timing**.
- **Outcome**: usually a **timing diagram** describing how each unit's signals behave over time.
- This early behavioral information feeds forward into later phases, generally **improving the overall design process and reducing the complexity** of subsequent stages (since major architectural mistakes are caught before detailed logic/circuit work begins).

###### ⁠E.2.a.II.ii.٤. Logic Design

- Converts the functional/behavioral description into actual **logic**: Boolean expressions, word widths, register allocation, arithmetic and logic operations.
- This is where **register-transfer level (RTL)** descriptions (in VHDL/Verilog) are typically produced and verified: the RTL is what represents the functional design as testable, synthesizable logic.

###### ⁠E.2.a.II.ii.٥. Circuit Design

- **Purpose**: develop a **circuit representation** based on the logic design.
- The Boolean expressions from the logic design are converted into a circuit representation, this conversion takes into account the **speed and power requirements** of the original specification, since the same Boolean function can be implemented with circuits of very different speed/power/area trade-offs.
- This step designs the actual **gates, transistors, and interconnections** needed.
- **Outcome**: a **netlist**, a structural description of all components and their connections.
- **Circuit simulation** is used at this stage to verify the **correctness and timing** of each component before committing to physical implementation.

###### ⁠E.2.a.II.ii.٦. Physical Design

- Takes the circuit (post logic-synthesis) and converts it into an actual **layout**, the geometric mask patterns that will be fabricated.
- Physical design itself has several well-known sub-steps (industry-standard terminology, expanding on the original notes):
    - **Floorplanning**: deciding the rough physical placement of major blocks on the die, and planning power/ground distribution.
    - **Placement**: assigning exact physical locations to every standard cell/gate.
    - **Clock Tree Synthesis (CTS)**: building a low-skew clock distribution network to every sequential element.
    - **Routing**: creating the actual metal-layer wiring that realizes every net in the netlist.
    - **Parasitic extraction**: extracting the real resistance/capacitance of the routed wires for accurate post-layout timing analysis.
    - **Physical verification**: **DRC** (Design Rule Check, verifies the layout obeys the foundry's manufacturing rules), **LVS** (Layout-Versus-Schematic, verifies the layout is electrically identical to the source netlist/schematic; "LVS clean" means they match), and **ERC** (Electrical Rule Check, checks for electrical issues like floating nodes or shorted supplies).

###### ⁠E.2.a.II.ii.٧. Fabrication (and Tape-Out)

- After physical verification, the design is ready for fabrication.
- **Tape-out** is the milestone marking the handoff of the final, signed-off design (as a **GDSII** layout file) to the semiconductor foundry, historically named for the era when designs were physically delivered on magnetic tape.
- **Fabrication** itself is a multi-step process at the foundry, including: **wafer growth, epitaxial growth, masking, etching, doping, deposition, and diffusion** of various materials onto the wafer, with a separate photomask used at each masking step. Each fabricated wafer yields hundreds of individual chips ("dies").

###### ⁠E.2.a.II.ii.٨. Packaging, Testing, and Debugging

- Individual dies are diced from the wafer, then **packaged** into their final form factor (e.g., BGA, QFN).
- **Automated Test Equipment (ATE)** and techniques such as **burn-in testing** are used to verify functionality and performance and to screen out defective parts before the chip ships.

#### ⁠E.2.a.III. Explain about verification methodologies in VLSI \[3\]

##### ⁠E.2.a.III.i. Why Verification Matters

- Verification is widely reported to consume roughly **70% of total VLSI design time** in modern projects, catching functional bugs before an expensive, slow silicon fabrication run is far cheaper than discovering them after tape-out, where a bug may require a costly re-spin.
- Verification spans **multiple levels** of the design (behavioral, RTL, gate-level, transistor-level) and **multiple aspects** of correctness (functional behavior _and_ timing).

##### ⁠E.2.a.III.ii. Verification Methods (Broad Categories)

- **Functional Verification**
    - **Simulation**: the dominant method: exercise the design model against test stimuli and check the resulting outputs against expected behavior.
- **Emulation**
    - Runs the design on dedicated emulation hardware (often FPGA-based) at speeds far higher than software simulation, enabling much larger test workloads (e.g., booting an OS on the design) before silicon exists.
- **Formal Verification**
    - **Equivalence Checking**: mathematically proves that two representations of a design (e.g., RTL vs. gate-level netlist, or netlist vs. netlist after an ECO) are functionally identical, without needing to simulate any test vectors.
    - **Model Checking**: mathematically proves (or disproves) that a design satisfies a given formal property, by exhaustively (or via bounded exploration) analyzing the design's state space.
- **Semiformal Verification**
    - **Assertion-Based Methods**: embeds formal-style assertions (e.g., SystemVerilog Assertions/SVA) directly into the design or testbench, which are then checked continuously _during_ simulation, blending the exhaustiveness of formal reasoning (for the specific property asserted) with the practicality of simulation-based flows.

##### ⁠E.2.a.III.iii. Verification Techniques (By Abstraction Level)

- **Simulation** (functional and timing), applied at multiple abstraction levels:
    - **Behavioral**: validates high-level algorithmic/architectural correctness.
    - **RTL**: validates the register-transfer-level implementation (the most common level for day-to-day functional verification).
    - **Gate-level** (both pre-layout and post-layout): validates the synthesized netlist, with post-layout simulation additionally using extracted parasitic delays for realistic timing.
    - **Switch-level**: models the circuit as a network of switches (transistors as ideal switches), a middle ground between logic-level and full transistor-level simulation.
    - **Transistor-level**: the most detailed and computationally expensive, using full SPICE-style transistor models; used for critical circuits (e.g., custom memory bit-cells, I/O, analog blocks) where gate-level abstraction isn't accurate enough.
- **Model-Based Formal Verification** (functional):
    - **Binary Decision Diagrams (BDDs)**: a canonical, compact data structure for representing and manipulating Boolean functions, underlying many formal equivalence-checking and model-checking algorithms.
    - **Equivalence checking** and **model checking** (as in C.2), here specifically as _techniques_ built on formal mathematical models.
- **Static and Dynamic Timing Analysis** (timing):
    - **Static Timing Analysis (STA)**: analyzes every timing path in the design without requiring simulation vectors, checking setup/hold margins exhaustively across the whole design; the standard sign-off timing methodology in modern VLSI flows.
    - **Dynamic Timing Analysis**: timing verification performed via simulation with real (or extracted) delays, useful for scenarios STA handles less naturally (e.g., certain asynchronous or multi-cycle timing exceptions).

##### ⁠E.2.a.III.iv. Verification Approaches on RTL (Detailed)

1. **Simulation**
    - Verifying functionality via **testbench-based simulation**: different **test cases** or **input scenarios** are applied to the design, and the resulting output is analyzed against expected behavior.
    - This remains the workhorse of RTL verification because it is flexible, scriptable, and can be targeted precisely at the scenarios of interest.
2. **Structural Analysis**
    - Structural analysis examines the **structure of the RTL code itself**, separately from its simulated behavior.
    - In addition to checking conformance with the language reference manual (LRM) via tool analysis, structural analysis looks for **code patterns known to cause problems**, such as:
        - Unreachable/terminal states in state machines
        - Mismatched or incomplete signal assignments
        - Problematic reset and clocking structures (e.g., mixed synchronous/asynchronous resets, multiple clock edges on one signal)
    - The value of structural analysis is that it lets these classes of issues be caught **before** (or without needing) full simulation, finding them "for free" via static code analysis is much faster than waiting to hit them through directed or random simulation, and some structural issues (like certain reset/CDC problems) may not even reliably manifest in simulation at all.
3. **Formal Methods**
    - Formal methods **mathematically prove** that a design behaves as expected, as opposed to simulation, which can only demonstrate correctness for the specific stimuli actually applied.
    - The specific mathematical techniques vary, and include **bounded model checking** (proving a property holds for all reachable states within some bounded number of clock cycles) and **mathematical induction** (proving a property holds for all cycles by proving a base case and an inductive step), both are ways of achieving exhaustive coverage of a specific property without the state-space explosion of brute-force exhaustive simulation.
4. **Timing Analysis**
    - Most timing analysis in modern flows is performed using dedicated **STA tools**, driven and controlled via **timing constraints** (SDC-format constraints specifying clock periods, I/O delays, false paths, multicycle paths, etc.) supplied by the design team.

##### ⁠E.2.a.III.v. VLSI Verification Methodology: Languages and Frameworks

| Language / Methodology                       | Description                                                                                                                                                                                                                                                                                                                                                                                                           |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SystemVerilog (SV)**                       | Provides an extensive set of verification-focused language features on top of standard Verilog, including **object-oriented programming**, **constrained-random testing** (automatically generating varied, legal stimulus), and **functional coverage** (measuring which design/test scenarios have actually been exercised). SV is the dominant verification language in industry today.                            |
| **Universal Verification Methodology (UVM)** | A **standardized methodology** (an SV class-library framework) built on top of SystemVerilog, providing a common structure, testbenches, drivers, monitors, scoreboards, sequences that enables **scalable, reusable verification environments** across projects and teams, promoting verification efficiency and consistency across an organization.                                                                 |
| **VHDL**                                     | **VHSIC Hardware Description Language** (VHSIC = Very High Speed Integrated Circuit). Used for both design entry and verification in the VLSI industry, offering strong native support for hardware modeling, simulation, and synthesis.                                                                                                                                                                              |
| **e (Specman)**                              | A verification language originally developed by **Yoav Hollander** for the **Specman** verification tool. Offers powerful capabilities such as **constraint-driven random testing** and **transaction-level modeling**. The company behind it (originally Verisity) was later **acquired by Cadence Design Systems**, after which the `e` language and Specman continued as part of Cadence's verification portfolio. |
| **C/C++ and Python**                         | Frequently used to build custom **verification frameworks, testbench infrastructure, and scripting/automation** around a simulation or formal flow: e.g., driving regression suites, post-processing coverage data, or building reference/golden models in a faster, more flexible language than HDL.                                                                                                                 |

## ⁠E.3. CMOS Circuit and Logic Design

### ⁠E.3.a. Questions

#### ⁠E.3.a.I. Explain about CMOS circuit design \[3\]

##### ⁠E.3.a.I.i. CMOS Overview

- **CMOS** = **C**omplementary **M**etal-**O**xide **S**emiconductor.
- A semiconductor technology used to build the transistors found in the vast majority of today's computer microchips.
- In CMOS technology, **both** transistor types, **NMOS** and **PMOS**, are used together in a **complementary** arrangement, forming a switching structure that provides effective, low-power electrical control of the output.

![Example of NOT gate in CMOS](../attachments/inverter-cmos.png)

##### ⁠E.3.a.I.ii. CMOS Working Principle

- Both **N-type** and **P-type** MOSFETs are used together to implement logic functions.
- The defining characteristic of CMOS: **the same input signal that turns ON a transistor of one type simultaneously turns OFF the transistor of the other type.**
- This complementary switching behavior is what allows CMOS logic gates to be built from **simple switches alone**, with **no need for a separate pull-up resistor** (unlike NMOS-only logic, which requires a pull-up device that draws current even in steady state, see A.5).

##### ⁠E.3.a.I.iii. CMOS Characteristics

- **Low static power dissipation, high noise immunity.**
    - In steady state, for any valid logic input, **one of the two series-connected transistors (NMOS/PMOS) is always OFF**, meaning essentially no DC current path exists from VDD to ground, this is the fundamental reason CMOS static power is so low.
    - Meaningful power is drawn only **during switching** (charging/discharging capacitive loads) and from a small **short-circuit current** that briefly flows while both transistors are partially ON during a transition, see the AC/dynamic analysis in Section E.4.
- **Does not generate significant waste heat**, as compared to other logic families like **TTL or NMOS logic**, which typically draw some **standing (static) current** even when not actively switching state.
- These characteristics enable **integrating logic functions at very high density** on an integrated circuit, because static power per gate is so low, vastly more gates can be packed onto a chip within a fixed total power budget. This is the central reason **CMOS has become the dominant technology used in VLSI chips.**
- The term **"MOS"** refers to the physical structure of a MOSFET: an electrode forming a **metal gate**, positioned on top of an **oxide insulator**, which sits on the **semiconductor** substrate.
    - Historically, the gate material was a metal such as **aluminum**; for several decades the industry instead used **polysilicon** gates (more compatible with high-temperature CMOS process steps).
    - With the introduction of **high-k dielectric materials** in advanced process nodes, true **metal gates made a comeback**, replacing polysilicon in modern high-performance CMOS processes (the "high-k metal gate," or HKMG, transition).

##### ⁠E.3.a.I.iv. Advantages of CMOS

- Operates from a **single power supply** (VDD).
- **Simple gate structures.**
- **High input impedance**: CMOS gate inputs draw negligible DC current, simplifying fan-out and driving requirements.
- **Low power consumption** when held in a static (non-switching) state.
- **Negligible static power dissipation** (see D.3).
- **High fan-out capability.**
- **TTL compatibility** (with appropriate level translation where needed).
- **Good temperature stability.**
- **Good noise immunity.**
- **Compact** circuit implementation relative to some alternative logic families.
- Generally **straightforward, well-supported design flow** (mature tools and cell libraries).
- **Mechanically robust.**
- **Large logic swing**: output voltage swings essentially rail-to-rail, from ~0 V to ~VDD, giving good noise margins (see Section E.3).

##### ⁠E.3.a.I.v. Applications of CMOS

CMOS technology is used across the large majority of modern digital IC design, including:

- **Computer memories and CPUs**
- **Microprocessor design**
- **Flash memory chip design**
- **ASIC design** more broadly

##### ⁠E.3.a.I.vi. Disadvantages of CMOS

- **Cost increases** as the number of processing steps increases, though this can often be mitigated through process optimization and volume.
- **Packing density** is lower compared to NMOS-only logic (which needs only one transistor per logic input rather than a complementary pair).
- **Electrostatic discharge (ESD) sensitivity**: MOS chips must be protected from static-charge buildup (e.g., by shorting leads during handling); without protection, static discharge through the leads can damage the chip. This is generally addressed by including **on-chip ESD protection circuitry**.
- **Uses two transistors instead of one** to build a basic inverter (one NMOS + one PMOS, versus a single NMOS plus a passive/active load in NMOS-only logic): meaning CMOS logic gates generally consume **more silicon area** per gate than the NMOS-only equivalent, for the density benefit traded away against much lower static power.

##### ⁠E.3.a.I.vii. NMOS Transistor: Working Principle

- When a **positive voltage** (logic HIGH) is applied to the **gate terminal**, relative to the source, of an NMOS transistor:
    - It creates an **electric field** that **attracts electrons** toward the interface between the gate oxide and the semiconductor substrate, forming a conductive n-type channel.
    - Once the gate-source voltage exceeds the **threshold voltage** $V_{th}$, the **N-channel MOSFET turns ON**, allowing current to flow between drain and source.

##### ⁠E.3.a.I.viii. PMOS Transistor: Working Principle

- When a **negative voltage** (logic LOW), relative to the source, is applied to the **gate terminal** of a PMOS transistor:
    - It creates an **electric field** that **repels holes** away from the gate-oxide/substrate interface, forming a conductive p-type channel.
    - Once the gate-source voltage is more negative than (i.e., the source-gate voltage exceeds) the threshold $V_{th}$, the **P-channel MOSFET turns ON**.
- In a CMOS inverter, the complementary switching behavior of NMOS and PMOS (D.2, D.7, D.8) is exactly what produces correct inverting logic, see Section E.

## ⁠E.4. Design and analysis of the CMOS inverter

### ⁠E.4.a. Questions

#### ⁠E.4.a.I. Detail about CMOS inverter design and its analysis \[7\]

#### ⁠E.4.a.II. Create CMOS inverter and explain about it \[3\]

##### ⁠E.4.a.II.i. Circuit Structure

![NMOS/PMOS Inverter](../attachments/nmos-inverter.png)

- The CMOS inverter is the **simplest and most fundamental CMOS logic gate**, and serves as the building block for understanding every other CMOS gate.
- The circuit consists of **one PMOS and one NMOS transistor**, connected as follows:
    - Both transistor **gates are tied together** and driven by the single input, **A**.
    - The **PMOS transistor** is connected between **VDD** (supply) and the output node, it acts as the **pull-up** device.
    - The **NMOS transistor** is connected between the output node and **VSS/ground**, it acts as the **pull-down** device.
    - The shared drain connection of both transistors is the circuit's **output, Y**.

##### ⁠E.4.a.II.ii. Working (Switching Behavior)

- **When A is HIGH (≈ VDD)**:
    - The **PMOS** transistor's gate-source voltage is such that it is turned **OFF** (behaves as an open circuit).
    - The **NMOS** transistor is turned **ON**.
    - The output node is pulled down through the ON NMOS to **VSS (ground)** → **Y = LOW (0)**.
- **When A is LOW (≈ 0 V)**:
    - The **NMOS** transistor is turned **OFF**.
    - The **PMOS** transistor is turned **ON**.
    - The output node is pulled up through the ON PMOS to **VDD** → **Y = HIGH (VDD)**.
- In **both** valid steady-state cases, exactly **one** of the two transistors is ON and the other is OFF, this is precisely the complementary-switching property described in Section D.2/D.3, and it is why the CMOS inverter draws negligible static current in either steady state.

**Truth Table**:

![Truth Table](../attachments/truth-table-inverter.png)

| A (Input)       | Y (Output)      |
| --------------- | --------------- |
| 0 (LOW)         | 1 (HIGH, ≈ VDD) |
| 1 (HIGH, ≈ VDD) | 0 (LOW)         |

##### ⁠E.4.a.II.iii. DC (Static) Analysis: Voltage Transfer Characteristic (VTC)

![DC analysis](../attachments/input-output-voltage.png)

- **DC analysis** answers the question: "given a _constant_ input voltage V$\large_\text{in}$, what is the resulting _constant_ output voltage $_{out}$?", i.e., it characterizes the inverter's steady-state behavior, ignoring switching transients (which are instead covered by AC analysis, Section E.4).
- **At the extremes**:
    - When $V_{in} = 0$ → NMOS OFF, PMOS ON → $V_{out} = V_{DD}$.
    - When $V_{in} = V_{DD}$ → NMOS ON, PMOS OFF → $V_{out} = 0$.
- **In between** these extremes, both transistors can be partially or fully ON simultaneously, and $V_{out}$ depends on the actual transistor currents, not just their ON/OFF state.
- By **Kirchhoff's Current Law (KCL)**, since the NMOS and PMOS are in series between VDD and ground, the same current must flow through both, so at every point on the DC transfer curve, the circuit must settle such that:
  $$I_{DSn} = |I_{DSp}|$$
    - Setting the NMOS drain current expression equal to the magnitude of the PMOS drain current expression (using the standard MOSFET current equations for whichever region, cutoff, linear/triode, or saturation, each transistor is operating in at that particular $V_{in}$) gives the equations that can be solved analytically for $V_{out}$ as a function of $V_{in}$.
    - A **graphical solution**: plotting $I_{DSn}$ vs. $V_{out}$ and $I_{DSp}$ vs. $V_{out}$ (transformed onto the same axes) for a given $V_{in}$, and finding their intersection, gives excellent intuition for how the operating point moves as $V_{in}$ sweeps from 0 to VDD, even without working through the full algebra.

##### ⁠E.4.a.II.iv. Voltage Transfer Characteristics (VTC)

![Characteristics](../attachments/transfer-characteristics-inverter.png)

- The **Voltage Transfer Characteristic (VTC)** is exactly this DC transfer curve, $V_{out}$ plotted against $V_{in}$, for the CMOS inverter (or any logic gate).
- The VTC is commonly divided into **five distinct regions**, based on which region (cutoff, linear/triode, or saturation) each transistor is operating in as $V_{in}$ sweeps from 0 to VDD:
    1. **Region A** ($V_{in}$ near 0): NMOS is in **cutoff** (OFF), PMOS is in the **linear/triode** region → output is pulled fully to $V_{out} = V_{DD}$.
    2. **Region B**: NMOS enters **saturation**, PMOS remains in the **linear** region → $V_{out}$ begins to fall, but is still relatively high.
    3. **Region C** (around the midpoint): **Both** transistors are in **saturation** simultaneously, this is the steep, high-gain transition region where the output switches rapidly from HIGH to LOW for a small change in input.
    4. **Region D**: NMOS enters the **linear** region, PMOS is in **saturation** → $V_{out}$ continues falling toward 0.
    5. **Region E** ($V_{in}$ near VDD): NMOS is in the **linear** region, PMOS is in **cutoff** (OFF) → output is pulled fully to $V_{out} = 0$.
- **Key VTC-derived design metrics**:
    - **$V\_{OH}$**: the nominal output HIGH voltage (ideally $V_{DD}$).
    - **$V\_{OL}$**: the nominal output LOW voltage (ideally 0 V).
    - **$V\_{IL}$**: the maximum input voltage still reliably interpreted as a logic LOW (defined as the input voltage where the VTC slope $dV_{out}/dV_{in} = -1$, on the high-output side).
    - **$V_{IH}$**: the minimum input voltage still reliably interpreted as a logic HIGH (the input voltage where the VTC slope $dV_{out}/dV_{in} = -1$, on the low-output side).
    - **Switching threshold, $V_M$**: the point on the VTC where $V_{out} = V_{in}$ (the curve crosses the unity line); at this exact point, both transistors are in saturation and, by design, $I_{Dn} = I_{Dp}$. For a "balanced" inverter, sizing the PMOS wider than the NMOS (to compensate for hole mobility being lower than electron mobility) places $V_M$ near $V_{DD}/2$, giving symmetric noise margins and switching behavior.
    - **Noise Margins**: quantify how much noise/voltage error the inverter's input can tolerate before the output is affected:
        - $$NM_H = V_{OH} - V_{IH}$$ (high-side noise margin)
        - $$NM_L = V_{IL} - V_{OL}$$ (low-side noise margin)
        - Larger noise margins mean better **noise immunity**: a key reason (alongside low static power) that CMOS is favored for dense, robust digital design.
    - **Voltage gain** in the transition region (the maximum magnitude of $dV_{out}/dV_{in}$): a steeper transition (higher gain) means a sharper, more well-defined switching point and better signal regeneration between cascaded stages.

##### ⁠E.4.a.II.v. AC (Dynamic / Transient / Switching) Analysis

![Transient Analysis Diagram](../attachments/transient-analysis.png)

- **DC analysis** (Section E.3) tells us $V_{out}$ for a **constant** $V_{in}$.
- **AC analysis** tells us $V_{out}(t)$ given a **time-varying** $V_{in}(t)$: this generally requires solving differential equations describing how the output node's parasitic/load capacitance charges and discharges through the transistors' time-varying resistance.
- The input is usually modeled as a **step** or a **ramp** transitioning between 0 and $V_{DD}$ (or vice versa), approximating a realistic logic transition.
- **AC analysis** is also referred to, interchangeably, as **transient analysis**, **switching analysis**, or **dynamic analysis**: all describing the same underlying study of time-domain switching behavior.
- The **switching characteristic**: $V_{out}(t)$ given $V_{in}(t)$: of a logic gate directly determines **how fast the gate can operate**, i.e., its maximum usable clock frequency in a larger design.
- The **switching speed** of a gate is fundamentally measured by the **time required to charge and discharge its capacitive load**: every gate output drives some combination of the next stage's gate capacitance and the interconnect (wire) capacitance, and the RC-like charge/discharge time of that load, through the driving transistor's ON resistance, sets the propagation delay.
    - Two standard delay metrics: **$t_{PHL}$** (propagation delay for a HIGH-to-LOW output transition, measured between the 50% points of input and output) and **$t_{PLH}$** (propagation delay for a LOW-to-HIGH output transition).
    - **Short-circuit power**: during the brief period of a transition when $V_{in}$ is near the switching region (Region C of the VTC, Section E.3), **both** NMOS and PMOS can be simultaneously partially ON, creating a brief direct current path from VDD to ground, this "short-circuit current" is a real (though typically smaller than switching/dynamic) component of total CMOS power consumption, distinct from the capacitive charge/discharge power.

## ⁠E.5. Analog/ Mixed Mode VLSI design concepts

---

---

# ⁠F. Yo kaa ko ho?

## ⁠F.1. Koi vannu

### ⁠F.1.a. Questions

1. Explain about Fixed point and floating point arithmetic \[3\]
