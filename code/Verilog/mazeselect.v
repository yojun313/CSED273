`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/06 23:26:48
// Design Name: 
// Module Name: mazeselect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module T0(
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output T0
    );
    wire Q3_n, Q2_n, Q1_n, Q0_n, X0_n, X1_n;

    // Inverters
    not (Q3_n, Q3);
    not (Q2_n, Q2);
    not (Q1_n, Q1);
    not (Q0_n, Q0);
    not (X0_n, X0);
    not (X1_n, X1);

    // Intermediate terms for each part of the expression
    wire term1, term2, term3, term4;
    wire term1_part1, term1_part2, term1_part3;
    wire term2_part1, term2_part2;
    wire term3_part1, term3_part2, term3_part3;
    wire term4_part1, term4_part2, term4_part3;

    // First term: Q3'Q2'(Q1' + Q0 + X1X0')
    and (term1_part1, X1, X0_n);
    or  (term1_intermediate, Q1_n, Q0, term1_part1);
    and (term1, term1_intermediate, Q3_n, Q2_n);

    // Second term: Q3'Q2(Q0 + X1X0')
    and (term2_part1, X1, X0_n);
    or  (term2_intermediate, Q0, term2_part1);
    and (term2, term2_intermediate, Q3_n, Q2);

    // Third term: Q3Q2'(Q0 + Q1'X1'X0' + Q1X1X0')
    and (term3_part1, Q1_n, X1_n, X0_n);
    and (term3_part2, Q1, X1, X0_n);
    or  (term3_intermediate, Q0, term3_part1, term3_part2);
    and (term3, term3_intermediate, Q3, Q2_n);

    // Fourth term: Q3Q2(Q0 + Q1'X1'X0' + Q1X1X0')
    and (term4_part1, Q1_n, X1_n, X0_n);
    and (term4_part2, Q1, X1, X0_n);
    or  (term4_intermediate, Q0, term4_part1, term4_part2);
    and (term4, term4_intermediate, Q3, Q2);

    // Final output
    or (T0, term1, term2, term3, term4);
endmodule


module T1(
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output T1
    );
    
    wire Q3_n, Q2_n, Q1_n, Q0_n, X0_n, X1_n;

    // Inverters
    not (Q3_n, Q3);
    not (Q2_n, Q2);
    not (Q1_n, Q1);
    not (Q0_n, Q0);
    not (X0_n, X0);
    not (X1_n, X1);

    // Intermediate terms for each part of the expression
    wire term1, term2, term3, term4;
    wire term1_part1, term1_part2, term1_part3, term1_part4;
    wire term2_part1, term2_part2, term2_part3, term2_part4;
    wire term3_part1, term3_part2, term3_part3, term3_part4;
    wire term4_part1, term4_part2, term4_part3, term4_part4;

    // First term: Q3'Q2'(Q1Q0 + Q1X1' + Q1X0 + Q0X1'X0')
    and (term1_part1, Q1, Q0);
    and (term1_part2, Q1, X1_n);
    and (term1_part3, Q1, X0);
    and (term1_part4, Q0, X1_n, X0_n);
    or  (term1_intermediate, term1_part1, term1_part2, term1_part3, term1_part4);
    and (term1, term1_intermediate, Q3_n, Q2_n);

    // Second term: Q3'Q2(Q1Q0 + Q1X1' + Q1X0 + Q0X1'X0')
    and (term2_part1, Q1, Q0);
    and (term2_part2, Q1, X1_n);
    and (term2_part3, Q1, X0);
    and (term2_part4, Q0, X1_n, X0_n);
    or  (term2_intermediate, term2_part1, term2_part2, term2_part3, term2_part4);
    and (term2, term2_intermediate, Q3_n, Q2);

    // Third term: Q3Q2'(Q1X1' + Q1X0 + Q1Q0 + Q0X1X0')
    and (term3_part1, Q1, X1_n);
    and (term3_part2, Q1, X0);
    and (term3_part3, Q1, Q0);
    and (term3_part4, Q0, X1, X0_n);
    or  (term3_intermediate, term3_part1, term3_part2, term3_part3, term3_part4);
    and (term3, term3_intermediate, Q3, Q2_n);

    // Fourth term: Q3Q2(Q1X1' + Q1X0 + Q0X1'X0')
    and (term4_part1, Q1, X1_n);
    and (term4_part2, Q1, X0);
    and (term4_part3, Q0, X1_n, X0_n);
    or  (term4_intermediate, term4_part1, term4_part2, term4_part3);
    and (term4, term4_intermediate, Q3, Q2);

    // Final output
    or (T1, term1, term2, term3, term4);
endmodule



module T2(
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output T2
    );
    wire Q3_n, Q2_n, Q1_n, Q0_n, X0_n, X1_n;

    // Inverters
    not (Q3_n, Q3);
    not (Q2_n, Q2);
    not (Q1_n, Q1);
    not (Q0_n, Q0);
    not (X0_n, X0);
    not (X1_n, X1);

    // Intermediate terms for each part of the expression
    wire term1, term2, term3, term4;
    wire term2_part1, term2_part2, term2_part3, term2_part4;
    wire term4_part1, term4_part2, term4_part3;

    // First term: Q3'Q2'Q1Q0X1X0'
    and (term1, Q3_n, Q2_n, Q1, Q0, X1, X0_n);

    // Second term: Q3'Q2(Q1X1' + X0 + Q0X1 + Q1'Q0'X1')
    and (term2_part1, Q1, X1_n);
    and (term2_part2, Q0, X1);
    and (term2_part3, Q1_n, Q0_n, X1_n);
    or (term2_intermediate, term2_part1, X0, term2_part2, term2_part3);
    and (term2, Q3_n, Q2, term2_intermediate);

    // Third term: Q3Q2'Q1Q0X1'X0'
    and (term3, Q3, Q2_n, Q1, Q0, X1_n, X0_n);

    // Fourth term: Q3Q2(X0 + Q1'X1 + Q1X1')
    and (term4_part1, Q1_n, X1);
    and (term4_part2, Q1, X1_n);
    or (term4_intermediate, X0, term4_part1, term4_part2);
    and (term4, Q3, Q2, term4_intermediate);

    // Final output
    or (T2, term1, term2, term3, term4);
endmodule


module T3(
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output T3
    );
    wire Q3_n, Q2_n, Q1_n, Q0_n, X0_n, X1_xor_Q1_Q0;

    // Inverters
    not (Q3_n, Q3);
    not (Q2_n, Q2);
    not (Q1_n, Q1);
    not (Q0_n, Q0);
    not (X0_n, X0);

    // XOR gate
    xor (X1_xor_Q1_Q0, X1, Q1, Q0);

    // Intermediate terms
    wire term1, term2, term3;
    wire term2_part1, term2_part2;
    wire term3_part1, term3_part2, term3_part3;

    // First term: Q3'Q2Q1Q0X1X0'
    and (term1, Q3_n, Q2, Q1, Q0, X1, X0_n);

    // Second term: Q3Q2'(X0 + X1?Q1?Q0)
    and (term2_part1, Q3, Q2_n);
    or (term2_part2, X0, X1_xor_Q1_Q0);
    and (term2, term2_part1, term2_part2);

    // Third term: Q3Q2(X0 + Q1'X1 + Q1X1')
    and (term3_part1, Q1_n, X1);
    and (term3_part2, Q1, X1_n);
    or (term3_part3, X0, term3_part1, term3_part2);
    and (term3, Q3, Q2, term3_part3);

    // Final output
    or (T3, term1, term2, term3);
endmodule

module T_flip_flop (
    input clk,
    input reset,
    input T,
    output reg Q
);
    always @(negedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else if (T)
            Q <= ~Q;
    end
endmodule

module T0_flip_flop(
    input clk,
    input reset,
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output Q
);
    wire T0;
    
    T0 T0_inst (
        .Q3(Q3),
        .Q2(Q2),
        .Q1(Q1),
        .Q0(Q0),
        .X1(X1),
        .X0(X0),
        .T0(T0)
    );

    T_flip_flop T_ff0 (
        .clk(clk),
        .reset(reset),
        .T(T0),
        .Q(Q)
    );
endmodule

module T1_flip_flop(
    input clk,
    input reset,
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output Q
);
    wire T1;
    
    T1 T1_inst (
        .Q3(Q3),
        .Q2(Q2),
        .Q1(Q1),
        .Q0(Q0),
        .X1(X1),
        .X0(X0),
        .T1(T1)
    );

    T_flip_flop T_ff1 (
        .clk(clk),
        .reset(reset),
        .T(T1),
        .Q(Q)
    );
endmodule

module T2_flip_flop(
    input clk,
    input reset,
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output Q
);
    wire T2;
    
    T2 T2_inst (
        .Q3(Q3),
        .Q2(Q2),
        .Q1(Q1),
        .Q0(Q0),
        .X1(X1),
        .X0(X0),
        .T2(T2)
    );

    T_flip_flop T_ff2 (
        .clk(clk),
        .reset(reset),
        .T(T2),
        .Q(Q)
    );
endmodule

module T3_flip_flop(
    input clk,
    input reset,
    input Q3, Q2, Q1, Q0,
    input X1, X0,
    output Q
);
    wire T3;
    
    T3 T3_inst (
        .Q3(Q3),
        .Q2(Q2),
        .Q1(Q1),
        .Q0(Q0),
        .X1(X1),
        .X0(X0),
        .T3(T3)
    );

    T_flip_flop T_ff3 (
        .clk(clk),
        .reset(reset),
        .T(T3),
        .Q(Q)
    );
endmodule

module Zcal(
    input Q3, Q2, Q1, Q0,
    output Z
);
    and(Z,Q3,Q2,Q1,Q0);
endmodule

module mux(
    input wire [31:0] data_input,
    input wire [4:0] select_input,
    output wire out
    );
    
    wire [31:0] and_gates;

    // AND gates to generate the select signals
    and(and_gates[0], data_input[0], ~select_input[4], ~select_input[3], ~select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[1], data_input[1], ~select_input[4], ~select_input[3], ~select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[2], data_input[2], ~select_input[4], ~select_input[3], ~select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[3], data_input[3], ~select_input[4], ~select_input[3], ~select_input[2],  select_input[1],  select_input[0]);
    and(and_gates[4], data_input[4], ~select_input[4], ~select_input[3],  select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[5], data_input[5], ~select_input[4], ~select_input[3],  select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[6], data_input[6], ~select_input[4], ~select_input[3],  select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[7], data_input[7], ~select_input[4], ~select_input[3],  select_input[2],  select_input[1],  select_input[0]);
    and(and_gates[8], data_input[8], ~select_input[4],  select_input[3], ~select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[9], data_input[9], ~select_input[4],  select_input[3], ~select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[10], data_input[10], ~select_input[4],  select_input[3], ~select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[11], data_input[11], ~select_input[4],  select_input[3], ~select_input[2],  select_input[1],  select_input[0]);
    and(and_gates[12], data_input[12], ~select_input[4],  select_input[3],  select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[13], data_input[13], ~select_input[4],  select_input[3],  select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[14], data_input[14], ~select_input[4],  select_input[3],  select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[15], data_input[15], ~select_input[4],  select_input[3],  select_input[2],  select_input[1],  select_input[0]);
    and(and_gates[16], data_input[16],  select_input[4], ~select_input[3], ~select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[17], data_input[17],  select_input[4], ~select_input[3], ~select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[18], data_input[18],  select_input[4], ~select_input[3], ~select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[19], data_input[19],  select_input[4], ~select_input[3], ~select_input[2],  select_input[1],  select_input[0]);
    and(and_gates[20], data_input[20],  select_input[4], ~select_input[3],  select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[21], data_input[21],  select_input[4], ~select_input[3],  select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[22], data_input[22],  select_input[4], ~select_input[3],  select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[23], data_input[23],  select_input[4], ~select_input[3],  select_input[2],  select_input[1],  select_input[0]);
    and(and_gates[24], data_input[24],  select_input[4],  select_input[3], ~select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[25], data_input[25],  select_input[4],  select_input[3], ~select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[26], data_input[26],  select_input[4],  select_input[3], ~select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[27], data_input[27],  select_input[4],  select_input[3], ~select_input[2],  select_input[1],  select_input[0]);
    and(and_gates[28], data_input[28],  select_input[4],  select_input[3],  select_input[2], ~select_input[1], ~select_input[0]);
    and(and_gates[29], data_input[29],  select_input[4],  select_input[3],  select_input[2], ~select_input[1],  select_input[0]);
    and(and_gates[30], data_input[30],  select_input[4],  select_input[3],  select_input[2],  select_input[1], ~select_input[0]);
    and(and_gates[31], data_input[31],  select_input[4],  select_input[3],  select_input[2],  select_input[1],  select_input[0]);

    // OR gate to combine the outputs of the AND gates
    or(out, and_gates[0], and_gates[1], and_gates[2], and_gates[3], and_gates[4], and_gates[5], and_gates[6], and_gates[7], 
       and_gates[8], and_gates[9], and_gates[10], and_gates[11], and_gates[12], and_gates[13], and_gates[14], and_gates[15], 
       and_gates[16], and_gates[17], and_gates[18], and_gates[19], and_gates[20], and_gates[21], and_gates[22], and_gates[23], 
       and_gates[24], and_gates[25], and_gates[26], and_gates[27], and_gates[28], and_gates[29], and_gates[30], and_gates[31]);

endmodule

module mazeselect(
    input clk,
    input reset,
    input wire [3:0] Q_in,  // Q 값을 외부에서 입력받음
    input wire [1:0] X,
    output wire [3:0] Q_out, // Q 출력
    output wire [63:0] maze
);
    wire Z;
    wire Q0_next, Q1_next, Q2_next, Q3_next;

    // FF
    T0_flip_flop TFF0(clk, reset, Q_in[3], Q_in[2], Q_in[1], Q_in[0], X[1], X[0], Q0_next);
    T1_flip_flop TFF1(clk, reset, Q_in[3], Q_in[2], Q_in[1], Q_in[0], X[1], X[0], Q1_next);
    T2_flip_flop TFF2(clk, reset, Q_in[3], Q_in[2], Q_in[1], Q_in[0], X[1], X[0], Q2_next);
    T3_flip_flop TFF3(clk, reset, Q_in[3], Q_in[2], Q_in[1], Q_in[0], X[1], X[0], Q3_next);
    assign Q_out = {Q3_next, Q2_next, Q1_next, Q0_next}; // Q 출력을 외부로 내보냄
    Zcal Zz(Q_in[3], Q_in[2], Q_in[1], Q_in[0], Z);

    // select input, MUX output
    wire [4:0] select_input;
    wire [63:0] maze_out;
    assign select_input[0] = Q_in[0];
    assign select_input[1] = Q_in[1];
    assign select_input[2] = Q_in[2];
    assign select_input[3] = Q_in[3];
    assign select_input[4] = Z;
    //MUX input
    wire [31:0] data_input00;
    wire [31:0] data_input01;
    wire [31:0] data_input02;
    wire [31:0] data_input03;
    wire [31:0] data_input04;
    wire [31:0] data_input05;
    wire [31:0] data_input06;
    wire [31:0] data_input07;
    wire [31:0] data_input10;
    wire [31:0] data_input11;
    wire [31:0] data_input12;
    wire [31:0] data_input13;
    wire [31:0] data_input14;
    wire [31:0] data_input15;
    wire [31:0] data_input16;
    wire [31:0] data_input17;
    wire [31:0] data_input20;
    wire [31:0] data_input21;
    wire [31:0] data_input22;
    wire [31:0] data_input23;
    wire [31:0] data_input24;
    wire [31:0] data_input25;
    wire [31:0] data_input26;
    wire [31:0] data_input27;
    wire [31:0] data_input30;
    wire [31:0] data_input31;
    wire [31:0] data_input32;
    wire [31:0] data_input33;
    wire [31:0] data_input34;
    wire [31:0] data_input35;
    wire [31:0] data_input36;
    wire [31:0] data_input37;
    wire [31:0] data_input40;
    wire [31:0] data_input41;
    wire [31:0] data_input42;
    wire [31:0] data_input43;
    wire [31:0] data_input44;
    wire [31:0] data_input45;
    wire [31:0] data_input46;
    wire [31:0] data_input47;
    wire [31:0] data_input50;
    wire [31:0] data_input51;
    wire [31:0] data_input52;
    wire [31:0] data_input53;
    wire [31:0] data_input54;
    wire [31:0] data_input55;
    wire [31:0] data_input56;
    wire [31:0] data_input57;
    wire [31:0] data_input60;
    wire [31:0] data_input61;
    wire [31:0] data_input62;
    wire [31:0] data_input63;
    wire [31:0] data_input64;
    wire [31:0] data_input65;
    wire [31:0] data_input66;
    wire [31:0] data_input67;
    wire [31:0] data_input70;
    wire [31:0] data_input71;
    wire [31:0] data_input72;
    wire [31:0] data_input73;
    wire [31:0] data_input74;
    wire [31:0] data_input75;
    wire [31:0] data_input76;
    wire [31:0] data_input77;
    //MUX input data
    assign data_input00 = 32'b00000000000000000000000000000001;
    assign data_input01 = 32'b00000000000000000000000000000001;
    assign data_input02 = 32'b00000000000000000000000000000001;
    assign data_input03 = 32'b11111111111111110000000000000001;
    assign data_input04 = 32'b11111111111111110000000000000001;
    assign data_input05 = 32'b00000000000000000011111111111111;
    assign data_input06 = 32'b00000000000000000111111111111111;
    assign data_input07 = 32'b00000000000000001111111111111111;
    assign data_input10 = 32'b00000000000000000000000000000000;
    assign data_input11 = 32'b00000000000000000000000000000000;
    assign data_input12 = 32'b11111111111111110000000000000000;
    assign data_input13 = 32'b00000000000000000000000000000000;
    assign data_input14 = 32'b00000000000000000000000000000000;
    assign data_input15 = 32'b11111111111111110001111111111110;
    assign data_input16 = 32'b00000000000000000000000000000000;
    assign data_input17 = 32'b00000000000000000000000000000001;
    assign data_input20 = 32'b00000000000000000000000000000000;
    assign data_input21 = 32'b11111111111111110000000000000000;
    assign data_input22 = 32'b00000000000000000000000000000000;
    assign data_input23 = 32'b00000000000000000000000000000000;
    assign data_input24 = 32'b00000000000000000000000000000000;
    assign data_input25 = 32'b00000000000000000000111111111110;
    assign data_input26 = 32'b11111111111111110000000000000000;
    assign data_input27 = 32'b00000000000000000000000000000001;
    assign data_input30 = 32'b11111111111111110000000000000000;
    assign data_input31 = 32'b11111111111111110000000000000000;
    assign data_input32 = 32'b11111111111111110000000000000000;
    assign data_input33 = 32'b11111111111111110000000111111111;
    assign data_input34 = 32'b11111111111111110000001111111110;
    assign data_input35 = 32'b11111111111111110000011111111110;
    assign data_input36 = 32'b11111111111111110000000000000000;
    assign data_input37 = 32'b11111111111111110000000000000001;
    assign data_input40 = 32'b00000000000000000000000000000000;
    assign data_input41 = 32'b11111111111111110000000000000000;
    assign data_input42 = 32'b00000000000000000000000001111110;
    assign data_input43 = 32'b00000000000000000000000011111111;
    assign data_input44 = 32'b00000000000000000000000000000000;
    assign data_input45 = 32'b00000000000000000000000000000000;
    assign data_input46 = 32'b11111111111111110000000000000000;
    assign data_input47 = 32'b00000000000000000000000000000001;
    assign data_input50 = 32'b00000000000000000000000000000000;
    assign data_input51 = 32'b11111111111111110000000000000000;
    assign data_input52 = 32'b00000000000000000000000000111110;
    assign data_input53 = 32'b00000000000000000000000000000001;
    assign data_input54 = 32'b00000000000000000000000000000000;
    assign data_input55 = 32'b00000000000000000000000000000000;
    assign data_input56 = 32'b11111111111111110000000000000000;
    assign data_input57 = 32'b00000000000000000000000000000000;
    assign data_input60 = 32'b00000000000000000000000000000110;
    assign data_input61 = 32'b11111111111111110000000000001110;
    assign data_input62 = 32'b00000000000000000000000000011110;
    assign data_input63 = 32'b11111111111111110000000000000001;
    assign data_input64 = 32'b11111111111111110000000000000000;
    assign data_input65 = 32'b00000000000000000000000000000000;
    assign data_input66 = 32'b11111111111111110000000000000000;
    assign data_input67 = 32'b00000000000000000000000000000000;
    assign data_input70 = 32'b00000000000000000000000000000011;
    assign data_input71 = 32'b11111111111111110000000000000001;
    assign data_input72 = 32'b00000000000000000000000000000001;
    assign data_input73 = 32'b11111111111111110000000000000001;
    assign data_input74 = 32'b11111111111111110000000000000001;
    assign data_input75 = 32'b00000000000000000000000000000001;
    assign data_input76 = 32'b11111111111111110000000000000001;
    assign data_input77 = 32'b00000000000000000000000000000001;
    //64bit MUX
    mux mux00(data_input00, select_input, maze_out[0]);
    mux mux01(data_input01, select_input, maze_out[1]);
    mux mux02(data_input02, select_input, maze_out[2]);
    mux mux03(data_input03, select_input, maze_out[3]);
    mux mux04(data_input04, select_input, maze_out[4]);
    mux mux05(data_input05, select_input, maze_out[5]);
    mux mux06(data_input06, select_input, maze_out[6]);
    mux mux07(data_input07, select_input, maze_out[7]);
    mux mux10(data_input10, select_input, maze_out[8]);
    mux mux11(data_input11, select_input, maze_out[9]);
    mux mux12(data_input12, select_input, maze_out[10]);
    mux mux13(data_input13, select_input, maze_out[11]);
    mux mux14(data_input14, select_input, maze_out[12]);
    mux mux15(data_input15, select_input, maze_out[13]);
    mux mux16(data_input16, select_input, maze_out[14]);
    mux mux17(data_input17, select_input, maze_out[15]);
    mux mux20(data_input20, select_input, maze_out[16]);
    mux mux21(data_input21, select_input, maze_out[17]);
    mux mux22(data_input22, select_input, maze_out[18]);
    mux mux23(data_input23, select_input, maze_out[19]);
    mux mux24(data_input24, select_input, maze_out[20]);
    mux mux25(data_input25, select_input, maze_out[21]);
    mux mux26(data_input26, select_input, maze_out[22]);
    mux mux27(data_input27, select_input, maze_out[23]);
    mux mux30(data_input30, select_input, maze_out[24]);
    mux mux31(data_input31, select_input, maze_out[25]);
    mux mux32(data_input32, select_input, maze_out[26]);
    mux mux33(data_input33, select_input, maze_out[27]);
    mux mux34(data_input34, select_input, maze_out[28]);
    mux mux35(data_input35, select_input, maze_out[29]);
    mux mux36(data_input36, select_input, maze_out[30]);
    mux mux37(data_input37, select_input, maze_out[31]);
    mux mux40(data_input40, select_input, maze_out[32]);
    mux mux41(data_input41, select_input, maze_out[33]);
    mux mux42(data_input42, select_input, maze_out[34]);
    mux mux43(data_input43, select_input, maze_out[35]);
    mux mux44(data_input44, select_input, maze_out[36]);
    mux mux45(data_input45, select_input, maze_out[37]);
    mux mux46(data_input46, select_input, maze_out[38]);
    mux mux47(data_input47, select_input, maze_out[39]);
    mux mux50(data_input50, select_input, maze_out[40]);
    mux mux51(data_input51, select_input, maze_out[41]);
    mux mux52(data_input52, select_input, maze_out[42]);
    mux mux53(data_input53, select_input, maze_out[43]);
    mux mux54(data_input54, select_input, maze_out[44]);
    mux mux55(data_input55, select_input, maze_out[45]);
    mux mux56(data_input56, select_input, maze_out[46]);
    mux mux57(data_input57, select_input, maze_out[47]);
    mux mux60(data_input60, select_input, maze_out[48]);
    mux mux61(data_input61, select_input, maze_out[49]);
    mux mux62(data_input62, select_input, maze_out[50]);
    mux mux63(data_input63, select_input, maze_out[51]);
    mux mux64(data_input64, select_input, maze_out[52]);
    mux mux65(data_input65, select_input, maze_out[53]);
    mux mux66(data_input66, select_input, maze_out[54]);
    mux mux67(data_input67, select_input, maze_out[55]);
    mux mux70(data_input70, select_input, maze_out[56]);
    mux mux71(data_input71, select_input, maze_out[57]);
    mux mux72(data_input72, select_input, maze_out[58]);
    mux mux73(data_input73, select_input, maze_out[59]);
    mux mux74(data_input74, select_input, maze_out[60]);
    mux mux75(data_input75, select_input, maze_out[61]);
    mux mux76(data_input76, select_input, maze_out[62]);
    mux mux77(data_input77, select_input, maze_out[63]);
    //output maze
    assign maze = maze_out;
 
 

    
endmodule
