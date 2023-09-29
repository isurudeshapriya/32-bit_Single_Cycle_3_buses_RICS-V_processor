
`timescale 1ns / 1ps

module instructionmemory_tb;
    // Parameters
    parameter INS_ADDRESS = 9;
    parameter INS_W = 32;

    // Signals
    logic clk;
    logic reset;
    logic [INS_ADDRESS - 1:0] ra;
    logic [INS_W - 1:0] rd;

    // Instantiate the instructionmemory module
    instructionmemory #(
        .INS_ADDRESS(INS_ADDRESS),
        .INS_W(INS_W)
    ) uut (
        .clk(clk),
        .reset(reset),
        .ra(ra),
        .rd(rd)
    );

    // Clock generation
    always begin
        clk = 0;
        #5; // Change the delay as needed
        clk = 1;
        #5; // Change the delay as needed
    end

    // Reset generation
    initial begin
        reset = 1;
        #10; // Reset for a few clock cycles
        reset = 0;
    end

    // Test stimulus
    initial begin
        // Test with different read addresses
        ra = 3; // Read address 3
        #10; // Allow some time for the read to occur

        ra = 6; // Read address 6
        #10; // Allow some time for the read to occur

        // Add more test cases as needed
        // ...

        // Finish simulation
        $finish;
    end

    // Monitor the read data
    always @(rd) begin
        $display("Read Data: %h", rd);
    end

endmodule

// Simulation
module testbench;
    instructionmemory_tb uut();
    initial begin
        $dumpfile("simulation.vcd");
        $dumpvars(0, uut);
        $display("Starting simulation...");
        $monitor("Time = %0t", $time);
        $finish;
    end
endmodule

