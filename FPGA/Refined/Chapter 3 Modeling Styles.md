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
module half_adder (input A, B, output reg Sum, Carry);
    always @(*) begin
        Sum   = A ^ B;
        Carry = A & B;
    end
endmodule
```

Key line:

Describes behaviour, not structure.
