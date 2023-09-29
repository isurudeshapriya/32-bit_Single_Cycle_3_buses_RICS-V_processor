`timescale 1ns / 1ps
module RegisterFile(
    input logic clk,                   // Clock signal
    input logic rst_n,                // Reset signal (active low)
    input logic [4:0] ReadRegister1,   // Read register 1 index
    input logic [4:0] ReadRegister2,   // Read register 2 index
    input logic [4:0] WriteRegister,   // Write register index
    input logic RegWrite,             // Register write control signal
    input logic [31:0] WriteData,      // Data to be written to the register
    output logic [31:0] ReadData1,     // Data read from register 1
    output logic [31:0] ReadData2     // Data read from register 2
);

    // Define the registers
    logic [31:0] registers [31:0];

    // Read data from registers
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ReadData1 <= '0;
            ReadData2 <= '0;
        end else begin
            ReadData1 <= registers[ReadRegister1];
            ReadData2 <= registers[ReadRegister2];
        end
    end

    // Write data to registers
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int i = 0; i < 32; i = i + 1) begin
                registers[i] <= '0;
            end
        end else if (RegWrite) begin
            registers[WriteRegister] <= WriteData;
        end
    end

endmodule
