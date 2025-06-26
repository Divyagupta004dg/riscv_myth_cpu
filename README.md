# 🚀 RISC-V MYTH CPU (4-stage Pipelined Core)

This repository contains a Verilog-based 4-stage pipelined RISC-V CPU (RV32I base), inspired by the MYTH workshop. It is developed module-by-module with simulation support using Icarus Verilog and GTKWave.

---

## 📁 Project Structure

riscv_myth_cpu/
├── src/ # Verilog modules
├── tb/ # Testbenches
├── mem/ # Instruction memory files (from RARS)
├── waveforms/ # .vcd waveform outputs
├── screenshots/ # Captured outputs from GTKWave and terminal

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
