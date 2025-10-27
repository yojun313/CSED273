/* CSED273 lab1 experiment 2_ii */
/* lab1_2_ii.v */


/* Implement OR with {AND, NOT}
 * You are only allowed to wire modules together */
module lab1_2_ii(outOR, inA, inB);
    output wire outOR;
    input wire inA, inB;

    ////////////////////////
    /* Add your code here */
    wire notA;
    wire notB;
    wire andResult;

    // NOT A와 NOT B를 계산
    not(notA, inA);
    not(notB, inB);

    // NOT A AND NOT B를 계산
    and(andResult, notA, notB);

    // 최종 OR 결과를 위한 NOT(NOT A AND NOT B) 계산
    not(outOR, andResult);
    ////////////////////////

endmodule