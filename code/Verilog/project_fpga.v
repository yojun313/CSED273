`timescale 1ns / 1ps

module project_fpga(
    input wire clk,
    input wire btnTop, btnBottom, btnLeft, btnRight,
    input wire reset,
    output reg [3:0] Q_in,
    output wire [1:0] X,
    output reg [7:0] row,
    output reg [7:0] col
);
reg [3:0] Q_in_next;
wire [3:0] Q_out;
reg [7:0] pattern [7:0];

wire [63:0] maze;
wire X_0 = (btnLeft | btnBottom) & ~btnTop;
wire X_1 = (btnBottom | btnRight) & ~btnTop;

assign X[0] = X_0;
assign X[1] = X_1;


initial begin
    Q_in <= 4'b0000;
    end

mazeselect uut (
    .clk(btnTop | btnRight | btnLeft | btnBottom),
    .reset(reset),
    .Q_in(Q_in),
    .X(X),
    .Q_out(Q_out),
    .maze(maze)
);


// 첫 번째 always 블록: Q_out을 읽어 Q_in_next 갱신
always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q_in_next <= 4'b0000;
    end else begin
        Q_in_next <= Q_out;
        /*
        if (Q_out == 4'b0010 && X == 2'b10) begin
            Q_in_next <= 4'b0011;
        end
        */
    end
end

// 두 번째 always 블록: Q_in을 Q_in_next로 갱신
always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q_in <= 4'b0000;
    end else begin
        Q_in <= Q_in_next;
    end
end

initial begin
    pattern[0] = 8'b11111111;
    pattern[1] = 8'b00000001;
    pattern[2] = 8'b00000001;
    pattern[3] = 8'b00010001;
    pattern[4] = 8'b00010001;
    pattern[5] = 8'b00010000;
    pattern[6] = 8'b00010000;
    pattern[7] = 8'b11111111;
end

// 현재 스캔하는 행을 나타내는 인덱스
reg [2:0] current_row;
reg [15:0] refresh_counter;
// LED Display Update
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_row <= 3'b000;
        row <= 8'b00000000; // 모든 행 비활성화 (높은 활성화 신호)
        col <= 8'b11111111; // 모든 열 비활성화 (높은 비활성화 신호)
        refresh_counter <= 16'b0;
    end else begin
        // mazeselect 모듈의 출력을 pattern에 할당
        refresh_counter <= refresh_counter + 1;
        
        if (refresh_counter == 16'b0) begin
            pattern[0] <= maze[7:0];
            pattern[1] <= maze[15:8];
            pattern[2] <= maze[23:16];
            pattern[3] <= maze[31:24];
            pattern[4] <= maze[39:32];
            pattern[5] <= maze[47:40];
            pattern[6] <= maze[55:48];
            pattern[7] <= maze[63:56];

            row <= ~(8'b00000001 << current_row);
            col <= pattern[current_row];

            current_row <= current_row + 1;
            if (current_row == 3'b111) begin
                current_row <= 3'b000;
            end
        end
    end
end

endmodule



