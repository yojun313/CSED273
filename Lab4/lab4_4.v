/* CSED273 lab4 experiment 4 */
/* lab4_4.v */

/* Implement 5x3 Binary Mutliplier
 * You must use lab4_2 module in lab4_2.v
 * You cannot use fullAdder or halfAdder module directly
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_4(
    input [4:0]in_a,
    input [2:0]in_b,
    output [7:0]out_m
    );

    ////////////////////////
    wire [4:0]x0;
    wire [4:0]y0;
    wire [4:0]z0;
    wire [4:0]x1;
    wire [4:0]y1;
    wire [4:0]z1;
    wire c1,c2;
    and(x0[4],in_b[1],in_a[4]);
    and(x0[3],in_b[1],in_a[3]);
    and(x0[2],in_b[1],in_a[2]);
    and(x0[1],in_b[1],in_a[1]);
    and(x0[0],in_b[1],in_a[0]);
    assign y0[4]=1'b0;
    and(y0[3],in_b[0],in_a[4]);
    and(y0[2],in_b[0],in_a[3]);
    and(y0[1],in_b[0],in_a[2]);
    and(y0[0],in_b[0],in_a[1]);
    lab4_2 r0(x0,y0,0,z0,c1);
    
    and(x1[4],in_b[2],in_a[4]);
    and(x1[3],in_b[2],in_a[3]);
    and(x1[2],in_b[2],in_a[2]);
    and(x1[1],in_b[2],in_a[1]);
    and(x1[0],in_b[2],in_a[0]);
    assign y1[0]=z0[1];
    assign y1[1]=z0[2];
    assign y1[2]=z0[3];
    assign y1[3]=z0[4];
    assign y1[4]=c1;
    lab4_2 r1(x1,y1,0,z1,c2);
    
    assign out_m[7]=c2;
    assign out_m[6]=z1[4];
    assign out_m[5]=z1[3];
    assign out_m[4]=z1[2];
    assign out_m[3]=z1[1];
    assign out_m[2]=z1[0];
    assign out_m[1]=z0[0];
    and(out_m[0],in_b[0],in_a[0]);
    ////////////////////////
    
endmodule