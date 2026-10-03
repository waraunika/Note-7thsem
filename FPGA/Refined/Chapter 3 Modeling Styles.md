# Number Representation

## Summary

### Fixed-Point Arithmetic

- Representation: Uses 2’s complement with a fixed binary point, commonly expressed in Qn.m format (n bits for integer/range, m bits for fraction/precision).
- Implementation: Handled as signed vectors in Verilog (reg signed), mapping efficiently to FPGA DSP48 slices and LUTs for fast MAC operations.
- Advantages: Offers the smallest logic footprint, lowest power, fastest execution, and deterministic timing—ideal for hard real-time systems.
- Limitations & Use: Limited dynamic range requires manual scaling to avoid overflow; best for DSP algorithms (FIR/IIR, FFT) and embedded control loops.

### Floating-Point Arithmetic

- Representation: Follows the IEEE 754 standard (Single: 32-bit, Double: 64-bit) using sign, biased exponent, and mantissa 
    ($x=(−1)^s\times1.m\times2^{e−b}$).
- Implementation: The Verilog real type is not synthesizable; hardware requires vendor IP cores or HLS, consuming massive LUT/DSP resources and deep pipelining.
- Advantages: Provides high numerical accuracy, wide dynamic range, and standard compliance, eliminating manual scaling issues.
- Limitations & Use: Incurs high area, high power, and slower clock speeds; reserved for precision-critical applications like ML/AI acceleration, radar, and HPC.

## Fixed-Point Arithmetic in FPGA/Verilog

### Fundamentals & Representation

- Definition: A fixed-positional number system where the binary point is fixed; widely used in digital design for hardware efficiency.
- 2’s Complement: The standard representation for signed fixed-point in Verilog; the MSB carries a negative weight (e.g., -2¹ in Q2.8).
- Qn.m Format: Assumes *n* bits to the left of the binary point (integer part) and *m* bits to the right (fractional part), e.g., Q2.8.
- Range vs. Precision: *n* determines the dynamic range of the integer, while *m* determines the precision of the fractional part.

### FPGA/Verilog Implementation

- Verilog Coding: Represented as signed vectors (e.g., reg signed [9:0] a;); the binary point is implied by the designer, not physically stored.
- Arithmetic Operations: Addition/subtraction maps directly to LUTs and carry chains; multiplication requires bit-growth (Qn.m x Qp.q = Q(n+p).(m+q)).
- Resource Efficiency: Maps perfectly to FPGA DSP48 slices, which natively perform integer/fixed-point multiply-accumulate (MAC) operations.
- Scaling & Shifting: Bit shifts are used to align binary points before addition or to truncate/round after multiplication.

### Trade-offs & Applications

- Advantages: Offers the fastest execution, lowest latency, and smallest logic/power footprint in FPGA fabric.
- Deterministic Timing: Arithmetic operations have fixed, predictable delays, making it ideal for hard real-time systems.
- Limitations: Limited dynamic range and precision; requires careful manual scaling to avoid overflow or quantization errors.
- Use Cases: Ideal for DSP algorithms (FIR/IIR filters, FFT), motor control, and embedded control loops where precision is bounded.

## Floating-Point Arithmetic in FPGA/Verilog

### Fundamentals & IEEE 754 Format

- Definition: Arithmetic appropriate for high-precision applications needing a very wide dynamic range.
- IEEE 754 Structure: A number is represented as
    $$x=(−1)^s\times1.m\times2^{e−b}$$
   - where s is sign, m is mantissa, and e is biased (b) exponent.
- Single Precision (32-bit): 1 sign bit, 8 exponent bits (Bias 127), 23 mantissa bits.
- Double Precision (64-bit): 1 sign bit, 11 exponent bits (Bias 1023), 52 mantissa bits. Normalized numbers assume an implicit leading 1.

### FPGA/Verilog Implementation

- Verilog real type: Only usable for testbenches/simulation; it is not synthesizable into FPGA hardware.
- IP Cores / HLS: Synthesis requires vendor IP (e.g., Xilinx Floating-Point Operator) or High-Level Synthesis (HLS) libraries to generate the hardware.
- Hardware Cost: Consumes massive FPGA resources—thousands of LUTs and DSPs per core, plus extensive routing.
- Pipelining: Requires deep pipeline stages to achieve timing closure for addition, multiplication, and division, leading to high latency.

### Trade-offs & Applications

- Advantages: Excellent numerical accuracy and dynamic range; avoids the manual scaling headaches of fixed-point.
- Standardization: IEEE 754 compliance ensures interoperability and reuse of verified IP cores across different projects.
- Limitations: High area, high power consumption, and much slower clock speeds compared to fixed-point equivalents.
- Use Cases: Used in ML/AI acceleration, high-performance computing (HPC), radar/sonar, and complex scientific simulations where precision is critical.

# Gate‑Level Modeling

Definition:
- Describes a circuit by instantiating built‑in gate primitives (and, or, xor, not, nand, nor, xnor, buf).

Characteristics:
- Uses only primitive gate instances + wire.
- No assign, no always, no operators.
- Purely combinational; closest to a physical netlist.

Program:
```verilog
module half_adder (input A, B, output Sum, Carry);
    xor g1 (Sum,   A, B);
    and g2 (Carry, A, B);
endmodule
```

Instantiates a gate, not an equation.

# Structural Modeling

Definition:
- Describes a circuit by instantiating other modules (sub‑blocks) and wiring them together hierarchically.

Characteristics:

- Uses module instantiation + wire for connections.
- No logic described directly — only “how it’s built”.
- Can contain combinational and sequential sub‑modules.

Program:
```verilog
module xor_gate (input A, B, output Y);
    assign Y = A ^ B;
endmodule

module and_gate (input A, B, output Y);
    assign Y = A & B;
endmodule

module half_adder (input A, B, output Sum, Carry);
    xor_gate u1 (A, B, Sum);
    and_gate u2 (A, B, Carry);
endmodule
```

Builds a circuit by plugging in sub‑modules.

# Dataflow Modeling

Definition:
- Describes a circuit as continuous assignments using operators — data “flows” from inputs to outputs.

Characteristics:

- Uses only assign + operators (+, &, |, ^, ?:, {}).
- All statements are concurrent (parallel).
- Combinational only; cannot store state.

Program:
```verilog
module half_adder (input A, B, output Sum, Carry);
    assign Sum   = A ^ B;
    assign Carry = A & B;
endmodule
```

One equation per output, all run in parallel.

# Behavioral Modeling

Definition:
- Describes what the circuit does algorithmically, using procedural blocks (always, initial) with if, case, for, etc.

Characteristics:

- Uses always/initial; assigned signals must be reg (or logic).
- Can describe combinational (always @(*)) or sequential (always @(posedge clk)) logic.
- Highest level of abstraction; most flexible.

Program (combinational):
```verilog
module mux2x1 (input A, B, Sel, output reg Y);
    always @(*) begin
        if (Sel) begin
            Y = B;
        end else
            y = A;
        end
    end
endmodule
```

Describes behaviour, not structure.
