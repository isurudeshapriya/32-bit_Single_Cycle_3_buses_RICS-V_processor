`timescale 1ns / 1ps

module testbench;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] instruction;

    // Outputs
    wire [31:0] data_out;

    // Instantiate your processor module
    YourProcessor uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .data_out(data_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Reset generation
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
    end

    // Test program memory
    initial begin
        // Load your test program into memory
        // For example:
        // memory[0] = 32'h01234567; // Example instruction
        // memory[1] = 32'h89ABCDEF; // Another example instruction
        // ...

        // Run your processor with a sequence of instructions
        // For example:
        // instruction = memory[0];
        // #10 instruction = memory[1];
        // #10 instruction = memory[2];
        // ...

        // Add more test cases and instructions here
    end

    // Monitor and assertions (add as needed)
    // You can monitor signals, check for correct outputs, etc.

    // Terminate simulation when done
    initial begin
        #1000 $finish;
    end

endmodule

