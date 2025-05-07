// Testbench for UART module

module uart_tb;
    reg clk;
    reg reset;
    reg tx_start;
    reg [7:0] tx_data;
    wire rx;
    wire tx;
    wire [7:0] rx_data;
    wire rx_done;
    wire tx_busy;

    // Instantiate the UART module
    uart uut (
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .rx(rx),
        .tx(tx),
        .rx_data(rx_data),
        .rx_done(rx_done),
        .tx_busy(tx_busy)
    );

    assign rx = tx; // Loopback for testing
    always #10 clk = ~clk; // 50MHz clock

    initial begin
        clk = 0;
        reset = 1;
        tx_start = 0;

        #100 reset = 0;

        #1000;
        tx_data = 8'hA5;
        tx_start = 1;
        #20 tx_start = 0;

        wait (rx_done);
        $display("Received: %h", rx_data);

        #1000;
        $finish;
    end
    endmodule
