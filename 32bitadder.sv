`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 23:13:12
// Design Name: 
// Module Name: 32bitadder
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

module adder_32
    #(parameter WIDTH = 32)
    (input logic [WIDTH-1:0] a, b,
     output logic [WIDTH-1:0] y);


assign y = a + b;

endmodule