/*

UART Receiver Module

start bit(0) + 8 data bits + stop bit(1)


*/

module uart_rx(
    input clk,
    input reset,
    input rx,
    input tick,
    output reg [7:0] data_out,
    output reg rx_done
);
    reg [3:0] bit_index;
    reg [7:0] shift_reg;
    reg receiving; // flag to indicate if we are currently receiving data

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rx_done <= 0;
            bit_index <= 0;   
            shift_reg <= 0;
            receiving <= 0; // reset receiving flag
        end else if (tick) begin
            if (!receiving && rx ==0) begin//start bit detected
                bit_index <= 0;
                receiving <= 1; // set receiving flag
                rx_done <= 0; 
            end else if (bit_index < 8 && receiving) begin
                shift_reg[bit_index] <= rx; //shift in data bits
                bit_index <= bit_index + 1;
            end else if (bit_index == 8 && receiving && rx == 1) begin
                data_out <= shift_reg;
                rx_done <= 1; 
                bit_index <= 0; 
                receiving <= 0; // clear receiving flag
            end else begin
                rx_done <= 0; 
                bit_index <= 0; 
                receiving <= 0; // clear receiving flag
            end
        end else begin
            rx_done <= 0; // clear rx_done flag if not tick
        end
    end
endmodule