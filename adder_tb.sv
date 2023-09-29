`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 22:50:24
// Design Name: 
// Module Name: adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

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

    // Finish simulation
    initial begin
        // Initialize inputs (you can modify these values)
        a = 'b11001010;
        b = 'b00110101;

        // Simulate for a few nanoseconds (you can adjust the time as needed)
        #10;

        // Finish simulation
        $finish;
    end

endmodule

