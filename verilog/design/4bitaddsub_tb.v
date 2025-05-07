module tb;
    parameter N = 4; // Number of bits
    reg [N-1:0] a,b;
    reg CTRL;
    wire [N-1:0] sum,cout;

    initial begin
        $dumpfile("verilog/sim/4bitaddsub.vcd"); 
        $dumpvars(0,tb); 
    end

    bit4addsub #(.N(N)) addsub0(a,b,CTRL,sum,cout);

    initial begin
        $monitor("a=%d, b=%d, CTRL=%b, sum=%d, cout=%b",a,b,CTRL,sum,cout[N-1]);
        a = 2; b = 3; CTRL = 0; #10;
        a = 4; b = 5; CTRL = 1; #10;
        a = 7; b = 2; CTRL = 0; #10;
        a = 8; b = 3; CTRL = 1; #10;
    end
endmodule