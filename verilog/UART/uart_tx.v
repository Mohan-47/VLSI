/*

UART Transmitter Module

Start bit(0) + 8 data bits + stop bit(1)

Each data bit is sent LSB first for each tick of the baud rate generator.
The baud rate generator generates a tick signal at the desired baud rate.

*/

module uart_tx (
    input clk,
    input reset,
    input start,
    input tick,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);

    reg [3:0] bit_index;
    reg [9:0] shift_reg; // 1 stop bit + 8 data bits + 1 start bit

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx <= 1; // idle state
            busy <= 0;
            bit_index <= 0;
        end else if (start && !busy) begin
            shift_reg <= {1'b1, data_in, 1'b0}; // Load the shift register with stop bit + data + start bit
            bit_index <= 0;
            busy <= 1; // Set busy flag
        end else if (tick && busy) begin
            tx <= shift_reg[bit_index]; // Send the current bit
            if (bit_index == 9) begin 
                busy <= 0; // Clear busy flag
                tx <= 1; // Set tx high (idle state)
                bit_index <= 0; // 
            end else begin
                bit_index <= bit_index + 1; 
            end
        end
    end
endmodule