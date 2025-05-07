/*
Baud rate tick generator
Baud rate == Number of bits per second

Baud rate tick = clk_freq / baud rate
For example, for a baud rate of 9600 and a clock frequency of 50MHz:    
tick = 50MHz / 9600 = 5208

*/

module baudgen #(parameter CLK_FREQ = 50000000, BAUD_RATE = 9600) (
    input clk,
    input reset,
    output reg tick
);

    localparam integer count_max = CLK_FREQ / BAUD_RATE; // Calculate the maximum count value for the tick 
    integer count; // Counter variable
    initial count = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            tick <= 0;
        end else if(count == count_max - 1) begin
            count <= 0;
            tick <= 1;
        end
        else begin
            count <= count + 1;
            tick <= 0;
        end
    end
endmodule