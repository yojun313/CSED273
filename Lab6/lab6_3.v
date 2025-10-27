/* CSED273 lab6 experiment 3 */
/* lab6_3.v */

`timescale 1ps / 1fs

/* Implement 369 game counter (0, 3, 6, 9, 13, 6, 9, 13, 6 ...)
 * You must first implement D flip-flop in lab6_ff.v
 * then you use D flip-flop of lab6_ff.v */
module counter_369(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    /* Add your code here */
    wire [3:0] D;
    wire [3:0] _count;
    
    assign D[3] = (count[3]&(~count[2]))|(count[1]&(~count[0]));
    assign D[2] = count[0];
    assign D[1] = (count[3]&count[2])|((~count[3])&(~count[2]));
    assign D[0] = (~count[0])|(count[3]&(~count[2]));
    
    edge_trigger_D_FF C3 (reset_n, D[3], clk, count[3], _count);
    edge_trigger_D_FF C2 (reset_n, D[2], clk, count[2], _count); 
    edge_trigger_D_FF C1 (reset_n, D[1], clk, count[1], _count); 
    edge_trigger_D_FF C0 (reset_n, D[0], clk, count[0], _count); 
    ////////////////////////
	
endmodule
