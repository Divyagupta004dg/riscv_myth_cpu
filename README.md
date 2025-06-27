# 🚀 RISC-V MYTH CPU (4-stage Pipelined Core)

This repository contains a Verilog-based 4-stage pipelined RISC-V CPU (RV32I base), inspired by the MYTH workshop. It is developed module-by-module with simulation support using Icarus Verilog and GTKWave.

---

## 📁 Project Structure

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

---

# 📅 Day 1 — Program Counter (PC)

## ✅ Module: `pc.v`

The program counter module increments the 32-bit address by 4 on each positive edge of the clock. It resets to 0 on a reset signal.

---

## 🧪 Testbench: `tb_pc.v`

Simulates PC for multiple clock cycles and generates waveform output.

---

## 🔧 Simulation Instructions

```bash
iverilog -o pc_sim ./tb/tb_pc.v ./src/pc.v
vvp pc_sim
gtkwave waveforms/pc.vcd
---

# 📅 Day 2 — Instruction Memory & Register File

## ✅ Module 1: `instr_mem.v`

Instruction memory that loads instructions from `mem/prog.mem`.

## ✅ Module 2: `reg_file.v`

32x32-bit register file with read/write and reset support.

## 🧪 Testbench: `tb_cpu.v`

Basic testbench to simulate:
- PC increment
- Instruction fetch
- Register file write & read

### 📋 Description:

- Simulates PC → Instruction Memory → Register File connection  
- Includes clock generation, reset logic, and `$monitor` output  
- Generates VCD file for waveform viewing in GTKWave

---
## 🔧 Simulation Instructions

```bash
iverilog -o cpu_sim ./tb/tb_cpu.v ./src/pc.v ./src/instr_mem.v ./src/reg_file.v
vvp cpu_sim
gtkwave waveforms/day2.vcd
