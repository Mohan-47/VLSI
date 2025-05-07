/*

UART Top Module

1. Baud rate generator: Generates a tick signal at the desired baud rate.
2. UART Transmitter: Transmits data serially using the tick signal. 
3. UART Receiver: Receives data serially and stores it in a register.

*/


module uart(
    input clk,
    input reset,
    input tx_start,
    input [7:0] tx_data,
    input rx,
    output tx,
    output [7:0] rx_data,
    output rx_done,
    output tx_busy
);

    wire tick;

    baudgen #(.CLK_FREQ(50000000), .BAUD_RATE(9600)) baudgen_inst (
        .clk(clk),
        .reset(reset),
        .tick(tick)
    );

    uart_tx uart_tx_inst (
        .clk(clk),
        .reset(reset),
        .start(tx_start),
        .tick(tick),
        .data_in(tx_data),
        .tx(tx),
        .busy(tx_busy)
    );

    uart_rx uart_rx_inst (
        .clk(clk),
        .reset(reset),
        .rx(rx),
        .tick(tick),
        .data_out(rx_data),
        .rx_done(rx_done)
    );
endmodule


