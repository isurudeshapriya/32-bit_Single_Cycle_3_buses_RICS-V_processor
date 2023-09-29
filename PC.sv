`timescale 1ns / 1ps
module program_counter(
    input logic clk,
    input logic reset,
    input logic [31:0] jump_target, // Input for jump instructions
    input logic [31:0] branch_target, // Input for branch instructions
    output logic [31:0] pc_out // Output program counter value
);

    reg [31:0] pc;

    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            pc <= 0; // Reset the program counter to 0
        end else begin
            if (jump_target != 32'h0) begin
                pc <= jump_target; // Jump instruction updates the PC
            end else if (branch_target != 32'h0) begin
                pc <= pc + branch_target; // Branch instruction updates the PC
            end else begin
                pc <= pc + 4; // Default behavior: increment PC by 4 (next instruction)
            end
        end
    end

    assign pc_out = pc;

endmodule
