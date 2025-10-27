/* CSED273 lab3 experiment 2 */
/* lab3_2.v */


/* Implement Prime Number Indicator & Multiplier Indicator
 * You may use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
 
/* 11: out_mul[4], 7: out_mul[3], 5: out_mul[2],
 * 3: out_mul[1], 2: out_mul[0] */
module lab3_2(
    input wire [3:0] in,
    output wire out_prime,
    output wire [4:0] out_mul
    );

    ////////////////////////
    /* Add your code here */
    // Prime number detection (2, 3, 5, 7, 11, 13 are the primes in the range 0-15)
    assign out_prime = (in == 4'd2) | (in == 4'd3) | (in == 4'd5) | 
                       (in == 4'd7) | (in == 4'd11) | (in == 4'd13);

    // Multiples detection
    // For 2: 2, 4, 6, 8, 10, 12, 14
    assign out_mul[0] = ~in[0];  // Check if the least significant bit is 0 (even number)

    // For 3: 3, 6, 9, 12, 15
    assign out_mul[1] = (in == 4'd3) | (in == 4'd6) | (in == 4'd9) | 
                        (in == 4'd12) | (in == 4'd15);

    // For 5: 5, 10, 15
    assign out_mul[2] = (in == 4'd5) | (in == 4'd10) | (in == 4'd15);

    // For 7: 7, 14
    assign out_mul[3] = (in == 4'd7) | (in == 4'd14);

    // For 11: 11 (only 11 is a multiple within the range 0-15)
    assign out_mul[4] = (in == 4'd11);
    ////////////////////////

endmodule