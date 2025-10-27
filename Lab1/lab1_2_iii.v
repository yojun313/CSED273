/* CSED273 lab1 experiment 2_iii */
/* lab1_2_iii.v */


module lab1_2_iii(outAND, outOR, outNOT, inA, inB);
    output wire outAND, outOR, outNOT;
    input wire inA, inB;

    AND myAND(outAND, inA, inB);
    OR myOR(outOR, inA, inB);
    NOT myNOT(outNOT, inA);

endmodule

module AND(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB; 

    ////////////////////////
    /* Add your code here */
    wire nandOut;
    nand(nandOut, inA, inB); // Use nand gate
    nand(outAND, nandOut, nandOut); // Double nand to simulate AND
    ////////////////////////

endmodule

module OR(outOR, inA, inB);
    output wire outOR;
    input wire inA, inB; 
    
    ////////////////////////
    /* Add your code here */
    wire nandA, nandB;
    nand(nandA, inA, inA); // Simulate NOT A
    nand(nandB, inB, inB); // Simulate NOT B
    nand(outOR, nandA, nandB); // nand of NOT A and NOT B simulates OR
    ////////////////////////

endmodule

module NOT(outNOT, inA);
    output wire outNOT;
    input wire inA; 

    ////////////////////////
    /* Add your code here */
    nand(outNOT, inA, inA); // Double input nand simulates NOT
    ////////////////////////

endmodule
