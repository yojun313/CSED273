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
    // inA[1]�� inB[1]���� , ���� ��Ʈ�� ���� inA[0]�� inB[0]���� Ŭ ��� outGT�� 1�� ����
    assign outGT = (inA[1] & ~inB[1]) | // A�� ���� ��Ʈ�� B���� Ŭ ��
                   (inA[1] & ~inB[0]) | // A�� ���� ��Ʈ�� 1�̰�, B�� ���� ��Ʈ�� 0�� ��
                   (~inB[1] & inA[0]) | // B�� ���� ��Ʈ�� 0�̰�, A�� ���� ��Ʈ�� 1�� ��
                   (inA[1] & inA[0] & ~inB[1] & ~inB[0]); // A�� 11�̰� B�� 00�� ��
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
    // inA�� inB�� ��� ��Ʈ�� ������ ��� outEQ�� 1�� ����
    assign outEQ = (~inA[1] & ~inA[0] & ~inB[1] & ~inB[0]) | // �� �� 00�� ��
                   (~inA[1] & inA[0] & ~inB[1] & inB[0]) | // �� �� 01�� ��
                   (inA[1] & ~inA[0] & inB[1] & ~inB[0]) | // �� �� 10�� ��
                   (inA[1] & inA[0] & inB[1] & inB[0]); // �� �� 11�� ��
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
    // inA[1]�� inB[1]���� �۰ų�, ���� ��Ʈ�� ���� inA[0]�� inB[0]���� ���� ��� outLT�� 1�� ����
    assign outLT = (~inA[1] & inB[1]) | // A�� ���� ��Ʈ�� B���� ���� ��
                   (~inA[1] & inB[0]) | // A�� ���� ��Ʈ�� 0�̰�, B�� ���� ��Ʈ�� 1�� ��
                   (inB[1] & ~inA[0]) | // B�� ���� ��Ʈ�� 1�̰�, A�� ���� ��Ʈ�� 0�� ��
                   (~inA[1] & ~inA[0] & inB[1] & inB[0]); // A�� 00�̰� B�� 11�� ��
    ////////////////////////

endmodule