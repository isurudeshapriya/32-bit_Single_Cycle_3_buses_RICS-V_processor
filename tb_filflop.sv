

`timescale 1ns / 1ps

module tb_flopr;

    // Inputs
    reg clk;
    reg reset;
    reg [7:0] d;

    // Outputs
    wire [7:0] q;

    // Instantiate the flopr module
    flopr #(8) dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always begin
        clk = ~clk;
        #5; // Assuming a 10ns clock period
    end

    // Reset generation
    initial begin
        reset = 0;
        #20; // Reset for 20ns
        reset = 1;
    end

    // Test cases
    initial begin
        // Initialize inputs
        d = 8'hA5; // Example input data

        // Wait for a few clock cycles
        #100;

        // Add more test cases here...

        // Finish simulation
        $finish;
    end

    // Add more test cases here...

endmodule

