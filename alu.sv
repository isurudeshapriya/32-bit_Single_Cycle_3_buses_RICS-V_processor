`timescale 1ns / 1ps
module ALUController(
    // Inputs
    input logic [1:0] ALUOp,     // 7-bit opcode field from the instruction
    input logic [6:0] Funct7,    // bits 25 to 31 of the instruction
    input logic [2:0] Funct3,    // bits 12 to 14 of the instruction
    input Branch,
    input Mem, OpI, AUIPC,
    // Outputs
    output logic [3:0] Operation, // operation selection for ALU
    output logic Con_beq, Con_bne, Con_blt, Con_bge
);

    // ... (Previous assignments)

    assign Con_beq = (Branch) && (Funct3 == 3'b000);
    assign Con_bne = (Branch) && (Funct3 == 3'b001);

    // Add more branch conditions as needed for BLT, BGE, etc.
    // assign Con_blt = ...;
    // assign Con_bge = ...;

    // Your existing assignments for Operation bits

endmodule

