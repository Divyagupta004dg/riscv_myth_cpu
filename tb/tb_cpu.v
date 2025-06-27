`timescale 1ns / 1ps

module tb_cpu;

    // Clock and Reset
    reg clk = 0;
    reg rst = 1;

    // Wire declarations
    wire [31:0] pc;
    wire [31:0] instr;
    wire [31:0] rd1, rd2;

    // Instantiate Program Counter
    pc pc_inst (
        .clk(clk),
        .rst(rst),
        .pc_out(pc)
    );

    // Instantiate Instruction Memory
    instr_mem imem_inst (
        .addr(pc),
        .instr(instr)
    );

    // Instantiate Register File
    reg_file rf_inst (
        .clk(clk),
        .rst(rst),
        .rs1(5'd1),
        .rs2(5'd2),
        .rd(5'd3),
        .wd(32'hBEEFCAFE),
        .reg_write(1'b1),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial simulation block
    initial begin
        $display("----- RISC-V CPU Day 2 Simulation Start -----");

        // Waveform output setup
        $dumpfile("waveforms/day2.vcd");
        $dumpvars(0, tb_cpu);

        // Monitor important values every time they change
        $monitor("Time=%0t | PC=%h | Instr=%h | RD1=%h | RD2=%h",
                  $time, pc, instr, rd1, rd2);

        // Release reset after 2 ns
        #2 rst = 0;

        // Run for 100 ns
        #100;

        $display("----- Simulation Complete -----");
        $finish;
    end

endmodule

