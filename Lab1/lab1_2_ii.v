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

    // NOT A�� NOT B�� ���
    not(notA, inA);
    not(notB, inB);

    // NOT A AND NOT B�� ���
    and(andResult, notA, notB);

    // ���� OR ����� ���� NOT(NOT A AND NOT B) ���
    not(outOR, andResult);
    ////////////////////////

endmodule