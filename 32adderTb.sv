`timescale 1ns / 1ps

module tb_adder_32;

    // Parameters
    parameter WIDTH = 32;

    // Inputs
    logic [WIDTH-1:0] a, b;

    // Outputs
    logic [WIDTH-1:0] y;

    // Instantiate the adder_32 module
    adder_32 #(WIDTH) uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Clock generation
    reg clk = 0;
    always begin
        #5 clk = ~clk;
    end

    // Test stimulus generation
    initial begin
        // Initialize inputs
        a = 32'hA5A5A5A5;
        b = 32'h5A5A5A5A;

        // Apply inputs and observe outputs
        $display("Time a b y");
        $monitor("%0t %h %h %h", $time, a, b, y);

        // Apply inputs
        #10 a = 32'h12345678;
        #10 b = 32'h87654321;
        #10 a = 32'hAAAAAAAA;
        #10 b = 32'h55555555;

        // Finish simulation
        $finish;
    end

endmodule

