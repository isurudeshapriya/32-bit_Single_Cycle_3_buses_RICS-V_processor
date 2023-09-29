`timescale 1ns / 1ps

module tb_adder;

    // Parameters
    parameter WIDTH = 8;

    // Inputs
    logic [WIDTH-1:0] a, b;

    // Outputs
    logic [WIDTH-1:0] y;

    // Instantiate the adder module
    adder #(WIDTH) uut (
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
        a = 8'b11001010; // Example input values
        b = 8'b00110101;

        // Apply inputs and observe outputs
        $display("Time a b y");
        $monitor("%0t %b %b %b", $time, a, b, y);

        // Apply inputs
        #10 a = 8'b10101010; // Change input values after 10ns
        #10 b = 8'b01010101;

        // Finish simulation
        $finish;
    end

endmodule
