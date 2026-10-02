# Verilog Basics

## Write a verilog code for 8-bit ALU by including 8 common arithmetic & logical operation. [6] (81 Bh, Md1)

```verilog
module alu_case (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] ALU_SEL,
    output reg  [7:0] OUT,
    output reg        carry_borrow
);

	always @(*) begin
		// Default values prevent latch inference
		carry_borrow = 1'b0;
		OUT          = 8'h00;

		case (ALU_SEL)
			3'b000: {carry_borrow, OUT} = A + B;   // ADD
			3'b001: {carry_borrow, OUT} = A - B;   // SUB
			3'b010: OUT = A & B;                   // AND
			3'b011: OUT = A | B;                   // OR
			3'b100: OUT = A ^ B;                   // XOR
			3'b101: OUT = ~A;                      // NOT
			3'b110: OUT = ~(A & B);                // NAND
			3'b111: OUT = ~(A | B);                // NOR
		endcase
	end

endmodule
```

## Write a verilog code for a 4-bit subtractor and also write testbench for it. [6] (82 Bh)

Two methods: Using adder then subtractor, or, subtractor from scratch

### Method 1: 4-Bit Adder as a Subtractor

gonna use this one, cause we'll need an adder anyway.

```verilog
module full_adder (
    input  A, B, Cin,
    output Sum, Cout
);
    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module add4bit (
    input  [3:0] A, B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire c1, c2, c3;

    full_adder fa0 (A[0], B[0], Cin, Sum[0], c1);
    full_adder fa1 (A[1], B[1], c1,  Sum[1], c2);
    full_adder fa2 (A[2], B[2], c2,  Sum[2], c3);
    full_adder fa3 (A[3], B[3], c3,  Sum[3], Cout);

endmodule

module sub4bit_via_adder (
    input  [3:0] A, B,
    output [3:0] Diff,
    output       Bout
);
    wire [3:0] B_comp;
    wire       Cout;

    assign B_comp = ~B;                         // 1's complement of B
    add4bit adder (A, B_comp, 1'b1, Diff, Cout);// +1 → 2's complement
    assign Bout = ~Cout;                        // borrow = ~carry

endmodule
```

### Subtractor using subtractors

```verilog
module full_subtractor (
    input  A, B, Bin,
    output Diff, Bout
);
    assign Diff = A ^ B ^ Bin;
    assign Bout = (~A & B) | (~(A ^ B) & bin);
endmodule

module sub4bit_structural (
    input  [3:0] A, B,
    output [3:0] Diff,
    output       Bout
);
    wire b1, b2, b3;   // intermediate borrows

    full_subtractor fs0 (A[0], B[0], 1'b0, Diff[0], b1);
    full_subtractor fs1 (A[1], B[1], b1,   Diff[1], b2);
    full_subtractor fs2 (A[2], B[2], b2,   Diff[2], b3);
    full_subtractor fs3 (A[3], B[3], b3,   Diff[3], Bout);

endmodule
```

### Testbench

```verilog
`timescale 1ns / 1ps

module sub4bit_tb;
    reg  [3:0] A, B;
    wire [3:0] Diff;
    wire       Bout;

    sub4bit  u1 (.A(A), .B(B), .Diff(Diff), .Bout(Bout));

    integer i, j;

    initial begin
        $dumpfile("sub4bit.vcd");
        $dumpvars(0, sub4bit_tb);

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i[3:0];
                B = j[3:0];
                #5;
            end
        end

        $finish;
    end
