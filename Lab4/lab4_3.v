/* CSED273 lab4 experiment 3 */
/* lab4_3.v */

/* Implement 5-Bit Ripple Subtractor
 * You must use lab4_2 module in lab4_2.v
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_3(
    input [4:0] in_a,
    input [4:0] in_b,
    input in_c,
    output [4:0] out_s,
    output out_c
    );

    ////////////////////////
    wire c1,c2,c3,c4,s0,s1,s2,s3,s4,l0,l1,l2,l3,l4;
    xor(l0,in_b[0],in_c);
    xor(l1,in_b[1],in_c);
    xor(l2,in_b[2],in_c);
    xor(l3,in_b[3],in_c);
    xor(l4,in_b[4],in_c);
    fullAdder f1(in_a[0],l0,in_c,s0,c1);
    fullAdder f2(in_a[1],l1,c1,s1,c2);
    fullAdder f3(in_a[2],l2,c2,s2,c3);
    fullAdder f4(in_a[3],l3,c3,s3,c4);
    fullAdder f5(in_a[4],l4,c4,s4,out_c);
    assign out_s[0]=s0;
    assign out_s[1]=s1;
    assign out_s[2]=s2;
    assign out_s[3]=s3;
    assign out_s[4]=s4;
    ////////////////////////

endmodule