/* CSED273 lab2 experiment 1 */
/* lab2_1.v */

/* Unsimplifed equation
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_1(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT cal_gt(outGT, inA, inB);
    CAL_EQ cal_eq(outEQ, inA, inB);
    CAL_LT cal_lt(outLT, inA, inB);
    
endmodule

/* Implement output about "A>B" */
module CAL_GT(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    // inA[1]이 inB[1]보다 , 상위 비트가 같고 inA[0]이 inB[0]보다 클 경우 outGT를 1로 설정
    assign outGT = (inA[1] & ~inB[1]) | // A의 상위 비트가 B보다 클 때
                   (inA[1] & ~inB[0]) | // A의 상위 비트가 1이고, B의 하위 비트가 0일 때
                   (~inB[1] & inA[0]) | // B의 상위 비트가 0이고, A의 하위 비트가 1일 때
                   (inA[1] & inA[0] & ~inB[1] & ~inB[0]); // A가 11이고 B가 00일 때
    ////////////////////////

endmodule

/* Implement output about "A=B" */
module CAL_EQ(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    // inA와 inB의 모든 비트가 동일할 경우 outEQ를 1로 설정
    assign outEQ = (~inA[1] & ~inA[0] & ~inB[1] & ~inB[0]) | // 둘 다 00일 때
                   (~inA[1] & inA[0] & ~inB[1] & inB[0]) | // 둘 다 01일 때
                   (inA[1] & ~inA[0] & inB[1] & ~inB[0]) | // 둘 다 10일 때
                   (inA[1] & inA[0] & inB[1] & inB[0]); // 둘 다 11일 때
    ////////////////////////

endmodule

/* Implement output about "A<B" */
module CAL_LT(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    // inA[1]이 inB[1]보다 작거나, 상위 비트가 같고 inA[0]이 inB[0]보다 작을 경우 outLT를 1로 설정
    assign outLT = (~inA[1] & inB[1]) | // A의 상위 비트가 B보다 작을 때
                   (~inA[1] & inB[0]) | // A의 상위 비트가 0이고, B의 하위 비트가 1일 때
                   (inB[1] & ~inA[0]) | // B의 상위 비트가 1이고, A의 하위 비트가 0일 때
                   (~inA[1] & ~inA[0] & inB[1] & inB[0]); // A가 00이고 B가 11일 때
    ////////////////////////

endmodule