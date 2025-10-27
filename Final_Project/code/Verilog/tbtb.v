`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/07 01:35:14
// Design Name: 
// Module Name: tbtb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tbtb;

    // Inputs
    reg clk;
    reg reset;
    reg [1:0] X;
    reg [3:0] Q_in;

    // Outputs
    wire [3:0] Q_out;
    wire [7:0] row;

    // Instantiate the Unit Under Test (UUT)
    mazeselect uut (
        .clk(clk),
        .reset(reset),
        .Q_in(Q_in),
        .X(X),
        .Q_out(Q_out),
        .row(row)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        X = 2'b00;
        Q_in = 4'b0000;

        // Reset the system
        #10;
        reset = 0;

        // Apply test sequence
        assign Q_in = Q_out;
        X=2'b00; #10;
        assign Q_in = Q_out;
        X=2'b00; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b00; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b00; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b00; #10;
        assign Q_in = Q_out;
        X=2'b00; #10;
        assign Q_in = Q_out;
        X=2'b00; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;
        X=2'b10; #10;
        assign Q_in = Q_out;

        // Finish simulation
        #100;
        $finish;
    end

    initial begin
        $monitor("Time=%0t reset=%b Q=%b X=%b row=%b", $time, reset, Q_out, X, row);
    end

endmodule

