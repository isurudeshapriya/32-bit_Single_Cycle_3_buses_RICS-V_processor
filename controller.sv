`timescale 1ns / 1ps
module Controller(
    // Inputs
    input logic [6:0] Opcode,
    
    // Outputs
    output logic ALUSrc,
    output logic MemtoReg, RegtoMem,
    output logic RegWrite, MemRead, MemWrite,
    output logic Branch,
    output logic [1:0] ALUOp
);

    // Opcode definitions for RV32I instructions
    localparam R_TYPE = 7'b0110011;
    localparam I_TYPE = 7'b0010011;
    localparam S_TYPE = 7'b0100011;
    localparam SB_TYPE = 7'b1100011;

    // Control signals for different instruction types
    assign Branch   = (Opcode == SB_TYPE);
    assign ALUSrc   = (Opcode == I_TYPE || Opcode == S_TYPE || Opcode == R_TYPE);
    assign MemtoReg = (Opcode == I_TYPE);
    assign RegtoMem = (Opcode == S_TYPE);
    assign RegWrite = (Opcode == I_TYPE || Opcode == R_TYPE);
    assign MemRead  = (Opcode == I_TYPE);
    assign MemWrite = (Opcode == S_TYPE);
    assign ALUOp[0] = (Opcode == SB_TYPE);
    assign ALUOp[1] = (Opcode == R_TYPE);

endmodule
