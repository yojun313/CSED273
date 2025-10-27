/* CSED273 lab2 experiment 2 */
/* lab2_2.v */

/* Simplifed equation by K-Map method
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_2(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT_2 cal_gt2(outGT, inA, inB);
    CAL_EQ_2 cal_eq2(outEQ, inA, inB);
    CAL_LT_2 cal_lt2(outLT, inA, inB);

endmodule

/* Implement output about "A>B" */
module CAL_GT_2(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    // outGT는 inA의 최상위 비트가 inB의 최상위 비트보다 클 때, 혹은
    // 최상위 비트가 동일하고 inA의 최하위 비트가 inB의 최하위 비트보다 클 때 참이다
    assign outGT = (inA[1] & ~inB[1]) | (~inB[1] & inA[0] & ~inB[0]);
    ////////////////////////

endmodule

/* Implement output about "A=B" */
module CAL_EQ_2(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    // outEQ는 inA와 inB의 모든 비트가 일치할 때 참
    // XOR 연산 결과가 0이면 두 비트가 같다는 것을 의미하므로, 여기서는 동등 연산자를 사용한다
    assign outEQ = ((inA[1] ~^ inB[1]) & (inA[0] ~^ inB[0]));
    ////////////////////////

endmodule

/* Implement output about "A<B" */
module CAL_LT_2(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    // outLT는 inA의 최상위 비트가 inB의 최상위 비트보다 작을 때, 혹은
    // 최상위 비트가 동일하고 inA의 최하위 비트가 inB의 최하위 비트보다 작을 때 참입니다.
    assign outLT = (~inA[1] & inB[1]) | (~inA[1] & ~inA[0] & inB[0]);
    ////////////////////////

endmodule