`timescale 1ns / 1ps
module ALU_tb;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALUControl;
    
    // Outputs
    wire [31:0] ALUResult;

    // Instantiate the ALU module
    ALU uut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult)
    );

    // Clock generation
    reg clk = 0;
    always begin
        #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        // Test case 1: AND operation
        A = 32'hAAAA_5555;
        B = 32'h5555_AAAA;
        ALUControl = 4'b0000; // AND
        #10;
        if (ALUResult !== 32'h0000_5555) $display("Test case 1 failed");
        
        // Test case 2: ADD operation
        A = 32'h1234_5678;
        B = 32'h8765_4321;
        ALUControl = 4'b0010; // ADD
        #10;
        if (ALUResult !== 32'h9999_9999) $display("Test case 2 failed");
        
        // Add more test cases for other operations

        // Finish simulation
        $finish;
    end

endmodule


