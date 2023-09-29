`timescale 1ns / 1ps
module datamemory #(
    parameter DM_ADDRESS = 9,
    parameter DATA_W = 32
)(
    input logic clk,
    input logic MemRead,              // Comes from the control unit
    input logic MemWrite,             // Comes from the control unit
    input logic [DM_ADDRESS-1:0] a,   // Read/Write address - 9 LSB bits of the ALU output
    input logic [DATA_W-1:0] wd,      // Write Data
    output logic [DATA_W-1:0] rd      // Read Data
);

    logic [DATA_W-1:0] mem [0:(1<<DM_ADDRESS)-1];

    always_comb begin
        if (MemRead)
            rd = mem[a];
        else
            rd = 'z; // Tri-state output when not reading
    end

    always_ff @(posedge clk) begin
        if (MemWrite)
            mem[a] = wd;
    end

endmodule
