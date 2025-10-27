/* CSED273 lab3 experiment 1 */
/* lab3_1.v */


/* Active Low 2-to-4 Decoder
 * You must use this module to implement Active Low 4-to-16 decoder */
module decoder(
    input wire en,
    input wire [1:0] in,
    output wire [3:0] out 
    );

    nand(out[0], ~in[0], ~in[1], ~en);
    nand(out[1],  in[0], ~in[1], ~en);
    nand(out[2], ~in[0],  in[1], ~en);
    nand(out[3],  in[0],  in[1], ~en);

endmodule


/* Implement Active Low 4-to-16 Decoder
 * You may use keword "assign" and operator "&","|","~",
 * or just implement with gate-level modeling (and, or, not) */
module lab3_1(
    input wire en,
    input wire [3:0] in,
    output wire [15:0] out
    );

    ////////////////////////
    /* Add your code here */
    wire [3:0] en2; // Intermediate enable signals for the second stage decoders

    // First stage decoder using the top two bits to generate enable signals for each block of the second stage
    decoder stage1(
        .en(en),
        .in(in[3:2]),
        .out(en2)
    );

    // Second stage decoders, each taking the lower two bits of 'in' and enabled by one of the outputs of the first stage decoder
    decoder stage2_0(
        .en(en2[0]),
        .in(in[1:0]),
        .out(out[3:0])
    );
    decoder stage2_1(
        .en(en2[1]),
        .in(in[1:0]),
        .out(out[7:4])
    );
    decoder stage2_2(
        .en(en2[2]),
        .in(in[1:0]),
        .out(out[11:8])
    );
    decoder stage2_3(
        .en(en2[3]),
        .in(in[1:0]),
        .out(out[15:12])
    );
    ////////////////////////

endmodule
