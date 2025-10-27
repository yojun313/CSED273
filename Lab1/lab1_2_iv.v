/* CSED273 lab1 experiment 2_iv */
/* lab1_2_iv.v */


module lab1_2_iv(outAND, outOR, outNOT, inA, inB);
    output wire outAND, outOR, outNOT;
    input wire inA, inB;

    AND(outAND, inA, inB);
    OR(outOR, inA, inB);
    NOT(outNOT, inA);

endmodule


/* Implement AND, OR, and NOT modules with {NOR}
 * You are only allowed to wire modules below
 * i.e.) No and, or, not, etc. Only nor, AND, OR, NOT are available*/
module AND(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB; 

    ////////////////////////
    /* Add your code here */
    wire notA, notB, tempOut;

    nor(notA, inA, inA); // NOT A
    nor(notB, inB, inB); // NOT B
    nor(tempOut, notA, notB); // NOT A OR NOT B
    nor(outAND, tempOut, tempOut); // NOT(NOT A OR NOT B), which is AND
    ////////////////////////

endmodule

module OR(outOR, inA, inB); 
    output wire outOR;
    input wire inA, inB;

    ////////////////////////
    /* Add your code here */
    wire notA, notB;
    
    // Create NOT versions of A and B using NOR
    nor(notA, inA, inA);
    nor(notB, inB, inB);
    
    // The actual OR operation through NOR gates
    nor(outOR, notA, notB);
    ////////////////////////

endmodule

module NOT(outNOT, inA);
    output wire outNOT;
    input wire inA; 

    ////////////////////////
    /* Add your code here */
    nor(outNOT, inA, inA); // NOT operation
    ////////////////////////

endmodule