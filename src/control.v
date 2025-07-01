module control (
    input [6:0] opcode,
    output reg regWrite,
    output reg [3:0] alu_control
);
    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-type
                regWrite = 1;
                alu_control = 4'b0010;
            end
            7'b0010011: begin // I-type (ADDI)
                regWrite = 1;
                alu_control = 4'b0010;
            end
            default: begin
                regWrite = 0;
                alu_control = 4'b0000;
            end
        endcase
    end
endmodule
