`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2023 00:17:55
// Design Name: 
// Module Name: mux2tb
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


module tb_mux2;

    // Parameters
    parameter WIDTH = 9;

    // Inputs
    logic [WIDTH-1:0] d0, d1;
    logic s;

    // Outputs
    logic [WIDTH-1:0] y;

    // Instantiate the mux2 module
    mux2 #(WIDTH) uut (
        .d0(d0),
        .d1(d1),
        .s(s),
        .y(y)
    );

    // Test stimulus generation
    initial begin
        // Initialize inputs with example values
        d0 = 'b101010101;
        d1 = 'b110011001;
        s = 1'b0; // Initial select value

        // Apply inputs and observe outputs
        $display("Time d0 d1 s y");
        $monitor("%0t %h %h %b %h", $time, d0, d1, s, y);

        // Test with different select values
        #10 s = 1'b1; // Change select value to 1
        #10 s = 1'b0; // Change select value back to 0

        // Finish simulation
        $finish;
    end

endmodule

