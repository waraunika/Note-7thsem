# Chapter 4 — Advanced RTL Design Approaches for FPGA

---

# A. Advanced RTL Design for Latency-Critical and Resource-Critical Designs — Overview

When a design is either **latency-critical** (must produce results within a tight, predictable time budget) or **resource-critical** (must fit within a small/cheap FPGA), a set of disciplined engineering practices — beyond just "write correct RTL" — becomes necessary. The major considerations are:

1. **Detailed analysis of design requirements and specifications** to guide **FPGA tool and device selection**.
    - If there is a real possibility of future design upgrades, it's worth selecting an FPGA device with some **headroom** (spare LUTs, DSP, BRAM, I/O) beyond the current design's needs, so a later revision doesn't force a costly device change.
    - Conversely, if no upgrade path is anticipated, sizing tightly to the current design minimizes cost.
2. **Fit the smallest design into the smallest FPGA** (i.e., target the lowest-resource device that meets requirements) to minimize unit cost — a critical factor for high-volume production.
3. **Optimum utilization of FPGA resources**, achieved either through vendor-specific synthesis/implementation tool strategies (e.g., AMD Vivado's resource-oriented synthesis/implementation strategies) or through custom, hand-crafted resource-optimization techniques at the RTL level (Section C).
4. **Meeting timing closure on the lowest-resource FPGA** that's feasible for the design, rather than over-provisioning hardware just to make timing easier.
5. Selection of a **proper design/implementation methodology**.
    - Depending on the project's requirements, timeline, and budget, the appropriate methodology — hand-written **RTL**, **High-Level Synthesis (HLS)**, vendor **IP integration**, a **mixed** approach, or an **embedded/software-driven** methodology — must be chosen.
    - Each methodology carries its own design flow, development timeline, and achievable optimization ceiling: RTL typically gives the most control and best QoR (Quality of Results) at the cost of development time; HLS trades some QoR for much faster development; IP reuse is fastest but least flexible.
6. **Optimizing** the RTL, IP, HLS, or implementation settings specifically for the **targeted FPGA tool and device**, since optimization techniques and their payoff can differ meaningfully between vendors/families.
7. **Designing within the power-consumption budget** of the system.
    - Power consumption is fundamentally governed by **device-level** (process node, voltage) and **technology-level** (fabric architecture) factors that an RTL designer cannot change — but **RTL coding techniques** can still meaningfully prevent unnecessarily high power draw (Section C.3 and D.4).

---

# B. Resource, Latency, Clock, and Power Optimization Methodologies

RTL-level optimization can be approached at several distinct, related stages:

## B.1. Categories of Optimization

1. **Timing Optimization** — improving throughput, reducing latency, and/or reducing local datapath delay (the three concepts are related but distinct — see Section C.1 below).
2. **Area / Resource Optimization** — minimizing the number of logic blocks and memory blocks the design consumes.
3. **Power Utilization Optimization** — largely a _consequence_ of area/resource optimization: a smaller, less-toggling design generally draws less dynamic power, though clocking and switching-activity choices also matter independently (see Section D.4).

## B.2. General RTL Optimization Techniques

| Technique                | Description                                                                                                                                                                                                       |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Pipelining**           | Breaking a task into stages and processing multiple data items concurrently, one per stage, so a new input can be accepted every cycle even though any single input still takes multiple cycles to fully process. |
| **Concurrency**          | Splitting a computation into independent sub-parts and running them in parallel (in the same cycle), rather than pipelining them across cycles.                                                                   |
| **Component Allocation** | Deciding which specific physical logical blocks (e.g., which DSP slice, which BRAM) will perform which operations.                                                                                                |
| **Operator Binding**     | Mapping abstract operations (add, multiply, compare) onto the specific hardware resources available on the target device.                                                                                         |
| **Operator Scheduling**  | Assigning operations to specific clock cycles/pipeline stages, and merging operations into shared stages where possible.                                                                                          |

These five techniques are the standard toolbox used — whether manually in hand-written RTL or automatically by an HLS/synthesis tool — to hit a target throughput, latency, area, or power budget.

---

# C. Timing Optimization Techniques — Throughput, Latency, and Local Datapath Delay

> **Focus topic — Explain latency, throughput, and power optimization with examples**

## C.1. Three Key Timing Concepts

| Concept                  | Definition                                                                                 | Units                                                                                               |
| ------------------------ | ------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------- |
| **Throughput**           | The amount of data processed per unit time — i.e., how often a _new_ input can be accepted | bits/second, or (more usefully at RTL level) data-items per clock cycle                             |
| **Latency**              | The time elapsed between a specific data input and its corresponding processed output      | clock cycles (or seconds, given a known clock period)                                               |
| **Local datapath delay** | The propagation delay of combinational logic between two sequential elements (registers)   | nanoseconds — this is what actually limits the **maximum achievable clock frequency** of the design |

These three are related but **independently tunable**: a design can have high throughput with high latency (deep pipeline), or low latency with low throughput (fully combinational, unpipelined), and the local datapath delay (register-to-register logic depth) is really what determines how fast the clock can run in the first place, which in turn scales both throughput and latency together once clock period is fixed.

## C.2. Throughput Optimization — Loop Unrolling / Pipelining

![Throughput](attachments/throughput-opt.png)

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

## C.3. Latency Optimization — Removing Pipeline Registers

![Removing Pipeline registers](attachments/latency-opt.png)

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

## C.4. Logic Delay Optimization — Register Layers (Retiming for Delay Reduction)

![Local Datapaths](attachments/optimizing-datapath.png)

- **Local datapath**: the combinational logic sitting between two sequential elements (registers). The delay of the **slowest** local datapath in the whole design sets the **maximum clock frequency** the entire design can run at (this is the definition of the "critical path").
- Local datapath delay can be reduced by inserting **additional register layers**, breaking one long combinational chain into two or more shorter ones — at the cost of one additional cycle of latency per inserted register layer.

- **Unoptimized** (all three multiply-and-add terms computed in one combinational block before the register):

```verilog
reg [31:0] x1, x2;
always @(posedge clk) begin
    if (valid) begin
        x1 <= x;
        x2 <= x1;
        y  <= A * x + B * x1 + C * x2;
        // Assuming A, B, C are parameters or constants
    end
end
```

- Here, the datapath into `y` includes **three multiplications and two additions**, all happening combinationally in the same cycle before being captured by the register — this is a long critical path.

- **Optimized** (splitting the three products into their own register layer before summing):

```verilog
reg [31:0] x1, x2;
reg [31:0] prod1, prod2, prod3;

always @(posedge clk) begin
    if (valid) begin
        x1    <= x;
        x2    <= x1;
        prod1 <= A * x;
        prod2 <= B * x1;
        prod3 <= C * x2;
        y     <= prod1 + prod2 + prod3;
        // Assuming A, B, C are parameters or constants
    end
end
```

- By registering the three products (`prod1`, `prod2`, `prod3`) **before** summing them, each register-to-register path now contains only **one multiplication** (feeding into `prodN`) or **one three-input addition** (feeding into `y`) — a much shorter critical path than the original's chained multiply-then-add.
- This typically allows a **significantly higher maximum clock frequency**, at the cost of **one additional cycle of latency** through this section of the datapath.

## C.5. Logic Delay Optimization — Register Balancing

![Register Balancing](attachments/register-balancing.png)

- **Register balancing** redistributes the logic _between_ existing register stages so as to **minimize the worst-case delay between any pair of registers** — rather than adding new register layers (as in C.4), this technique rearranges where, within the existing pipeline structure, computation happens.
- **Unoptimized** (three separate input registers, then a single-cycle three-input add):

```verilog
reg [31:0] reg_a, reg_b, reg_c;

always @(posedge CLK) begin
    reg_a <= in_a;
    reg_b <= in_b;
    reg_c <= in_c;
    sum   <= reg_a + reg_b + reg_c;
end
```

- The critical path into `sum` is a **three-input addition** in a single cycle.

- **Optimized / balanced** (pre-combining two of the three inputs before the final add):

```verilog
reg [31:0] reg_ab_sum, reg_c;

always @(posedge CLK) begin
    reg_ab_sum <= in_a + in_b;
    reg_c      <= in_c;
    sum        <= reg_ab_sum + reg_c;
end
```

- By computing `in_a + in_b` **during the same register stage** that simply passes `in_c` through, the amount of logic in _each_ register-to-register hop becomes more evenly balanced — a two-input add per stage rather than one stage with a three-input add and another with none.
- This reduces the **worst-case single-stage delay**, which is what ultimately governs the maximum clock frequency, without necessarily changing the total register count or overall latency in cycles.
- **C.4 vs. C.5, in short**: register-layer insertion (C.4) _adds_ pipeline depth to shorten each stage; register balancing (C.5) _redistributes_ logic across the _existing_ stages to even out stage delays — both target the same underlying goal (shortening the worst-case local datapath delay) via different mechanisms.

---

# D. Area (Resource) Optimization

## D.1. What "Resource Requirement" Means

- **Resource requirement** = the amount of basic functional primitives needed to implement the described functionality.
- In **standard-cell ASICs**, the basic primitives are **standard cells** — simple logic gates, flip-flops, but also more complex arithmetic-logic functions or memory macros provided by the cell library.
- In **FPGAs**, the basic logic element is the **Basic Logic Element (BLE)** — typically a LUT (whose input count depends on the vendor/device family — see Chapter 1, Section C.1), a flip-flop, and a multiplexer. Beyond BLEs, FPGAs also provide **special-purpose hard resources**: memory blocks (BRAM/UltraRAM) and signal-processing elements (DSP slices/multipliers) — see Chapter 1, Sections C.4–C.5.

## D.2. Minimizing Area — Control-Based Logic Reuse

![Control based logic reuse](attachments/fsm-control-signals.png)

- Control-based logic reuse is conceptually the **opposite** of loop unrolling/pipelining (Section C.2): instead of duplicating hardware to run multiple operations in parallel (which improves throughput at the cost of area), a single piece of hardware is **reused sequentially**, controlled by an FSM or control signals, across multiple operations.
- **Pipelining requires additional data-storage resources and extra control/routing logic** to implement its parallel operation — that hardware cost is real and scales with the degree of parallelism.
- These same resources (e.g., a single multiplier) **can instead be reused** across multiple sequential operations, at the cost of **reduced throughput**, but with a substantial **reduction in area**. This is the natural area-vs-throughput trade-off that mirrors the latency-vs-throughput trade-off from Section C.

## D.3. Minimizing Area — Priority Encoders (Exploiting Mutual Exclusion)

![Priority Encoders](attachments/mutex-usage.png)

- Resource requirements can often be reduced by **exploiting mutual exclusion** between conditions, rather than assuming they must be checked in priority order.
- The `else if` chain should be used **only when a genuine priority encoder is actually required** — i.e., when the conditions are _not_ mutually exclusive and a defined priority between them matters. If the conditions **are** mutually exclusive (only one can ever be true at a time), using `else if` unnecessarily forces the synthesis tool to build **priority logic** (a chain of muxes/comparators evaluated in sequence), which costs more area and often more delay than necessary.

- **Priority-encoder style** (implies a priority even if not needed):

```verilog
always @(posedge CLK) begin
    if (ctrl[0]) begin
        output[0] <= input;
    end else if (ctrl[1]) begin
        output[1] <= input;
    end else if (ctrl[2]) begin
        output[2] <= input;
    end else if (ctrl[3]) begin
        output[3] <= input;
    end
end
```

- **Optimized (independent `if` statements)** — appropriate when `ctrl[0]`–`ctrl[3]` are known to be mutually exclusive (e.g., a one-hot control signal):

```verilog
always @(posedge CLK) begin
    if (ctrl[0]) begin
        output[0] <= input;
    end
    if (ctrl[1]) begin
        output[1] <= input;
    end
    if (ctrl[2]) begin
        output[2] <= input;
    end
    if (ctrl[3]) begin
        output[3] <= input;
    end
end
```

- Because each condition is now independent, the synthesis tool can implement each `output[N] <= input` as its own simple, parallel enable-controlled register, rather than building a chained priority structure — this generally reduces both area and logic depth **when the mutual-exclusion assumption genuinely holds**. If it does _not_ hold (multiple `ctrl` bits could be set simultaneously and a defined priority is actually needed for correctness), this optimization would silently change the design's behavior, so it must only be applied when mutual exclusivity is guaranteed by the design's control logic.

## D.4. Minimizing Area — Considering Technology (Hard-Block) Primitives

- Writing HDL with an appropriate, technology-aware coding style allows the synthesis tool to map the design onto **hardened primitives** (BRAM, DSP slices) far more efficiently than if the RTL is written in a way that's incompatible with those primitives' actual hardware capabilities.
- Synthesis tool vendors (e.g., AMD/Xilinx in UG901, the Vivado Synthesis user guide) publish specific **coding-style recommendations** precisely so designers can reliably target these hard blocks.
- Two of the most important hardware constraints to respect:
    - **Block RAM (BRAM)**: BRAM read/write ports are inherently **synchronous** — data is written synchronously, and (unlike distributed/LUT RAM) BRAM output is also registered/synchronous to a clock. Critically, per Xilinx's own synthesis coding guidelines, **sequential functionality inside hardened resources like block RAM and DSP blocks can only be set/reset _synchronously_, not asynchronously** — an HDL model containing an _asynchronous_ reset on a memory array, or a purely combinational (unregistered) read, generally **cannot** be mapped onto a BRAM primitive, and will instead force LUT-based (distributed RAM) or flip-flop-based implementation, which is far less area-efficient for anything beyond very small memories.
    - **DSP slices**: DSP slice outputs (and typically their internal pipeline stages) are similarly **synchronous only** — a DSP-mappable HDL description must use registered, clocked outputs rather than purely combinational arithmetic if it's meant to be absorbed into a DSP48-class hard block (see Chapter 1, Section C.4).
- This restriction must be taken into account when writing HDL that's intended to synthesize into BRAM or DSP resources — violating it doesn't cause a functional bug, but it _does_ cause the synthesis tool to fall back to a much less resource-efficient soft-logic implementation.

- **Normal (BRAM-incompatible) coding style**:

```verilog
reg [31:0] content [255:0];
// assuming 256 entries of 32-bit data

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (int i = 0; i < 256; i++) begin
            content[i] <= 32'h00000000;
            // Initialize content with all zeros
        end
    end else if (write) begin
        content[address] <= data_in;
    end
end

assign data_out = content[address];
```

- Two separate problems prevent this from mapping cleanly to a BRAM primitive:
    1. `assign data_out = content[address];` describes a **combinational (asynchronous) read** — BRAM read ports are synchronous, so this read path cannot come from a BRAM primitive as written.
    2. The **asynchronous reset** (`posedge reset` in the sensitivity list) that clears all 256 memory entries is not something real BRAM hardware supports — per-cell asynchronous reset isn't a feature of the memory primitive, and even attempting to reset every entry combinationally is impractical for a memory array of any real size.
- As a result, this description would be forced into **LUTs/flip-flops** (i.e., a large, inefficient register-based memory) rather than a dense, purpose-built BRAM tile.

- **Optimized (BRAM-friendly) coding style**:

```verilog
reg [31:0] content [255:0];
// assuming 256 entries of 32-bit data

always @(posedge clk) begin
    if (write) begin
        content[address] <= data_in;
    end

    data_out <= content[address];
end
```

- The write is synchronous (as before), and now the **read is also synchronous** (`data_out` is registered, updated on `posedge clk`), and there is **no asynchronous reset** on the memory array.
- This model can be implemented efficiently as **flip-flops, LUT RAM (distributed RAM), or dedicated Block RAM** — giving the synthesis tool the freedom to choose the most area-efficient implementation available on the target device, which for anything beyond a handful of entries will typically be BRAM.

## D.5. Power as a Consequence of Area/Resource Optimization

- Power optimization is, to a significant degree, an **implication** of the area/resource optimizations described above: fewer active logic resources and shorter/less-toggling combinational paths generally translate directly into lower **dynamic power** (which scales with switching activity, capacitance, and clock frequency) — see Section E.4 for a more complete treatment of power trade-offs in a real-world design context.

---

# E. Considerations and Approaches for Implementing RTL Design in Real-World Scenarios

In real projects, a handful of recurring problem scenarios drive most late-stage optimization work. Below are the common scenarios and the corresponding remediation approaches.

## E.1. Scenario: Design Over-Utilizes FPGA Resources

- **Option A** — Target a **larger-resource FPGA device** that comfortably fits the design (trading unit cost for design effort).
- **Option B** — **Optimize the design** with respect to resource usage, using the techniques from Section D (control-based reuse, avoiding unnecessary priority logic, technology-aware BRAM/DSP coding).
- Modern synthesis/implementation tools also provide built-in strategies to help automatically, up to a point — for example, **AMD Vivado** provides a range of **resource-oriented synthesis and implementation strategies** (e.g., area-optimization-focused strategies) that can be selected to guide the tool's own optimization decisions without hand-rewriting RTL.

## E.2. Scenario: Timing Does Not Meet (Timing Closure Fails)

- A missed timing requirement doesn't always cause an immediately visible functional problem in isolated testing, but it **can** cause real failures once the system is run continuously in the field — e.g., intermittent, data-dependent setup/hold violations that only manifest under certain data patterns or over long runtimes.
- The standard remediation path:
    - **Analyze** the failing timing paths and their specific delay contributors (using the timing report / timing analyzer in the vendor tool).
    - Apply the techniques from **Section C** — additional pipelining/register layers (C.4), register balancing (C.5), or restructuring the algorithm to expose more parallelism and shorten the critical combinational path.

## E.3. Scenario: Delay in Execution When Implemented on Target Hardware

- If observed real-hardware execution is slower/more delayed than expected (distinct from a timing-closure failure — this is about the actual latency/behavior once running), the relevant levers are:
    - **Analyzing and optimizing clock paths and clock sources** feeding different modules/IP — clock skew, unnecessary clock-buffer cascading, or a poorly-chosen clock source can all introduce avoidable delay (see Chapter 1, Section C.6 on clock resources: CMT, MMCM/PLL, BUFG hierarchy).
    - In some cases, **increasing the input clock frequency** (the reference clock fed to the device, subsequently multiplied/divided by the CMT) can directly improve the delay situation, provided the downstream logic can actually close timing at the higher resulting frequency.

## E.4. Scenario: System Consumes More Power Than Expected

- Power usage is primarily driven by the **amount of FPGA area/logical resources** the design actually uses and switches — see Section D.5.
- For **lower power**, favor **algorithmic optimization** or **pipelining** over full unrolled parallelism where possible — a fully parallel/unrolled implementation typically maximizes area (and thus static + dynamic power) in exchange for maximum throughput; a more modestly pipelined or resource-shared (Section D.2) implementation trades some throughput for meaningfully lower power.
- Power consumption also depends on the **FPGA architecture itself** and precisely **how** logical resources are used (e.g., using a hardened DSP slice for a multiply is typically both faster _and_ lower-power than the equivalent function built from general LUT fabric).
- The **synthesis/implementation tool's placement decisions** also affect power — where different operational blocks end up physically placed on the die affects routing length/capacitance and can be influenced by power-oriented synthesis/implementation strategies (again, e.g., Vivado's power-optimization strategies, which specifically target reduced switching activity and clock-gating opportunities).

