/* CSED273 lab5 experiment 1 */
/* lab5_1.v */

`timescale 1ps / 1fs

/* Implement adder 
 * You must not use Verilog arithmetic operators */
module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    /* Add your code here */
    wire [3:0] C1;
    wire [3:0] C2;
    wire [3:0] C;
    wire [3:0] S;
    
    assign S[0] = x[0]^y[0];
    assign C1[0] =  x[0]&y[0]; 
    assign out[0]= S[0]^c_in;
    assign C2[0]=S[0]&c_in;
    assign C[0]=C1[0]|C2[0];
    
    assign S[1] = x[1]^y[1];
    assign C1[1] =  x[1]&y[1]; 
    assign out[1]= S[1]^C[0];
    assign C2[1]=S[1]&C[0];
    assign C[1]=C1[1]|C2[1];
    
    assign S[2] = x[2]^y[2];
    assign C1[2] =  x[2]&y[2]; 
    assign out[2]= S[2]^C[1];
    assign C2[2]=S[2]&C[1];
    assign C[2]=C1[2]|C2[2];
    
    assign S[3] = x[3]^y[3];
    assign C1[3] =  x[3]&y[3]; 
    assign out[3]= S[3]^C[2];
    assign C2[3]=S[3]&C[2];
    assign C[3]=C1[3]|C2[3];
    
    assign c_out=C[3];
    ////////////////////////

endmodule

/* Implement arithmeticUnit with adder module
 * You must use one adder module.
 * You must not use Verilog arithmetic operators */
module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    /* Add your code here */
    wire [3:0] A;
    
   assign  A[3] = (select[2]&(~y[3]))|(select[1]&y[3]);
   assign  A[2] = (select[2]&(~y[2]))|(select[1]&y[2]);
   assign  A[1] = (select[2]&(~y[1]))|(select[1]&y[1]);
   assign  A[0] = (select[2]&(~y[0]))|(select[1]&y[0]);
    
   adder Adder(x[3:0],A[3:0],select[0],out[3:0], c_out);
    ////////////////////////

endmodule

/* Implement 4:1 mux */
module mux4to1(
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////
    /* Add your code here */
    assign out = (in[0]&(~select[1])&(~select[0]))|(in[1]&(~select[1])&(select[0]))|(in[2]&(select[1])&(~select[0]))|(in[3]&(select[1])&(select[0]));
    ////////////////////////

endmodule

/* Implement logicUnit with mux4to1 */
module logicUnit(
    input [3:0] x,
    input [3:0] y,
    input [1:0] select,
    output [3:0] out
);

    ////////////////////////
    /* Add your code here */
    wire [3:0] out0;
    wire [3:0] out1;
    wire [3:0] out2;
    wire [3:0] out3;
    
    assign out0[0]= x[0]&y[0];
    assign out0[1]=x[0]|y[0];
    assign out0[2]=x[0]^y[0];
    assign out0[3]=~x[0];
    
    assign out1[0]= x[1]&y[1];
    assign out1[1]=x[1]|y[1];
    assign out1[2]=x[1]^y[1];
    assign out1[3]=~x[1];
    
    assign out2[0]= x[2]&y[2];
    assign out2[1]=x[2]|y[2];
    assign out2[2]=x[2]^y[2];
    assign out2[3]=~x[2];
    
    assign out3[0]= x[3]&y[3];
    assign out3[1]=x[3]|y[3];
    assign out3[2]=x[3]^y[3];
    assign out3[3]=~x[3];
    
    mux4to1 Mux0(out0[3:0],select[1:0],out[0]);
    mux4to1 Mux1(out1[3:0],select[1:0],out[1]);
    mux4to1 Mux2(out2[3:0],select[1:0],out[2]);
    mux4to1 Mux3(out3[3:0],select[1:0],out[3]);
    ////////////////////////

endmodule

/* Implement 2:1 mux */
module mux2to1(
    input [1:0] in,
    input  select,
    output out
);

    ////////////////////////
    /* Add your code here */
    assign out= ((~select)&in[0])|(select&in[1]);
    ////////////////////////

endmodule

/* Implement ALU with mux2to1 */
module lab5_1(
    input [3:0] x,
    input [3:0] y,
    input [3:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    /* Add your code here */
    wire [3:0] ARU;
    wire [3:0] LU;
    wire [1:0] output0;
    wire [1:0] output1;
    wire [1:0] output2;
    wire [1:0] output3;
    
    arithmeticUnit Arithmetic(x[3:0],y[3:0],select[2:0],ARU[3:0],c_out);
    logicUnit Logic(x[3:0],y[3:0],select[1:0],LU[3:0]);
    
    assign output0[0] = ARU[0];
    assign output0[1] = LU[0];
    
    assign output1[0] = ARU[1];
    assign output1[1] = LU[1];
    
    assign output2[0] = ARU[2];
    assign output2[1] = LU[2];
    
    assign output3[0] = ARU[3];
    assign output3[1] = LU[3];
    
    mux2to1 selection0(output0[1:0],select[3],out[0]);
    mux2to1 selection1(output1[1:0],select[3],out[1]);
    mux2to1 selection2(output2[1:0],select[3],out[2]);
    mux2to1 selection3(output3[1:0],select[3],out[3]);
    ////////////////////////

endmodule
