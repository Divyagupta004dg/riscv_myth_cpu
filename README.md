#  RISC-V MYTH CPU (4-stage Pipelined Core)

This repository contains a Verilog-based 4-stage pipelined RISC-V CPU (RV32I base), inspired by the MYTH workshop. It is developed module-by-module with simulation support using Icarus Verilog and GTKWave.

---

##  Project Structure

riscv_myth_cpu/

├── src/

│   ├── pc.v

│   ├── instr_mem.v

│   └── reg_file.v

├── tb/
│   └── tb_cpu.v
├── mem/
│   └── prog.mem
├── waveforms/
│   └── day2.vcd
├── README.md

riscv_myth_cpu/
├── src/         # Verilog modules
├── tb/          # Testbench files
├── mem/         # Instruction memory (from RARS)
├── waveforms/   # .vcd files to open in GTKWave
├── tools/       # RARS .jar file
├── riscpictures/# All waveform, terminal, and diagram screenshots
└── README.md    # This file---

#  Day 1 — Program Counter (PC)

## Module: `pc.v`

The program counter module increments the 32-bit address by 4 on each positive edge of the clock. It resets to 0 on a reset signal.

---

## Testbench: `tb_pc.v`

Simulates PC for multiple clock cycles and generates waveform output.

---

## Simulation Instructions

```bash
iverilog -o pc_sim ./tb/tb_pc.v ./src/pc.v
vvp pc_sim
gtkwave waveforms/pc.vcd
---
```
![Image](https://github.com/user-attachments/assets/57355935-f76e-4b90-af1d-43315d834535)

![Image](https://github.com/user-attachments/assets/a78e418b-900d-43bd-9b4a-d2273d0f4612)


# Day 2 — Instruction Memory & Register File

##  Module 1: `instr_mem.v`

Instruction memory that loads instructions from `mem/prog.mem`.

##  Module 2: `reg_file.v`

32x32-bit register file with read/write and reset support.

##  Testbench: `tb_cpu.v`

Basic testbench to simulate:
- PC increment
- Instruction fetch
- Register file write & read

### Description:

- Simulates PC → Instruction Memory → Register File connection  
- Includes clock generation, reset logic, and `$monitor` output  
- Generates VCD file for waveform viewing in GTKWave

---
##  Simulation Instructions

```bash
iverilog -o cpu_sim ./tb/tb_cpu.v ./src/pc.v ./src/instr_mem.v ./src/reg_file.v
vvp cpu_sim
gtkwave waveforms/day2.vcd
```
![Image](https://github.com/user-attachments/assets/9cee6f94-01c9-429c-90d1-9d1058bda348)


![Image](https://github.com/user-attachments/assets/a78e418b-900d-43bd-9b4a-d2273d0f4612)
# 🗓️ Day 3 — ALU, Control Unit, Pipeline Registers, and CPU Core

## ✅ Modules Added:

| File               | Description                                |
|--------------------|--------------------------------------------|
| `alu.v`            | Performs add, sub, and, or operations       |
| `control.v`        | Decodes opcode and generates control lines  |
| `pipeline_regs.v`  | Implements pipeline registers               |
| `cpu_core.v`       | Top-level module connecting all components  |

## 🔪 Final Testbench: `tb_cpu.v`

- Simulates instruction flow through all pipeline stages
- Uses Fibonacci `prog.mem` to test CPU behavior
- Generates waveform in `fib.vcd`

## 🔧 Simulation Instructions

```bash
iverilog -o fib_sim tb/tb_cpu.v src/*.v
vvp fib_sim
gtkwave waveforms/fib.vcd
```

![Image](https://github.com/user-attachments/assets/42f62007-fd47-4088-a2f3-22e77e106694)

![Image](https://github.com/user-attachments/assets/a0e35b8e-ca79-4ffc-8386-bbbc37c19065)
 8502e283fcfc808733986eae48424e208a9786d1
