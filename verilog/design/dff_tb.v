module tb;
    reg clk, rst_n,d;
    wire q;

    dff dff1(
        clk,
        rst_n,
        d,
        q
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("verilog/sim/dff.vcd");
        $dumpvars(0,tb);
    end

    initial begin
        $monitor("time=%0d clk=%b rst_n=%b d=%b q=%b", $time, clk, rst_n, d, q);
        clk = 0;
        rst_n = 1;
        d = 1'b1;
        #10 rst_n = 1'b0;

        #10 rst_n = 1'b1;
        #10 d = 1'b0;
        $finish;
    end
endmodule