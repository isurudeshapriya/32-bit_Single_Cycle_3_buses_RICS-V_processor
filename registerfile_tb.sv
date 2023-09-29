`timescale 1ns / 1ps

module RegisterFile_TB;

    // Define parameters
    localparam CLK_PERIOD = 10; // Clock period in time units

    // Inputs and outputs
    logic clk;
    logic rst_n;
    logic [4:0] ReadRegister1;
    logic [4:0] ReadRegister2;
    logic [4:0] WriteRegister;
    logic RegWrite;
    logic [31:0] WriteData;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;

    // Instantiate the RegisterFile module
    RegisterFile uut (
        .clk(clk),
        .rst_n(rst_n),
        .ReadRegister1(ReadRegister1),
        .ReadRegister2(ReadRegister2),
        .WriteRegister(WriteRegister),
        .RegWrite(RegWrite),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

    // Clock generation
  //  always begin
     //   #CLK_PERIOD /2;
  //      clk = ~clk; // Invert the clock signal to create a 50% duty cycle
    //end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        ReadRegister1 = 0;
        ReadRegister2 = 0;
        WriteRegister = 0;
        RegWrite = 0;
        WriteData = 0;

        // Apply reset
        #20;
        rst_n = 1;

        // Write data to register 5
        WriteRegister = 5;
        WriteData = 32'hABCDE123;
        RegWrite = 1;
        #20;
        RegWrite = 0;

        // Read data from registers 3 and 5
        ReadRegister1 = 3;
        ReadRegister2 = 5;
        #20;

        // Add more test cases as needed...

        // End simulation
        $finish;
    end

    // Display results
    always @(posedge clk) begin
        $display("Time = %0t, ReadData1 = %h, ReadData2 = %h", $time, ReadData1, ReadData2);
    end

endmodule


