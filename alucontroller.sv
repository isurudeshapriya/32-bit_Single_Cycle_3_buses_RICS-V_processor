`timescale 1ns / 1ps
module ALUController(
    // Inputs
    input logic [6:0] Funct7,     // bits 31 to 25 of the instruction
    input logic [2:0] Funct3,     // bits 14 to 12 of the instruction
    input logic MemRead,          // Memory Read control signal
    input logic MemWrite,         // Memory Write control signal
    input logic MemToReg,         // Memory to Register control signal
    input logic [1:0] ALUSrc,     // ALU Source control signal (e.g., 00 for register-register, 01 for register-immediate)
    
    // Outputs
    output logic [3:0] ALUOp,     // 4-bit ALU operation code
    output logic ALUControlNegate // ALU Control signal for negate operation
);

always_comb begin
    // Default values
    ALUOp = 4'b0000;
    ALUControlNegate = 1'b0;

    // Determine ALU operation based on instruction type
    case ({Funct7, Funct3})
        // Computational instructions
        9'b000000000, 9'b000000010, 9'b010000000, 9'b010000010: begin
            ALUOp = 4'b0010; // ALUOp for ADD
            if (Funct7[6] == 1'b1) begin
                // Funct7 bit 6 determines subtraction (SUB)
                ALUOp = 4'b0110;
            end
        end
        9'b000000001: ALUOp = 4'b0100; // ALUOp for SLL (Shift Left Logical)
        9'b000000100: ALUOp = 4'b0101; // ALUOp for SLT (Set Less Than)
        9'b000000101: ALUOp = 4'b1000; // ALUOp for SLTU (Set Less Than Unsigned)
        9'b000000110: ALUOp = 4'b0011; // ALUOp for XOR
        9'b000000111: begin
            // Funct7 bit 0 determines SRL (Shift Right Logical), Funct7 bit 6 determines SRA (Shift Right Arithmetic)
            if (Funct7[6] == 1'b0) begin
                ALUOp = 4'b1010; // ALUOp for SRL
            end else begin
                ALUOp = 4'b1011; // ALUOp for SRA
            end
        end
        9'b000001000: ALUOp = 4'b0011; // ALUOp for OR
        9'b000001001: ALUOp = 4'b1001; // ALUOp for AND
        default: ALUOp = 4'b0000; // Default: No operation
    endcase

    // Determine ALU Control signals for negate operation (e.g., SUB)
    if (ALUOp == 4'b0110) begin
        ALUControlNegate = 1'b1;
    end
end

endmodule

