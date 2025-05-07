module tb;
    reg a,b,cin;
    wire sum,cout;
    integer i;
    
    initial begin
        $dumpfile("verilog/sim/fulladder.vcd");
        $dumpvars(0,tb);
    end

    fulladder fa(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b",a,b,cin,sum,cout);
        for(i=0;i<8;i=i+1) begin
            {a,b,cin} = i; 
            #10; 
        end
    end

endmodule