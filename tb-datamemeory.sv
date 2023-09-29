`timescale 1ns / 1ps
`timescale 1ns / 1ps

module datamemory_tb;

    // Parameters
    localparam DM_ADDRESS = 9;
    localparam DATA_W = 32;
    
    // Inputs and outputs
    reg clk;
    reg MemRead;
    reg MemWrite;
    reg [DM_ADDRESS-1:0] a;
    reg [DATA_W-1:0] wd;
    wire [DATA_W-1:0] rd;
    
    // Instantiate the datamemory module
    datamemory #(
        .DM_ADDRESS(DM_ADDRESS),
        .DATA_W(DATA_W)
    ) uut (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .a(a),
        .wd(wd),
        .rd(rd)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        clk = 0;
        MemRead = 0;
        MemWrite = 0;
        a = 0;
        wd = 0;
        
        // Perform a write operation
        MemWrite = 1;
        a = 4;        // Write to address 4
        wd = 32'h12345678; // Data to be written
        #10;
        MemWrite = 0;
        
        // Perform a read operation
        MemRead = 1;
        a = 4; // Read from address 4
        #10;
        MemRead = 0;
        
        // Add more test cases as needed...
        
        $finish;
    end
    
    // Display results
    always @(posedge clk) begin
        $display("Time = %0t, MemRead = %b, MemWrite = %b, Address = %h, WriteData = %h, ReadData = %h", $time, MemRead, MemWrite, a, wd, rd);
    end

endmodule

