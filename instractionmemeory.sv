
`timescale 1ns / 1ps

module instructionmemory #(
    parameter INS_ADDRESS = 9,
    parameter INS_W = 32
)(
    input logic clk,
    input logic reset,
    input logic [INS_ADDRESS - 1:0] ra, // Read address of the instruction memory, comes from PC
    output logic [INS_W - 1:0] rd // Read Data
);

    // Define the instruction memory as a reg array
    reg [INS_W - 1:0] Inst_mem [(2 ** (INS_ADDRESS - 2)) - 1:0];

    // Initialize instruction memory with your instructions
    initial begin
        Inst_mem[0] = 32'h00007033; // and  r0, r0, r0
        Inst_mem[1] = 32'h00100093; // addi r1, r0, 1
        // Add more instructions here...
    end

    // Read the instruction at the specified address
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rd <= 0; // Reset the output to 0 on a reset signal
        end else begin
            rd <= Inst_mem[ra[INS_ADDRESS - 1:2]];
        end
    end

endmodule
