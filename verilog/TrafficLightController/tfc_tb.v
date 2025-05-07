//Testbench Traffic Light Controller

module tb;
    reg clk, rst_n;
    wire [1:0] NS, EW;

    tfc uut(
        .clk(clk),
        .rst_n(rst_n),
        .NS(NS),
        .EW(EW)
    );

    always #5 clk = ~clk; // Clock generation

    initial begin
        clk = 0;
        rst_n = 0;

        #10 rst_n = 1; // Release reset
        
        $monitor("Time: %0t | clk: %b | NS: %b | EW: %b", $time,clk, NS, EW); // Monitor output

        #500;

        $finish; // End simulation
    end
endmodule 