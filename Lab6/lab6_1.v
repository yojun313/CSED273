/* CSED273 lab6 experiment 1 */
/* lab6_1.v */

`timescale 1ps / 1fs

/* Implement synchronous BCD decade counter (0-9)
 * You must use JK flip-flop of lab6_ff.v */
module decade_counter(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    /* Add your code here */
    wire [3:0] J;
    wire [3:0] K;
    wire [3:0] _count;
    
    assign J[3] = count[2]&count[1]&count[0];
    assign K[3] = count[0];
    
    assign J[2] = count[1]&count[0];
    assign K[2] = count[1]&count[0];
    
    assign J[1] = (~count[3])&count[0];
    assign K[1] = count[0];
    
    assign J[0] = 1;
    assign K[0] = 1;
    
    edge_trigger_JKFF C3 (reset_n, J[3], K[3], clk, count[3], _count[3]);
    edge_trigger_JKFF C2 (reset_n, J[2], K[2], clk, count[2], _count[2]);
    edge_trigger_JKFF C1 (reset_n, J[1], K[1], clk, count[1], _count[1]);
    edge_trigger_JKFF C0 (reset_n, J[0], K[0], clk, count[0], _count[0]);
    ////////////////////////
	
endmodule