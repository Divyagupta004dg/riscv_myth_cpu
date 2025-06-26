`timescale 1ns/1ps

module tb_pc;
    reg clk, reset;
    wire [31:0] pc_out;

    pc uut (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out)
    );

    initial begin
        $dumpfile("waveforms/pc.vcd");   // ✅ VCD output file
        $dumpvars;             // ✅ Dump all variables in this module

        clk = 0;
        reset = 1;
        #5 reset = 0;
        #100 $finish;
    end

    always #5 clk = ~clk;                // ✅ 10ns clock period

    initial begin
        $monitor("Time = %0t | PC = %h", $time, pc_out);  // ✅ Print to terminal
    end
endmodule

