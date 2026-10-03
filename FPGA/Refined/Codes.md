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

module sub4bit (
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

module sub4bit (
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
#include "sleep.h"
#include <xil_printf.h>

int main(void) {
    XGpio sw, led;
    int sw_val;

    XGpio_Initialize(&sw, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&sw, 1, 0xFFFFFFFF);

    XGpio_Initialize(&led, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&led, 2, 0x00000000);

    while (1) {
        sw_val = XGpio_DiscreteRead(&sw, 1) & 0xFF;
        xil_printf("Value read = %d\r\n", sw_val);
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
#include "sleep.h"
#include <xil_printf.h>

int main(void) {
    XGpio led;

    XGpio_Initialize(&led, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&led, 2, 0x00000000);

    while (1) {
        xil_printf("Light on\r\n");
        XGpio_DiscreteWrite(&led, 2, 0x1F); // 5 bit: 0001 1111
        usleep(100000); // light off for 100,000 us = 100 ms
        xil_printf("Light off\r\n");
        XGpio_DiscreteWrite(&led, 2, 0x00);
        usleep(9900000); // light on for 9900000 us = 9900 ms = 9.9 s
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
#include "sleep.h"
#include <xil_printf.h>

int main(void) {
    XGpio led;

    XGpio_Initialize(&led, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&led, 2, 0x00000000);

    while (1) {
        xil_printf("Light on\r\n");
        XGpio_DiscreteWrite(&led, 2, 0x0F); // 4 bit: 0000 1111
        usleep(100000); // light off for 100,000 us = 100 ms
        xil_printf("Light off\r\n");
        XGpio_DiscreteWrite(&led, 2, 0x00);
        usleep(9900000); // light on for 9900000 us = 9900 ms = 9.9 s
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

136 lines

```verilog
module control_unit (
    input wire reset,

    input wire [6:0] opcode,
    input wire [2:0] funct3,
    input wire [6:0] funct7,

    output wire       reg_write,
    output wire       mem_read,
    output wire       mem_write,
    output wire       mem_to_reg,
    output wire       alu_src,
    output wire       branch,
    output wire [4:0] alu_op,
    output wire       Jump
);

  // ------------------------------------------------------------
  // Opcodes
  // ------------------------------------------------------------
  parameter R_TYPE = 7'b0110011;
  parameter I_TYPE = 7'b0010011;
  parameter LOAD   = 7'b0000011;
  parameter STORE  = 7'b0100011;
  parameter BRANCH = 7'b1100011;
  parameter JAL    = 7'b1101111;
  parameter JALR   = 7'b1100111;

  // ------------------------------------------------------------
  // Main Control Signals
  // ------------------------------------------------------------

  assign reg_write =
        (opcode == R_TYPE) ||
        (opcode == I_TYPE) ||
        (opcode == LOAD)   ||
        (opcode == JAL)    ||
        (opcode == JALR);

  assign mem_read = (opcode == LOAD);
  assign mem_write = (opcode == STORE);

  assign mem_to_reg = (opcode == LOAD);

  assign alu_src = (opcode == I_TYPE) || (opcode == LOAD) || (opcode == STORE) || (opcode == JALR);

  assign branch = (opcode == BRANCH);

  assign Jump = (opcode == JAL) || (opcode == JALR);

  // ------------------------------------------------------------
  // ALU Control
  // ------------------------------------------------------------

  reg [4:0] alu_op_reg;

  assign alu_op = alu_op_reg;

  always @(*) begin
    // Default: ADD
    alu_op_reg = 5'b00000;

    case (opcode)
      // ----------------------------------------------------
      // R-Type
      // ----------------------------------------------------
      R_TYPE: begin
        case (funct3)
          3'b000: begin
            if (funct7 == 7'b0100000) alu_op_reg = 5'b00001;  // SUB
            else alu_op_reg = 5'b00000;  // ADD
          end

          3'b111:  alu_op_reg = 5'b00010;  // AND
          3'b110:  alu_op_reg = 5'b00011;  // OR
          3'b010:  alu_op_reg = 5'b00101;  // SLT
          default: alu_op_reg = 5'b00000;  // ADD
        endcase
      end

      // ----------------------------------------------------
      // I-Type
      // ----------------------------------------------------
      I_TYPE: begin
        case (funct3)
          3'b000:  alu_op_reg = 5'b00000;  // ADDI
          3'b111:  alu_op_reg = 5'b00010;  // ANDI
          3'b110:  alu_op_reg = 5'b00011;  // ORI
          3'b010:  alu_op_reg = 5'b00101;  // SLTI
          default: alu_op_reg = 5'b00000;  // ADD
        endcase
      end

      // ----------------------------------------------------
      // Load
      // ----------------------------------------------------
      LOAD: begin
        alu_op_reg = 5'b00000;  // ADD
      end

      // ----------------------------------------------------
      // Store
      // ----------------------------------------------------
      STORE: begin
        alu_op_reg = 5'b00000;  // ADD
      end

      // ----------------------------------------------------
      // JALR
      // ----------------------------------------------------
      JALR: begin
        alu_op_reg = 5'b00000;  // ADD
      end

      // ----------------------------------------------------
      // Branch
      // ----------------------------------------------------
      BRANCH: begin
        case (funct3)
          3'b000:  alu_op_reg = 5'b00001;  // BEQ -> SUB
          3'b001:  alu_op_reg = 5'b00001;  // BNE -> SUB
          3'b100:  alu_op_reg = 5'b00101;  // BLT -> SLT
          3'b101:  alu_op_reg = 5'b00101;  // BGE -> SLT
          default: alu_op_reg = 5'b00000;  // ADD
        endcase
      end

      // ----------------------------------------------------
      // JAL / Unknown opcode
      // ----------------------------------------------------
      default: begin
        alu_op_reg = 5'b00000;
      end
    endcase
  end
endmodule
```

## ALU module

46 lines

```verilog
module alu (

    input wire [31:0] srcA,
    input wire [31:0] srcB,
    input wire [4:0] alu_op,
    output reg [31:0] result
);

    always @(*) begin
        case (alu_op)
            
            5'b00000: result = srcA + srcB; // ADD            
            5'b00001: result = srcA - srcB; // SUB           
            5'b00010: result = srcA & srcB; // AND            
            5'b00011: result = srcA | srcB; // OR            
            5'b00101: result = (srcA < srcB) ? 32'b1 : 32'b0; // SLT
            default: result = 32'b0;
        endcase
    end
endmodule
```

## Instruction Module

37 lines

```verilog
module instruction_memory (
    input wire [31:0] address,
    output reg [31:0] instruction
);
    reg [31:0] memory [0:255];
    initial begin
    // RANDOM ASS INSTRUCTIONS
        memory[0] = 32'b00000000000100000000000010010011;  // ADDI x1, x0, 1
        memory[1] = 32'b00000000001000000000000100010011;  // ADDI x2, x0, 2
        memory[2] = 32'b00000000001000001000000110110011;  // ADD x3, x1, x2
        memory[3] = 32'b01000000001000001000001000110011;  // SUB x4, x1, x2
    end
    always @(*) begin
        instruction = memory[address[9:2]];
    end
endmodule
```

## Unnecessary: ALU_CU

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

# Advanced Programming

## Implement an FFT algorithm in Verilog [5] (82 Bh, Md2)

33 lines

```verilog
module fft(
    input signed [31:0] x [0:7],
    output signed [31:0] Y [0:7],
    output signed [31:0] Yi [0:7]
    );

    localparam signed p = 181 ; // (181/256) = 0.707

    assign Y[0] = x[0]+ x[1]+x[2]+x[3]+x[4]+x[5]+x[6]+x[7];
    assign Yi[0] = 0;

    assign Y[1]  = (x[0]-x[4]) + ((p*(x[1]-x[3]-x[5]+x[7])) >>> 8);
    assign Yi[1] = (x[6]-x[2]) - ((p*(x[1]+x[3]-x[5]-x[7])) >>> 8);

    assign Y[2] = x[0] - x[2] + x[4] - x[6];
    assign Yi[2] = -x[1] + x[3] -x[5] + x[7];

    assign Y[3]  = (x[0]-x[4]) - ((p*(x[1]-x[3]-x[5]+x[7])) >>> 8);
    assign Yi[3] = (x[2]-x[6]) - ((p*(x[1]+x[3]-x[5]-x[7])) >>> 8);

    assign Y[4] = x[0]-x[1]+x[2]-x[3]+x[4]-x[5]+x[6]-x[7];
    assign Yi[4] = 0;

    assign Y[5] = Y[3];
    assign Yi[5] = -Yi[3];

    assign Y[6] = Y[2];
    assign Yi[6] = -Yi[2];

    assign Y[7] = Y[1];
    assign Yi[7] = -Yi[1];

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
