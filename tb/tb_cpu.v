`timescale 1ns/1ps
module tb_cpu;

    reg clk = 0;
    reg rst = 1;

    // Instantiate CPU
    cpu_core core (
        .clk(clk),
        .rst(rst)
    );

    // Wire aliases to internal signals (so GTKWave can see them)
    wire [31:0] pc       = core.pc_inst.pc_out;
    wire [31:0] instr    = core.imem.instr;
    wire [31:0] alu_out  = core.alu_inst.result;
    wire        regWrite = core.control_inst.regWrite;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("waveforms/fib.vcd");
        $dumpvars(0, tb_cpu); // Dumps all from tb_cpu

        $display("---- Fibonacci CPU Test Start ----");
        #2 rst = 0;
        #300;
        $display("---- Fibonacci CPU Test End ----");
        $finish;
    end

endmodule