endmodule
```

## Write a verilog code for a 4-bit adder and also write testbench for it. [6] (Md2)

### Main file

```verilog
module full_adder (
    input  A, B, Cin,
    output Sum, Cout
);
    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module add4bit (
    input  [3:0] A, B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire c1, c2, c3;

    full_adder fa0 (A[0], B[0], Cin, Sum[0], c1);
    full_adder fa1 (A[1], B[1], c1,  Sum[1], c2);
    full_adder fa2 (A[2], B[2], c2,  Sum[2], c3);
    full_adder fa3 (A[3], B[3], c3,  Sum[3], Cout);

endmodule
```

### Testbench

```verilog
`timescale 1ns / 1ps

module add4bit_tb;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;
    reg  [4:0] expected;   // {Cout, Sum}
    integer    i, j, k;

    // DUT
    add4bit uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        $dumpfile("add4bit.vcd");
        $dumpvars(0, add4bit_tb);

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    A   = i[3:0];
                    B   = j[3:0];
                    Cin = k[0];
                    #5;
                end
            end
        end

        $finish;
    end
endmodule
```

---

# C codes

## 1. Create an embedded C application targeting to Xilinx Zynq PS for two AXI GPIO IP with 8bit LED and 8bit Switch connected with it. Read the switch value and write that to LED port. [6] (81 Bh, Md1)

note:
- 2 AXI GPIO
- 8 bit LED
- 8 bit Switch
- read from switch -> write to led

```c
#include "xgpio.h"
#include "xparameters.h"

int main(void) {
    XGpio sw, led;
    int sw_val;

    XGpio_Initialize(&sw, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&sw, 1, 0xFFFFFFFF);

    XGpio_Initialize(&led, XPAR_AXI_GPIO_1_BASEADDR);
    XGpio_SetDataDirection(&led, 2, 0x00000000);

    while (1) {
        sw_val = XGpio_DiscreteRead(&sw, 1) & 0xFF;
        XGpio_DiscreteWrite(&led, 2, sw_val);

        sleep(1);
    }
}
```

## 2. Create an embedded C application targeting to Zynq FPGA Board with Xilinx PS and one AXI GPIO IP (5-bit LED) connected with it and blink that LED in interval of 10 second. [6] (82 Bh)

note:
- 1 AXI GPIO
- 5 bit led
- blink led in 10 seconds: i'm taking it to mean 10 s ON, 10 s OFF

```c
#include "xgpio.h"
#include "xparameters.h"

int main(void) {
    XGpio led;

    XGpio_Initialize(&led, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&led, 2, 0x00000000);

    while (1) {
        XGpio_DiscreteWrite(&led, 2, 0x1F); // 5 bit: 0001 1111
        sleep(10);
        XGpio_DiscreteWrite(&led, 2, 0x00);
        sleep(10);
    }
}
```

## 3. Create an embedded C application targeting to Zynq FPGA Board with Xilinx PS and one AXI GPIO IP (4-bit LED) connected with it and blink that LED in interval of 10 second. [6] (Md2)

note:
- 1 AXI GPIO
- 4 bit led
- led blinking at 10s interval

```c
#include "xgpio.h"
#include "xparameters.h"

int main(void) {
    XGpio led;

    XGpio_Initialize(&led, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&led, 2, 0x00000000);

    while (1) {
        XGpio_DiscreteWrite(&led, 2, 0x0F); // 4 bit: 0000 1111
        sleep(10);
        XGpio_DiscreteWrite(&led, 2, 0x00);
        sleep(10);
    }
}
```

## Code from Lab Session

```c
#include "xgpio.h"
#include "xparameters.h"

int main(void) {
  XGpio led, push;
  int psb_check;
  xil_printf("-- Start of the Program --\r\n");

  XGpio_Initialize(&push, XPAR_AXI_GPIO_0_BASEADDR);
  XGpio_SetDataDirection(&push, 1, 0xffffffff);

  XGpio_Initialize(&led, XPAR_AXI_GPIO_0_BASEADDR);
  XGpio_SetDataDirection(&led, 2, 0x00000000);

  while (1) {
    psb_check = XGpio_DiscreteRead(&push, 1);
    xil_printf("Push Button Status %x\r\n", psb_check);
    XGpio_DiscreteWrite(&led, 2, psb_check);
    xil_printf("LED Status %x\r\n", psb_check);
    sleep(1);
  }
}
```

---

# RISCV Implementation

## Control Logic Module

Two options: Combined Control Logic Module or Control Unit + ALU Control Unit

### Combined Logic Module

137 lines including comment

```verilog
module control (
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,

    output reg RegWrite,
    ALUSrc,  // 1: alu b input is the immediate, 0: rs2
    ASrcPC,  // 1: alu a input is pc (auipc), 0: rs1
    MemRead,
    MemWrite,
    MemToReg,  // 1: write back memory data, 0: alu result
    output reg Branch,
    Jump,  // jal or jalr, writes pc+4 to rd
    Jalr,  // jalr only, target comes from alu (rs1 + imm)

    output reg [3:0] ALU_operation
);

  // opcodes
  localparam OP_Rtype = 7'b0110011;
  localparam OP_Itype = 7'b0010011;  // addi, slti, xori, slli ...
  localparam OP_Load  = 7'b0000011;
  localparam OP_Stype = 7'b0100011;
  localparam OP_Btype = 7'b1100011;
  localparam OP_JAL   = 7'b1101111;
  localparam OP_JALR  = 7'b1100111;
  localparam OP_LUI   = 7'b0110111;
  localparam OP_AUIPC = 7'b0010111;

  // alu operation encodings (must match alu.v)
  localparam ALU_ADD  = 4'b0010;
  localparam ALU_SUB  = 4'b0110;
  localparam ALU_AND  = 4'b0000;
  localparam ALU_OR   = 4'b0001;
  localparam ALU_XOR  = 4'b0100;
  localparam ALU_SLL  = 4'b0111;
  localparam ALU_SRL  = 4'b1000;
  localparam ALU_SRA  = 4'b1001;
  localparam ALU_SLT  = 4'b1010;
  localparam ALU_SLTU = 4'b1011;
  localparam ALU_PASS = 4'b1111;

  // r-type and i-type share the funct3 decode
  // funct7[5] is instruction bit 30, it picks sub/sra
  reg [3:0] alu_funct;

  always @(*) begin
    case (funct3)
      // only r-type can sub, for addi bit 30 is just part of the immediate
      3'b000:  alu_funct = (opcode == OP_Rtype && funct7[5]) ? ALU_SUB : ALU_ADD;
      3'b001:  alu_funct = ALU_SLL;
      3'b010:  alu_funct = ALU_SLT;
      3'b011:  alu_funct = ALU_SLTU;
      3'b100:  alu_funct = ALU_XOR;
      3'b101:  alu_funct = funct7[5] ? ALU_SRA : ALU_SRL;
      3'b110:  alu_funct = ALU_OR;
      default: alu_funct = ALU_AND;
    endcase
  end

  always @(*) begin
    // defaults, so nothing is left unassigned (no latches)
    RegWrite      = 1'b0;
    ALUSrc        = 1'b0;
    ASrcPC        = 1'b0;
    MemRead       = 1'b0;
    MemWrite      = 1'b0;
    MemToReg      = 1'b0;
    Branch        = 1'b0;
    Jump          = 1'b0;
    Jalr          = 1'b0;
    ALU_operation = ALU_ADD;

    case (opcode)
      OP_Rtype: begin
        RegWrite      = 1'b1;
        ALU_operation = alu_funct;
      end

      OP_Itype: begin
        RegWrite      = 1'b1;
        ALUSrc        = 1'b1;
        ALU_operation = alu_funct;
      end

      OP_Load: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
        MemRead  = 1'b1;
        MemToReg = 1'b1;
      end

      OP_Stype: begin
        ALUSrc   = 1'b1;
        MemWrite = 1'b1;
      end

      OP_Btype: begin
        Branch = 1'b1;
        // beq/bne use sub (zero flag), blt/bge use slt, bltu/bgeu use sltu
        case (funct3[2:1])
          2'b10:   ALU_operation = ALU_SLT;
          2'b11:   ALU_operation = ALU_SLTU;
          default: ALU_operation = ALU_SUB;
        endcase
      end

      OP_JAL: begin
        RegWrite = 1'b1;
        Jump     = 1'b1;
      end

      OP_JALR: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
        Jump     = 1'b1;
        Jalr     = 1'b1;
      end

      OP_LUI: begin
        RegWrite      = 1'b1;
        ALUSrc        = 1'b1;
        ALU_operation = ALU_PASS;  // pass the immediate
      end

      OP_AUIPC: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
        ASrcPC   = 1'b1;
      end

      default: begin
      end
    endcase
  end

endmodule

```

### CU + ALU_CU

99 + 59 = 158 lines

#### CU

99 lines

```verilog
module cu (
    input [6:0] opcode,

    output reg RegWrite,
    ALUSrc,  // 1: alu b input is the immediate, 0: rs2
    ASrcPC,  // 1: alu a input is pc (auipc), 0: rs1
    MemRead,
    MemWrite,
    MemToReg,  // 1: write back memory data, 0: alu result
    output reg Branch,
    Jump,  // jal or jalr, writes pc+4 to rd
    Jalr,  // jalr only, target comes from alu (rs1 + imm)

    output reg [1:0] ALUOp
);

  // opcodes
  localparam OP_Rtype  = 7'b0110011;
  localparam OP_Itype  = 7'b0010011;  // addi, slti, xori, slli ...
  localparam OP_Load   = 7'b0000011;
  localparam OP_Stype  = 7'b0100011;
  localparam OP_Btype  = 7'b1100011;
  localparam OP_JAL    = 7'b1101111;
  localparam OP_JALR   = 7'b1100111;
  localparam OP_LUI    = 7'b0110111;
  localparam OP_AUIPC  = 7'b0010111;

  // ALUOp: 00 add, 01 branch compare, 10 r-type, 11 i-type
  always @(*) begin
    // defaults, so nothing is left unassigned (no latches)
    RegWrite = 1'b0;
    ALUSrc   = 1'b0;
    ASrcPC   = 1'b0;
    MemRead  = 1'b0;
    MemWrite = 1'b0;
    MemToReg = 1'b0;
    Branch   = 1'b0;
    Jump     = 1'b0;
    Jalr     = 1'b0;
    ALUOp    = 2'b00;

    case (opcode)
      OP_Rtype: begin
        RegWrite = 1'b1;
        ALUOp    = 2'b10;
      end

      OP_Itype: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
        ALUOp    = 2'b11;
      end

      OP_Load: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
        MemRead  = 1'b1;
        MemToReg = 1'b1;
      end

      OP_Stype: begin
        ALUSrc   = 1'b1;
        MemWrite = 1'b1;
      end

      OP_Btype: begin
        Branch = 1'b1;
        ALUOp  = 2'b01;
      end

      OP_JAL: begin
        RegWrite = 1'b1;
        Jump     = 1'b1;
      end

      OP_JALR: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
        Jump     = 1'b1;
        Jalr     = 1'b1;
      end

      OP_LUI: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
      end

      OP_AUIPC: begin
        RegWrite = 1'b1;
        ALUSrc   = 1'b1;
        ASrcPC   = 1'b1;
      end

      default: begin
      end
    endcase
  end

endmodule
```

#### ALU_CU

59 lines

```verilog
module alu_control (
    input [1:0] ALUOp,
    input [2:0] funct3,
    input [6:0] funct7,
    input [6:0] opcode,
    output reg [3:0] ALU_operation
);

  // alu operation encodings (must match alu.v)
  localparam ALU_ADD  = 4'b0010;
  localparam ALU_SUB  = 4'b0110;
  localparam ALU_AND  = 4'b0000;
  localparam ALU_OR   = 4'b0001;
  localparam ALU_XOR  = 4'b0100;
  localparam ALU_SLL  = 4'b0111;
  localparam ALU_SRL  = 4'b1000;
  localparam ALU_SRA  = 4'b1001;
  localparam ALU_SLT  = 4'b1010;
  localparam ALU_SLTU = 4'b1011;
  localparam ALU_PASS = 4'b1111;

  localparam OP_LUI = 7'b0110111;

  // funct7[5] is instruction bit 30, it picks sub/sra
  always @(*) begin
    case (ALUOp)
      2'b00: begin
        // load/store, jalr, auipc -> add. lui -> pass the immediate
        if (opcode == OP_LUI) ALU_operation = ALU_PASS;
        else ALU_operation = ALU_ADD;
      end

      2'b01: begin
        // branch: beq/bne use sub (zero flag), blt/bge use slt, bltu/bgeu use sltu
        case (funct3[2:1])
          2'b10:   ALU_operation = ALU_SLT;
          2'b11:   ALU_operation = ALU_SLTU;
          default: ALU_operation = ALU_SUB;
        endcase
      end

      // r-type (10) and i-type (11)
      default: begin
        case (funct3)
          // only r-type can sub, for addi bit 30 is just part of the immediate
          3'b000:  ALU_operation = (ALUOp == 2'b10 && funct7[5]) ? ALU_SUB : ALU_ADD;
          3'b001:  ALU_operation = ALU_SLL;
          3'b010:  ALU_operation = ALU_SLT;
          3'b011:  ALU_operation = ALU_SLTU;
          3'b100:  ALU_operation = ALU_XOR;
          3'b101:  ALU_operation = funct7[5] ? ALU_SRA : ALU_SRL;
          3'b110:  ALU_operation = ALU_OR;
          default: ALU_operation = ALU_AND;
        endcase
      end
    endcase
  end

endmodule
```

## ALU module

42 lines

```
module alu (
    input [31:0] src_a,
    input [31:0] src_b,
    input [3:0] alu_control,
    output reg [31:0] result,
    output zero
);

  // alu operation encodings
  localparam ALU_ADD  = 4'b0010;
  localparam ALU_SUB  = 4'b0110;
  localparam ALU_AND  = 4'b0000;
  localparam ALU_OR   = 4'b0001;
  localparam ALU_XOR  = 4'b0100;
  localparam ALU_SLL  = 4'b0111;
  localparam ALU_SRL  = 4'b1000;
  localparam ALU_SRA  = 4'b1001;
  localparam ALU_SLT  = 4'b1010;
  localparam ALU_SLTU = 4'b1011;
  localparam ALU_PASS = 4'b1111;  // pass through for lui

  always @(*) begin
    case (alu_control)
      ALU_ADD:  result = src_a + src_b;
      ALU_SUB:  result = src_a - src_b;
      ALU_AND:  result = src_a & src_b;
      ALU_OR:   result = src_a | src_b;
      ALU_XOR:  result = src_a ^ src_b;
      ALU_SLL:  result = src_a << src_b[4:0];  // only low 5 bits are the shift amount
      ALU_SRL:  result = src_a >> src_b[4:0];
      ALU_SRA:  result = $signed(src_a) >>> src_b[4:0];
      ALU_SLT:  result = ($signed(src_a) < $signed(src_b)) ? 32'd1 : 32'd0;
      ALU_SLTU: result = (src_a < src_b) ? 32'd1 : 32'd0;
      ALU_PASS: result = src_b;
      default:  result = 32'd0;
    endcase
  end

  // zero flag is set when result is zero
  assign zero = (result == 32'd0);

endmodule
```

## Instruction Module

37 lines

```verilog
module inst_memory (
    input [31:0] PC,
    output reg [31:0] inst
);

  // 256 x 32-bit memory
  reg [31:0] mem[0:255];
  integer i;

  initial begin
    // initialize all to NOP
    for (i = 0; i < 256; i = i + 1) begin
      mem[i] = 32'h00000013;  // NOP (addi x0, x0, 0)
    end

    // test program: one instruction from each format (R, I, load, S, B, U, J)
    mem[0] = 32'h02D00513;  // ADDI x10, x0, 45     (li a0, 45)
    mem[1] = 32'h04100593;  // ADDI x11, x0, 65     (li a1, 65)
    mem[2] = 32'h00B50633;  // ADD  x12, x10, x11   (110)
    mem[3] = 32'h05560693;  // ADDI x13, x12, 85    (195)
    mem[4] = 32'h10000713;  // ADDI x14, x0, 256    (address 0x100)
    mem[5] = 32'h00D72023;  // SW   x13, 0(x14)     (store 195)
    mem[6] = 32'h00072783;  // LW   x15, 0(x14)     (load it back, 195)
    mem[7] = 32'h00D78463;  // BEQ  x15, x13, +8    (taken, skips next)
    mem[8] = 32'h00100813;  // ADDI x16, x0, 1      (skipped)
    mem[9] = 32'h123458B7;  // LUI  x17, 0x12345    (0x12345000)
    mem[10] = 32'h008000EF;  // JAL  x1, +8          (x1 = 44, skips next)
    mem[11] = 32'h00100913;  // ADDI x18, x0, 1      (skipped)
    mem[12] = 32'h40A689B3;  // SUB  x19, x13, x10   (150)
    mem[13] = 32'h0000006F;  // JAL  x0, 0           (halt: loop here)
  end

  always @(*) begin
    inst = mem[PC[9:2]];  // word-aligned access
  end

endmodule
```

# Advanced Programming

## Implement an FFT algorithm in Verilog [5] (82 Bh, Md2)

116 lines

```verilog
// assumptions made:
// Q1.15 data type is used:
// 1 bit sign, 15 bit magnitude
// it is assumed that the input ranges from [-1, 1)
// every butterfly output is halved, so the result is X[k] / 8

module fft_8point (
    input CLK,
    RST,
    input signed [15:0] x0_re, x1_re, x2_re, x3_re, x4_re, x5_re, x6_re, x7_re,
    input signed [15:0] x0_im, x1_im, x2_im, x3_im, x4_im, x5_im, x6_im, x7_im,
    output signed [15:0] y0_re, y1_re, y2_re, y3_re, y4_re, y5_re, y6_re, y7_re,
    output signed [15:0] y0_im, y1_im, y2_im, y3_im, y4_im, y5_im, y6_im, y7_im
);

  // (a + b) / 2 and (a - b) / 2
  // inputs are 32 bits wide, so the add/sub can never wrap before the shift
  function signed [15:0] hadd;
    input signed [31:0] a, b;
    hadd = (a + b) >>> 1;
  endfunction

  function signed [15:0] hsub;
    input signed [31:0] a, b;
    hsub = (a - b) >>> 1;
  endfunction

  // twiddle factors w8^k = cos(2*pi*k/8) - j sin(2*pi*k/8), k = 0..3
  // k = 0: 1,  k = 1: 0.707 - j0.707,  k = 2: -j,  k = 3: -0.707 - j0.707
  localparam [63:0] W_RE = {16'hA57E, 16'h0000, 16'h5A82, 16'h7FFF};
  localparam [63:0] W_IM = {16'hA57E, 16'h8000, 16'hA57E, 16'h0000};

  // inputs in bit-reversed order: position n holds x[bitrev(n)]
  wire [127:0] xr = {x7_re, x3_re, x5_re, x1_re, x6_re, x2_re, x4_re, x0_re};
  wire [127:0] xi = {x7_im, x3_im, x5_im, x1_im, x6_im, x2_im, x4_im, x0_im};

  wire signed [15:0] x_re[0:7], x_im[0:7];

  genvar k;
  generate
    for (k = 0; k < 8; k = k + 1) begin : load
      assign x_re[k] = xr[16*k+:16];
      assign x_im[k] = xi[16*k+:16];
    end
  endgenerate

  // pipeline registers
  reg signed [15:0] s1_re[0:7], s1_im[0:7];
  reg signed [15:0] s2_re[0:7], s2_im[0:7];
  reg signed [15:0] s3_re[0:7], s3_im[0:7];

  // temporaries for the stage 3 twiddle multiply
  reg signed [15:0] w_re, w_im;
  reg signed [31:0] p_re, p_im;

  integer i;

  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      for (i = 0; i < 8; i = i + 1) begin
        s1_re[i] <= 0;
        s1_im[i] <= 0;
        s2_re[i] <= 0;
        s2_im[i] <= 0;
        s3_re[i] <= 0;
        s3_im[i] <= 0;
      end
    end else begin

      // stage 1: butterfly on pairs (0,1) (2,3) (4,5) (6,7)
      for (i = 0; i < 8; i = i + 2) begin
        s1_re[i]   <= hadd(x_re[i], x_re[i+1]);
        s1_im[i]   <= hadd(x_im[i], x_im[i+1]);
        s1_re[i+1] <= hsub(x_re[i], x_re[i+1]);
        s1_im[i+1] <= hsub(x_im[i], x_im[i+1]);
      end

      // stage 2: butterfly on pairs (0,2) (1,3) and (4,6) (5,7)
      // twiddle is 1 for the first pair and -j for the second
      // s * (-j) = (im, -re), so no multiplier is needed
      for (i = 0; i < 8; i = i + 4) begin
        s2_re[i]   <= hadd(s1_re[i], s1_re[i+2]);
        s2_im[i]   <= hadd(s1_im[i], s1_im[i+2]);
        s2_re[i+2] <= hsub(s1_re[i], s1_re[i+2]);
        s2_im[i+2] <= hsub(s1_im[i], s1_im[i+2]);

        s2_re[i+1] <= hadd(s1_re[i+1], s1_im[i+3]);
        s2_im[i+1] <= hsub(s1_im[i+1], s1_re[i+3]);
        s2_re[i+3] <= hsub(s1_re[i+1], s1_im[i+3]);
        s2_im[i+3] <= hadd(s1_im[i+1], s1_re[i+3]);
      end

      // stage 3: butterfly on pairs (i, i+4), the lower one is first multiplied by w8^i
      for (i = 0; i < 4; i = i + 1) begin
        w_re = W_RE[16*i+:16];
        w_im = W_IM[16*i+:16];

        // p = w * s2[i+4], kept 32 bits wide so it cannot wrap
        p_re = (s2_re[i+4] * w_re - s2_im[i+4] * w_im) >>> 15;
        p_im = (s2_re[i+4] * w_im + s2_im[i+4] * w_re) >>> 15;

        s3_re[i]   <= hadd(s2_re[i], p_re);
        s3_im[i]   <= hadd(s2_im[i], p_im);
        s3_re[i+4] <= hsub(s2_re[i], p_re);
        s3_im[i+4] <= hsub(s2_im[i], p_im);
      end

    end
  end

  assign {y7_re, y6_re, y5_re, y4_re, y3_re, y2_re, y1_re, y0_re} =
      {s3_re[7], s3_re[6], s3_re[5], s3_re[4], s3_re[3], s3_re[2], s3_re[1], s3_re[0]};
  assign {y7_im, y6_im, y5_im, y4_im, y3_im, y2_im, y1_im, y0_im} =
      {s3_im[7], s3_im[6], s3_im[5], s3_im[4], s3_im[3], s3_im[2], s3_im[1], s3_im[0]};

endmodule
```

## Implement a cordic algorithm in Verilog [5] (81 Bh, Md1)

```verilog
module CORDIC(
    input  wire               clock,
    input  wire signed [15:0] x_start,
    input  wire signed [15:0] y_start,
    input  wire signed [15:0] angle,
    output wire signed [15:0] cosine,
    output wire signed [15:0] sine
);

    parameter width = 16;

    // LUT: atan(2^-i) scaled so pi = 32768
    wire signed [15:0] atan_table [0:15];
    assign atan_table[0]  = 16'h2000; // 45.000°
    assign atan_table[1]  = 16'h12E4; // 26.565°
    assign atan_table[2]  = 16'h09FB; // 14.036°
    assign atan_table[3]  = 16'h0511; //  7.125°
    assign atan_table[4]  = 16'h028B; //  3.576°
    assign atan_table[5]  = 16'h0146; //  1.790°
    assign atan_table[6]  = 16'h00A3; //  0.895°
    assign atan_table[7]  = 16'h0051; //  0.448°
    assign atan_table[8]  = 16'h0029; //  0.224°
    assign atan_table[9]  = 16'h0014; //  0.112°
    assign atan_table[10] = 16'h000A; //  0.056°
    assign atan_table[11] = 16'h0005; //  0.028°
    assign atan_table[12] = 16'h0003; //  0.014°
    assign atan_table[13] = 16'h0001; //  0.007°
    assign atan_table[14] = 16'h0001; //  0.003°
    assign atan_table[15] = 16'h0000; //  0.002°

    // Internal pipeline registers with 18 bits to prevent bit-growth overflow [17:0]
    reg signed [17:0] x [0:width]; 
    reg signed [17:0] y [0:width];
    reg signed [15:0] z [0:width]; 

    // Quadrant pre-rotation
    wire [1:0] quadrant = angle[15:14];

    always @(posedge clock) begin
        case (quadrant)
            2'b00, 2'b11: begin
                x[0] <= {{2{x_start[15]}}, x_start}; // Properly sign extend 16 to 18-bit
                y[0] <= {{2{y_start[15]}}, y_start};
                z[0] <= angle;
            end
            2'b01: begin // Angle in upper-left quadrant (+90 to +180). Subtract pi/2 (16'h4000)
                x[0] <= -{{2{y_start[15]}}, y_start};
                y[0] <=  {{2{x_start[15]}}, x_start};
                z[0] <= angle - 16'h4000; 
            end
            2'b10: begin // Angle in lower-left quadrant (-90 to -180). Add pi/2 (16'h4000)
                x[0] <=  {{2{y_start[15]}}, y_start};
                y[0] <= -{{2{x_start[15]}}, x_start};
                z[0] <= angle + 16'h4000;
            end
        endcase
    end

    // 16 Iterative CORDIC Pipeline Stages
    genvar i;
    generate
        for (i = 0; i < width; i = i + 1) begin : xyz
            wire z_sign = z[i][15];  
            wire signed [17:0] x_shr = x[i] >>> i; 
            wire signed [17:0] y_shr = y[i] >>> i;

            always @(posedge clock) begin
                x[i+1] <= z_sign ? x[i] + y_shr : x[i] - y_shr;
                y[i+1] <= z_sign ? y[i] - x_shr : y[i] + x_shr;
                z[i+1] <= z_sign ? z[i] + atan_table[i] : z[i] - atan_table[i];
            end
        end
    endgenerate

    // Outputs mapped correctly back to 16 bits (grabbing the primary Q1.15 data space)
    assign cosine = x[width][15:0];
    assign sine   = y[width][15:0];

endmodule
```
