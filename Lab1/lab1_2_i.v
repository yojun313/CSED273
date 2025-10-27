/* CSED273 lab1 experiment 2_i */
/* lab1_2_i.v */

/* Implement AND with {OR, NOT}
 * You are only allowed to wire modules together */
module lab1_2_i(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB;

    ////////////////////////
    /* Add your code here */
    wire notA;
    wire notB;
    wire orResult;

    not(notA, inA);     // NOT gate for inA
    not(notB, inB);     // NOT gate for inB
    or(orResult, notA, notB); // OR gate for notA and notB
    not(outAND, orResult);    // NOT gate to get the final AND result
    ////////////////////////

endmodule
