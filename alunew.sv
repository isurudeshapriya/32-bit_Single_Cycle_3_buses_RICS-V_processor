module ALU (
    input logic [31:0] A,
    input logic [31:0] B,
    input logic [3:0] ALUControl,
    output logic [31:0] ALUResult
);

    always_comb begin
        case (ALUControl)
            4'b0000: ALUResult = A & B;       // AND
            4'b0001: ALUResult = A | B;       // OR
            4'b0010: ALUResult = A + B;       // ADD
            4'b0110: ALUResult = A - B;       // SUBTRACT
            4'b0111: ALUResult = A ^ B;       // XOR
            4'b1000: ALUResult = A << B[4:0]; // LEFT SHIFT
            4'b1001: ALUResult = A >> B[4:0]; // RIGHT SHIFT (LOGICAL)
            4'b1010: ALUResult = $signed(A) >>> B[4:0]; // RIGHT SHIFT (ARITHMETIC)
            default: ALUResult = 32'b0;       // Default: Zero
        endcase
    end

endmodule

