`timescale 1ns / 1ps
module ALUController_tb;

    // Inputs
    reg [6:0] Funct7;
    reg [2:0] Funct3;
    reg MemRead;
    reg MemWrite;
    reg MemToReg;
    reg [1:0] ALUSrc;

    // Outputs
    wire [3:0] ALUOp;
    wire ALUControlNegate;

    // Instantiate the ALUController module
    ALUController uut (
        .Funct7(Funct7),
        .Funct3(Funct3),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp),
        .ALUControlNegate(ALUControlNegate)
    );

    // Clock generation
    reg clock = 0;

    always begin
        #5 clock = ~clock;
    end

    // Test cases
    initial begin
        // Initialize inputs
        Funct7 = 7'b0000000;
        Funct3 = 3'b000;
        MemRead = 0;
        MemWrite = 0;
        MemToReg = 0;
        ALUSrc = 2'b00;

        // Test case 1: ADD
        Funct7 = 7'b0000000;
        Funct3 = 3'b000;
        MemRead = 0;
        MemWrite = 0;
        MemToReg = 0;
        ALUSrc = 2'b00;
        #10;
        if (ALUOp !== 4'b0010 || ALUControlNegate !== 0) $display("Test case 1 failed");

        // Test case 2: SUBTRACT
        Funct7 = 7'b0100000;
        Funct3 = 3'b000;
        MemRead = 0;
        MemWrite = 0;
        MemToReg = 0;
        ALUSrc = 2'b00;
        #10;
        if (ALUOp !== 4'b0110 || ALUControlNegate !== 0) $display("Test case 2 failed");

        // Add more test cases for other instructions...

        $finish;
    end

endmodule

