
`timescale 1ns / 1ps

module Controller_tb;

    // Inputs
    reg [6:0] Opcode;
    
    // Outputs
    wire ALUSrc, MemtoReg, RegtoMem, RegWrite, MemRead, MemWrite, Branch;
    wire [1:0] ALUOp;

    // Instantiate the Controller module
    Controller uut (
        .Opcode(Opcode),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegtoMem(RegtoMem),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    // Test stimulus
    initial begin
        $display("Starting Controller Test Bench");
        
        // Test case 1: R_TYPE instruction
        Opcode = 7'b0110011; // R_TYPE
        #10;
        
        // Test case 2: I_TYPE instruction
        Opcode = 7'b0010011; // I_TYPE
        #10;
        
        // Test case 3: S_TYPE instruction
        Opcode = 7'b0100011; // S_TYPE
        #10;
        
        // Test case 4: SB_TYPE instruction
        Opcode = 7'b1100011; // SB_TYPE
        #10;
        
        $display("Controller Test Bench Finished");
        $finish;
    end

endmodule
