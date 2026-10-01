# Embedded Design Overview

- Embedded design covers the methodology of designing or developing the embedded systems.
- As embedded system designed for specifc task or objective.
- This system mainly needs a Processor, memory, peripherals, interconnection and interfaces etc to achieve a complete or standalone system which can perform the given task all the time without any external intervention or support.
- Embedded design mainly target the application part of Embedded SoC Architecture.

The architecture:
![From ZynqBook, Embedded SoC Arch](attachments/embedded-soc-arch.png)

## Embedded Design Overview - with SoC FPGA

**Different SoC FPGAs**

- Xilinx Zynq
    - Zynq-7000 All Programmable SoC
    - with Cortex-A9 MPCore
- Alterra Arria V & Cyclone V
    - Hard processor System (HPS)
    - with Cortex-A9 MPCore
- Microsemi Smartfusion2
    - Cortex M3

## Embedded Design Overview with Xilinx Zynq SoC FPGA Architecture

Zynq PS or APU (Application Processing Unit)

![APU programming through Xilinx SDK](attachments/embedded-zynq-apu.png)

VIVADO IP design example for Zynq based embedded design

![VIVADO block design](attachments/embedded-vivado-block-design.png)

![Block Design Representation](attachments/embedded-block-design.png)

![Embedded design flow with IP or RTL or HLS IP integrated with Zynq PS and C/C++ application](attachments/embedded-design-flow-zynq-ps.png)

## Design flow

Basic Design Flow for Zynq SoC

![Embedded design flow zynq soc](attachments/embedded-design-flow-zynq-soc.png)

# RTL and HLS design approaches in Embedded Design

Example: Embedded Design with HLS and High Level Application for Processor

![Embedded design with hls and high level application for processor](attachments/embedded-hls-approach-example.png)

# SoC/MPSoC FPGAs and design approaches with AMD Xilinx tools
