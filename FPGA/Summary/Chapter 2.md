# Routing Architecture 

## 1. Role and Trade-offs
1. Routing architecture = programmable **switches and wires** connecting I/O blocks and logic blocks (and logic blocks to each other).
2. Trade-off: **area for routing vs. area for logic** — routing can consume the majority of die area and dominates propagation delay.
3. Trade-off: **flexibility vs. density** — more switches/wires make any placement routable but waste area; too few make routing infeasible.
4. Routing is **pre-fabricated in silicon**, so place-and-route must work within fixed physical constraints.

## 2. Island-Style Routing
1. **Classic, most widely used** architecture in commercial SRAM FPGAs (Xilinx, Intel/Altera); also called **"mesh"** style.
2. CLBs sit on a **2D grid** as "islands" surrounded by a "sea" of routing; each CLB has channels on **all four sides** via connection boxes.
3. **Switch boxes** at H/V channel intersections let signals **turn corners** and reach any part of the die.
4. Channels carry mixed **wire-segment lengths** (length-1, length-2, longlines) to trade off delay vs. switch count; very flexible but **most crowded/complex**.

## 3. Hierarchical Routing
1. Also called **tree-based** routing; logic blocks are grouped into **clusters** (and clusters of clusters) recursively.
2. **Local wiring within clusters** is short, fast, and richly connected; **between clusters**, fewer but longer wires are used as you move up.
3. Exploits high **connection locality** in real designs — reduces long-distance lanes and speeds up local connections.
4. Trade-off: **long-distance cluster-to-cluster** signals route up and down the hierarchy, less efficient than flat island-style. Commercial FPGAs often combine both (e.g., Altera LABs + island-style global fabric).

## 4. Xilinx Routing (Virtex-II Example)
1. Concrete **island-style** example: logic block connects into routing channel via a **connection block** on all four sides.
2. **Pass transistors** used for **output pins**; **multiplexers** for **input pins** — MUX needs only \(\log_2 N\) select bits vs. one SRAM cell per pass-transistor connection.
3. Four wire-segment types: **general-purpose** (through switch boxes), **direct interconnect** (local, no switch box), **long lines** (uniform-delay, high fan-out), and **clock lines** (dedicated low-skew network).
4. Clock distribution is deliberately kept **separate** from general-purpose signal routing.

## 5. Other / Vendor-Specific Routing
1. Vendors like **Altera** and **Actel** implement their own variations, tuned to their logic block design and target market.
2. Routing style is determined by **logic block placement** and **available channel resources** — e.g., Actel's antifuse architecture used more horizontal segments with switch blocks in horizontal channels only.
3. Routing architecture (channel width, segment mix, switch-box topology) varies **between vendors and between families** from the same vendor.
4. Variations target different applications: **logic-dense**, **I/O-dense**, or **DSP-dense** parts.

# AXI Interface Bus Protocol

## B.1. Overview
1. **AXI = Advanced eXtensible Interface**, an ARM-defined on-chip interconnect protocol from the **AMBA** family.
2. Introduced as **AXI3** (AMBA 3); current mainstream for FPGA is **AXI4** (AMBA 4); **AXI5** exists in AMBA 5.
3. Used for **high-speed, high-throughput on-chip communication** between CPUs, DMA, FPGA fabric logic, memory controllers, and peripherals (e.g., Zynq PS ↔ PL).

### AMBA Family
1. **APB** — simple, low-power bus for low-bandwidth peripheral register access.
2. **AHB** — higher-performance system bus, predecessor in spirit to AXI.
3. **AXI** — high-performance, pipelined, burst-capable bus; **ATB** is for debug/trace.

## B.2. Key Features of AXI
1. **Burst-based transactions with a single address phase** — one address for a whole burst of data beats.
2. **Separate read and write channels** — concurrent reads/writes; supports unaligned transfers via **byte strobes**.
3. Supports **multiple outstanding addresses**, **out-of-order completion**, and **address/data phase separation** for high throughput.

## B.3. AXI Protocol System / Interconnect
1. Supports **single-master/multi-slave**, **multi-master/single-slave**, and **multi-master/multi-slave** topologies.
2. An **AXI Interconnect** block arbitrates and routes transactions between masters and slaves.
3. Being AMBA-standard, AXI IP from different vendors **interoperates at protocol level**.

## B.4. The Three AXI4-Family Interfaces
1. **AXI4 (Full/Memory-Mapped)** — address/data bursts up to **256 beats**; data width up to **1024 bits**; supports exclusive access, QoS, cache/protection signaling.
2. **AXI4-Lite** — **no burst** (one data beat per transaction); data width **32 or 64 bits**; no exclusive access; small footprint for control/status registers.
3. **AXI4-Stream** — **no address channel**, unidirectional, **unlimited burst length**; uses VALID/READY plus sideband signals (TLAST, TKEEP, TID, TDEST, TUSER).

