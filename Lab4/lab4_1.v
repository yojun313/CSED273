/* CSED273 lab4 experiment 1 */
/* lab4_1.v */


/* Implement Half Adder
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module halfAdder(
    input in_a,
    input in_b,
    output out_s,
    output out_c
    );

    ////////////////////////
    xor(out_s,in_a,in_b);
    and(out_c,in_a,in_b);
    ////////////////////////

endmodule

/* Implement Full Adder
 * You must use halfAdder module
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module fullAdder(
    input in_a,
    input in_b,
    input in_c,
    output out_s,
    output out_c
    );

    ////////////////////////
    wire l1,l2,l3;
    halfAdder h1(in_a,in_b,l1,l2);
    halfAdder h2(l1,in_c,out_s,l3);
    or(out_c,l2,l3);
    ////////////////////////

endmodule