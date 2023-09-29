`timescale 1ns / 1ps

module tb_mux3;

    // Parameters
    parameter WIDTH = 9;

    // Inputs
    logic [WIDTH-1:0] d0, d1, d2;
    logic [1:0] s;

    // Outputs
    logic [WIDTH-1:0] y;

    // Instantiate the mux3 module
    mux3 #(WIDTH) uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .s(s),
        .y(y)
    );

    // Test stimulus generation
    initial begin
        // Initialize inputs with example values
        d0 = 'b101010101;
        d1 = 'b110011001;
        d2 = 'b001100110;
        s = 2'b00; // Initial select value

        // Apply inputs and observe outputs
        $display("Time d0 d1 d2 s y");
        $monitor("%0t %h %h %h %b %h", $time, d0, d1, d2, s, y);

        // Test with different select values
        #10 s = 2'b01; // Change select value to 01
        #10 s = 2'b10; // Change select value to 10
        #10 s = 2'b00; // Change select value back to 00

        // Finish simulation
        $finish;
    end

endmodule



