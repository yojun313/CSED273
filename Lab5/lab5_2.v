/* CSED273 lab5 experiment 2 */
/* lab5_2.v */

`timescale 1ns / 1ps

/* Implement srLatch */
module srLatch(
    input s, r,
    output q, q_
    );

    ////////////////////////
    /* Add your code here */
    wire nq, nq_;

    // NOR gates implementation using assign statements and bitwise operators
    assign nq = ~(s | q_);
    assign nq_ = ~(r | q);
    assign q = nq;
    assign q_ = nq_;
    ////////////////////////

endmodule

/* Implement master-slave JK flip-flop with srLatch module */
module lab5_2(
    input reset_n, j, k, clk,
    output q, q_
    );

    ////////////////////////
    /* Add your code here */
    wire Rm, Sm; // Master latch inputs
    wire Rs, Ss; // Slave latch inputs
    wire P, P_;  // Master latch outputs

    // Master latch control
    assign Rm = k & q;
    assign Sm = j & q_;
    wire s_master, r_master;
    assign s_master = Sm & clk & reset_n;
    assign r_master = (Rm & clk) | ~reset_n;

    srLatch Master(
        .s(s_master),
        .r(r_master),
        .q(P),
        .q_(P_)
    );

    // Slave latch control
    wire s_slave, r_slave;
    assign s_slave = P & ~clk;
    assign r_slave = P_ & ~clk;

    srLatch Slave(
        .s(s_slave),
        .r(r_slave),
        .q(q),
        .q_(q_)
    );
    ////////////////////////
    
endmodule