## E.5. Scenario: Design Must Meet a Specific Throughput Requirement

- Meeting an aggressive throughput target generally comes down to a combination of:
    - **Running at a higher clock frequency**, and/or applying the **clock-level optimizations** discussed in Sections C.4–C.5 and E.3 to allow a higher Fmax in the first place.
    - Using a **high-throughput bus protocol**, such as **AXI** (see Chapter 2, Section B), to ensure the interconnect/data-movement layer surrounding the compute logic isn't itself the bottleneck — a perfectly pipelined datapath is still throughput-limited if the AXI/memory interface feeding it can't sustain the needed bandwidth.

---

## Summary — Answering "Explain Latency, Throughput, and Power Optimization with Examples"

| Optimization Goal                                             | Core Technique(s)                                                                                                                                                                    | What It Costs                                                                                                 | Worked Example (this chapter)                                                                                                                                                                                                                                                       |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Higher throughput**                                         | Pipelining / loop unrolling (Section C.2)                                                                                                                                            | More registers/area; latency in cycles is unchanged or slightly increased                                     | 3-stage pipelined `x^n`-style computation: new input accepted every cycle (32 bits/cycle) vs. an iterative version that must finish before accepting the next input                                                                                                                 |
| **Lower latency**                                             | Removing pipeline register stages, increasing per-cycle combinational work (Section C.3)                                                                                             | Longer critical path per cycle → may reduce max clock frequency or fail timing                                | Collapsing a 3-cycle pipelined multiply chain into a single-cycle combinational chain feeding one output register                                                                                                                                                                   |
| **Higher max clock frequency (shorter local datapath delay)** | Adding register layers (C.4) or register balancing (C.5)                                                                                                                             | One extra cycle of latency per added register layer (C.4); none for balancing (C.5), just redistributed logic | Splitting `A*x + B*x1 + C*x2` into pre-registered products before summing (C.4); combining two of three inputs before the final add to even out stage delay (C.5)                                                                                                                   |
| **Lower power**                                               | Area/resource reduction (control-based reuse, technology-aware BRAM/DSP coding), favoring pipelining/resource-sharing over full unrolling, letting the tool place/optimize for power | Reduced throughput (if resources are shared/reused instead of duplicated)                                     | Reusing one multiplier across sequential operations (control-based logic reuse) instead of instantiating parallel multipliers for each operation; using hardened DSP/BRAM primitives instead of LUT-built equivalents, which are both smaller and lower-power for the same function |

The unifying theme: **throughput, latency, area, and power are not independent knobs** — pipelining trades area for throughput (latency in cycles roughly unchanged); removing pipeline stages trades achievable clock speed for fewer cycles of latency; resource sharing trades throughput for area and power. Good RTL design for a latency- or resource-critical target means deliberately choosing _which_ of these trade-offs to make based on the actual project requirement, rather than defaulting to either "fully parallel" or "fully serial" implementations.
