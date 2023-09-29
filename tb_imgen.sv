
`timescale 1ns / 1ps

module tb_imm_Gen;

    // Inputs
    reg [31:0] inst_code;

    // Outputs
    wire [31:0] Imm_out;

    // Instantiate the imm_Gen module
    imm_Gen u_imm_Gen (
        .inst_code(inst_code),
        .Imm_out(Imm_out)
    );

    // Stimulus generation
    initial begin
        // Initialize simulation
        $dumpfile("tb_imm_Gen.vcd");
        $dumpvars(0, tb_imm_Gen);

        // Case 1: I-type load instruction
        inst_code = 32'h00003223; // Example I-type load instruction
        #10; // Wait for a few simulation cycles
        $display("Immediate for I-type load: %h", Imm_out);

        // Case 2: I-type addi instruction
        inst_code = 32'h00130213; // Example I-type addi instruction
        #10; // Wait for a few simulation cycles
        $display("Immediate for I-type addi: %h", Imm_out);

        // Add more test cases for different instruction types here...

        // Finish simulation
        $finish;
    end

endmodule

