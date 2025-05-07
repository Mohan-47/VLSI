// updown counter testbench

module tb;

    reg clk, rst_n, up;
    wire [3:0] q;
    wire qn;

    updown uut(
        .clk(clk),
        .rst_n(rst_n),
        .up(up),
        .q(q),
        .qn(qn)
    );

    always #2 clk = ~clk;

    initial begin
        $monitor("time=%0t, clk=%b, rst_n=%b, up=%b, q=%b, qn=%b", $time, clk, rst_n, up, q, qn);
        
        clk = 0;
        rst_n = 0;
        up = 1;
        #4;
        rst_n = 1;
        #80;

        rst_n = 0; // Reset
        #4; rst_n = 1; up = 0;
        #50;
        $finish;
    end
    initial begin
        $dumpfile("verilog/sim/updown.vcd"); 
        $dumpvars(0,tb); 
    end
endmodule