/* CSED273 lab1 experiment 1 */
/* lab1_1.v */


/* Implement AND */
module lab1_1(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB;
    
    ////////////////////////
    /* Add your code here */
    assign outAND = inA & inB;
    ////////////////////////

endmodule