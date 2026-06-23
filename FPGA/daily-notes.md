# Chapter 2: CFPGA Logical Components, architecture and interfaces

## Logical Interconnection and Routing architectures in FPGA

### Popular Routing Architectures
1. Island Style Routing Architecture
  - This is old fashioned routing architecture.
  - is popular
  - here every clb has route channel at all side via connection box
  - arch is most connected
2. Hierarchical Routing Architecture
  - popular is connection box structure.
  - island style architecture op
  - hierarchical style
3. Xilinx has its own

4. Honeycomb Architecture

## AXI Interface Bus Protocol

### Overview
  - Advanced eXtensible Interface; is a interface protocol defined by ARM as part of the AMBA (Advanced Microcontroller Bus Architecture) standard
    - The AXi/ARM4 specification are freely-available on the ARM website
  - As of its specification mentioned. AXI is used for high speed communication between different processing component in the "Processing device like FPGA, GPU and other".
    - AXI offers high performance and frequency based communication or data handling between on chip processing components
  - Types:
    - AXI3/AXI4 Memory Map
        - Traditional adress/data burst s(sigle address, multiple data)
    - AXI4 Streaming
    - AXI4 Lite

### Features  
  - Burst based

- AXI is part of AMBA
    - AMBA others: APB, AHB, AXI, ATB
- AXI supports single master multi-slave and multi-master and mult-slave configuring by using AXI interconnect engine or block.

### Basic AXI Signaling - 5 Channel

- Read address channel

- AX4-Lite for slave
    - no burst

- AXI4
    - Sometimes called Full AXI or AXI Memory Mapped
    - Not ARM-sanctioned names
    - single address multiple data
    - burst upto 256 characters
    - data width parameterizable
- AXI4-Stream
    - No address channel, no read and write always, just master to slave
        - effectively an AXI4 "write data" channel
    Mohammadsadegh Sadri

## High speed interfaces and usage of those interfaces

## Embedded SoC/MPSoC architectures detail and interfaces
