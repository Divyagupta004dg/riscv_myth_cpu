module cpu_core (
    input clk,
    input rst
);
    wire [31:0] pc, instr;
    wire [31:0] reg_rd1, reg_rd2;
    wire [3:0] alu_ctrl;
    wire [31:0] alu_out;
    wire regWrite;

    pc pc_inst (.clk(clk), .rst(rst), .pc_out(pc));
    instr_mem imem (.addr(pc), .instr(instr));
    reg_file rf (
        .clk(clk), .rst(rst),
        .rs1(instr[19:15]), .rs2(instr[24:20]),
        .rd(instr[11:7]),
        .wd(alu_out),
        .reg_write(regWrite),
        .rd1(reg_rd1), .rd2(reg_rd2)
    );

    control control_inst (
        .opcode(instr[6:0]),
        .regWrite(regWrite),
        .alu_control(alu_ctrl)
    );

    alu alu_inst (
        .a(reg_rd1), .b(reg_rd2),
        .alu_control(alu_ctrl),
        .result(alu_out)
    );
endmodule
