## RTL Methodology

**Approach:** Bottom-up; designer explicitly defines register-to-register data movement and combinational transformations.

**Step 0 Requirement Analysis**
- Define system goals.
- Develop algorithm for each subsystem/module.

**Step 1 Architectural Spec & Microarchitecture**
- Translate algorithm into hardware block diagram.
- Define datapath (registers, ALU, multipliers) and control unit (FSM).

**Step 2 RTL Coding**
- Code microarchitecture in Verilog/SystemVerilog/VHDL.
- Must be synthesizable; maps to FFs, LUTs, MUXes.

**Step 3 Functional Verification**
- Simulate RTL in testbench environment.
- Zero-delay simulation checks only logical correctness.

**Step 4 Logic Synthesis**
- Synthesis tool converts HDL to gate-level netlist.
- Maps operators to LUTs, FFs, DSP blocks based on constraints.

**Step 5 Implementation**
- Placement and routing connect physical resources.
- Static Timing Analysis ensures timing closure.

---

## HLS Design Methodology

**Approach:** Top-down; designer writes high-level sequential code, compiler builds hardware.

**Step 0 Requirement Analysis**
- Define system goals.
- Break system into subsystems/modules and algorithms.

**Step 1 Algorithmic Modeling & C Simulation**
- Write pure sequential C/C++ code.
- Run on host CPU for fast functional debugging.

**Step 2 High-Level Synthesis**
- HLS compiler performs scheduling and allocation.
- Pragmas guide parallelism, pipelining, and resource usage.

**Step 3 RTL Co-Simulation**
- HLS wraps original C testbench around generated RTL.
- Verifies optimized hardware matches sequential C behavior.

**Step 4 IP Generation & Integration**
- Package verified design as IP block with AXI4 interface.
- Integrate into SoC/MPSoC as hardware accelerator.
