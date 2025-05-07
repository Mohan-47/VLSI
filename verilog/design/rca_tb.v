module tb;
    parameter N = 4; // Number of bits
    reg [N-1:0] a,b;
    reg cin; 
    wire [N-1:0] sum,cout;

    initial begin
        $dumpfile("verilog/sim/rca.vcd"); 
        $dumpvars(0,tb); 
    end

    rca #(.N(N)) rca0(a,b,cin,sum,cout);

    initial begin
        $monitor("a=%d, b=%d, cin=%b, sum=%d, cout=%b",a,b,cin,sum,cout[N-1]);
        a = 2; b = 3; cin = 0; #10;
        a = 4; b = 5; cin = 1; #10;
    end
endmodule