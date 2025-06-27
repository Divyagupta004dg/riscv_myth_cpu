module reg_file (
    input clk,
    input rst,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] wd,
    input reg_write,
    output [31:0] rd1,
    output [31:0] rd2
);
    reg [31:0] reg_mem [0:31];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst)
            for (i = 0; i < 32; i = i + 1)
                reg_mem[i] <= 0;
        else if (reg_write)
            reg_mem[rd] <= wd;
    end

    assign rd1 = reg_mem[rs1];
    assign rd2 = reg_mem[rs2];
endmodule
