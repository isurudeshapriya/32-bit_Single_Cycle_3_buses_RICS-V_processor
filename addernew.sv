`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2023 06:41:56
// Design Name: 
// Module Name: addernew
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

module adder
    #(parameter WIDTH = 8)
    (input logic [WIDTH-1:0] a, b,
     output logic [WIDTH-1:0] y);


assign y = a + b;

endmodule 