## B.5. Basic AXI Signaling — Five Channels
1. **Read**: Read Address (AR) + Read Data (R) — **two channels**.
2. **Write**: Write Address (AW) + Write Data (W) + Write Response (B) — **three channels**.
3. Every channel uses the same **VALID/READY handshake**: source asserts VALID, holds it until destination asserts READY.

## B.6. Memory-Mapped vs. Streaming — Channel Count
1. **Memory-Mapped (AXI4 / AXI4-Lite)** = **5 channels** total (AW, W, B, AR, R).
2. **Streaming (AXI4-Stream)** = only **1 channel** (no address phase, no separate read/write direction).
3. This is why AXI4-Stream is the standard choice for **DSP, video, and packet-processing datapaths**.

# High-Speed Bus Protocols in FPGA

## D.1. Overview
1. Needed when FPGA must exchange **large volumes of data** with external devices/platforms.
2. Supported by dedicated **gigabit transceivers** (hardened SerDes blocks) in the FPGA silicon.
3. Implemented as **serial** (using SerDes) or, less commonly today, **parallel** channels.

## D.2. USB
1. Widely used **high-speed serial** protocol for data exchange between computing platforms/devices.
2. Throughput scales with revision: USB 2.0 up to **480 Mbps**; USB 3.2 Gen1/Gen2 at **5/10 Gbps**; USB 3.2 Gen2x2 and USB4 at **20/40 Gbps**.
3. FPGA platforms typically provide USB 2.0/3.0 via an **external USB PHY** connected to high-speed I/O.

## D.3. PCIe (PCI Express)
1. High-speed **serial** bus, dominant standard for **host-to-accelerator** connectivity across CPU, GPU, and FPGA platforms.
2. Each new generation roughly **doubles** per-lane transfer rate: Gen1 2.5 GT/s → Gen5 32 GT/s per lane.
3. Gen1/Gen2 use **8b/10b** encoding; Gen3/4/5 use **128b/130b** (~1.5% overhead vs. 20%).

## D.4. Ethernet
1. Standard **networking** protocol, implemented over FPGA gigabit transceivers.
2. Common rates: **1G (1000BASE-X), 10G, 25G, 100G+**, with higher rates using **64b/66b** encoding.
3. Implemented via **hardened MAC/PCS** IP or a **soft MAC** in fabric; used for networking and line-rate packet processing.

## D.5. MIPI
1. Popular interface standard for **media data** — images, video, and display content.
2. Two key specs: **MIPI DSI** (driving displays) and **MIPI CSI** (receiving data from camera sensors).
3. Widely used in **embedded vision, machine vision**, and direct display designs.

## D.6. LVDS
1. **Low-Voltage Differential Signaling** — differential I/O standard for **camera modules and sensors**.
2. Uses a **differential pair (P/N)**; receiver recovers signal from the difference, making it **noise-resistant** over longer runs.
3. **Bidirectional**: used both to receive sensor data into FPGA and transmit data out (e.g., to LVDS display panels).

# Embedded SoC/MPSoC Architectures

## E.1. SoC vs. MPSoC — Definitions
1. **SoC** integrates a processor/CPU with FPGA fabric on one chip (e.g., Xilinx Zynq-7000); typically **one or two** cores.
2. **MPSoC** has **more than two processors**, often of different types — e.g., Zynq UltraScale+ has APU, RPU, and GPU.
3. Both handle **diverse data types** (audio, video, sensor, storage), needing a rich mix of interfaces.

## E.2. Representative MPSoC Interface Architecture
1. Combines **PS (processing system)** and **PL (programmable logic)** with hardened peripheral controllers.
2. Interfaces are arranged around the PS with **AXI interconnect** linking to PL and DDR.
3. See the block diagram — shows how general-purpose and high-speed interfaces coexist in one device.

## E.3. Interface Categories in SoC/MPSoC
1. Targeted at **low-power/edge applications**: embedded vision, industrial control, instrumentation, automotive.
2. Two interface classes: **general-purpose** (USB 2.0, CAN, UART, I2C, SPI) for control/config, and **high-speed** (USB 3.0, LVDS, MIPI, HDMI, PCIe, GbE) for bulk data.
3. PS manages general-purpose/control-plane interfaces; high-bandwidth streams go via **AXI4-Stream/VDMA** into PL for processing and/or into DDR for buffering.
