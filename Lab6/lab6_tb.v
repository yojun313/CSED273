/* CSED273 lab6 experiments */
/* lab6_tb.v */

`timescale 1ps / 1fs

module lab6_tb();

    integer Passed;
    integer Failed;

    /* Define input, output and instantiate module */
    ////////////////////////
    reg reset_n1,reset_n2,reset_n3, clk;
    wire q,q_;
    wire [3:0] count_1;
    wire [7:0] count_2;
    wire [3:0] count_3;
    decade_counter C_1(
        .reset_n(reset_n1),
        .clk(clk),
        .count(count_1)
        );
    decade_counter_2digits C_2(
        .reset_n(reset_n2),
        .clk(clk),
        .count(count_2)
        );
    counter_369 C_3(
        .reset_n(reset_n3),
        .clk(clk),
        .count(count_3)
        );
    ////////////////////////

    initial begin
        Passed = 0;
        Failed = 0;

        lab6_1_test;
        lab6_2_test;
        lab6_3_test;

        $display("Lab6 Passed = %0d, Failed = %0d", Passed, Failed);
        $finish;
    end

    /* Implement test task for lab6_1 */
    task lab6_1_test;
        ////////////////////////
        integer i; 
        reg [3:0] expected_out;
        begin
        clk=0;
        reset_n1 = 0;
        reset_n2 = 0;
        reset_n3 = 0;
        #5 reset_n1 = 1;

        for(i=0;i<10;i=i+1)
        begin
            #1 clk = ~clk;
            expected_out = i;
            if(expected_out==count_1)
            begin
                Passed=Passed+1;
            end
            else
            begin
                $display("Failed) i = %0b, out: %0b (Ans: %0b)", i, count_1, expected_out);
                Failed=Failed+1;
            end
            #1 clk = ~clk;
            end
         #1 clk = 0;
         end
        ////////////////////////
    endtask

    /* Implement test task for lab6_2 */
    task lab6_2_test;
        ////////////////////////
        integer i, j; 
        reg [3:0] expected_out1;
        reg [3:0] expected_out2;
        begin
        clk=0;
        #5 reset_n2 = 0;
        #5 reset_n2 = 1;

        for(i=0;i<10;i=i+1)
        begin
            for(j=0;j<10;j=j+1)
            begin
            #1 clk = ~clk;
            expected_out1 = i;
            expected_out2 = j;
            if((count_2[7:4]==expected_out1)&&(count_2[3:0]==expected_out2))
            begin
                Passed=Passed+1;
            end
            else
            begin
                Failed=Failed+1;
            end
            #1 clk = ~clk;
            end
            end
            #1 clk = 0;
         end
        ////////////////////////
    endtask

    /* Implement test task for lab6_3 */
    task lab6_3_test;
        ////////////////////////
        integer i;
        reg [3:0] expected_out;
        begin
        clk=0;
        #5 reset_n3 = 0;
        #5 reset_n3 = 1;

        #1 clk = ~clk;
            expected_out = 0;
            if(expected_out==count_3)
            begin
                Passed=Passed+1;
            end
            else
            begin
                Failed=Failed+1;
            end
            #1 clk = ~clk;
            
         
         #1 clk = ~clk;
            expected_out = 3;
            if(expected_out==count_3)
            begin
                Passed=Passed+1;
            end
            else
            begin
                Failed=Failed+1;
            end
            #1 clk = ~clk;

        
        for(i=0;i<10;i=i+1)
        begin
            #1 clk = ~clk;
            expected_out = 6;
            if(expected_out==count_3)
            begin
                Passed=Passed+1;
            end
            else
            begin
                Failed=Failed+1;
            end
            #1 clk = ~clk;
            
            #1 clk = ~clk;
            expected_out = 9;
            if(expected_out==count_3)
            begin
                Passed=Passed+1;
            end
            else
            begin
                Failed=Failed+1;
            end
            #1 clk = ~clk;
            
            #1 clk = ~clk;
            expected_out = 13;
            if(expected_out==count_3)
            begin
                Passed=Passed+1;
            end
            else
            begin
                Failed=Failed+1;
            end
            #1 clk = ~clk;
            end
         end
        ////////////////////////
    endtask

endmodule