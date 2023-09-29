`timescale 1ns / 1ps
module tb_program_counter;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] jump_target;
    reg [31:0] branch_target;

    // Outputs
    wire [31:0] pc_out;

    // Instantiate the program counter module
    program_counter pc_inst (
        .clk(clk),
        .reset(reset),
        .jump_target(jump_target),
        .branch_target(branch_target),
        .pc_out(pc_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Initialize signals
    initial begin
        $dumpfile("tb_program_counter.vcd");
        $dumpvars(0, tb_program_counter);

        clk = 0;
        reset = 1;
        jump_target = 0;
        branch_target = 0;

        // Release reset
        reset = 0;

        // Simulate some instructions
        // Jump instruction
        jump_target = 32'h00400008; // Jump to address 0x00400008
        #10;

        // Branch instruction
        branch_target = 32'h0000000C; // Branch offset (12 bytes)
        #10;

        // Default behavior (increment by 4)
        branch_target = 0;
        #10;

        // Finish simulation
        $finish;
    end

endmodule

