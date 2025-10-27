`timescale 1ns / 1ps

module tb_project_fpga;
    // Testbench signals
    reg clk;
    reg btnTop;
    reg btnBottom;
    reg btnLeft;
    reg btnRight;
    reg reset;
    wire [3:0] Q_in;
    wire [3:0] Q_out;
    wire [1:0] X;
    wire [7:0] row;
    wire [7:0] col;
    

    // Instantiate the project_fpga module
    project_fpga uut (
        .clk(clk),
        .btnTop(btnTop),
        .btnBottom(btnBottom),
        .btnLeft(btnLeft),
        .btnRight(btnRight),
        .reset(reset),
        .Q_in(Q_in),
        .X(X),
        .row(row),
        .col(col)
    );

    // Generate clock signal
    always #5 clk = ~clk;

    // Initial block to apply test vectors
    initial begin
        // Initialize signals
        clk = 0;
        btnTop = 0;
        btnBottom = 0;
        btnLeft = 0;
        btnRight = 0;
        reset = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;
        // Test sequence
        // Apply button presses and monitor Q_in
        #10 btnTop = 1; #10 btnTop = 0;
        #10 btnTop = 1; #10 btnTop = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnTop = 1; #10 btnTop = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnTop = 1; #10 btnTop = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnTop = 1; #10 btnTop = 0;
        #10 btnTop = 1; #10 btnTop = 0;
        #10 btnTop = 1; #10 btnTop = 0;
        #10 btnRight = 1; #10 btnRight = 0;
        #10 btnRight = 1; #10 btnRight = 0;

        // Wait for a few clock cycles to observe the changes
        #100;

        // End simulation
        $finish;
    end

    // Monitor the Q_in and button states
    initial begin
        $monitor("Time = %0t, Q_in = %b, X = %b, btnTop = %b, btnBottom = %b, btnLeft = %b, btnRight = %b", 
                  $time, Q_in, X, btnTop, btnBottom, btnLeft, btnRight);
    end

endmodule
