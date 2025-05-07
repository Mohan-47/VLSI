module tb;
    reg a,b; // Declare inputs as registers
    wire sum,carry; // Declare outputs as wires
    integer i;

    // Instantiate half adder module
    halfadder ha(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Testbench logic
    initial begin
        $monitor("a=%b, b=%b, sum=%b, carry=%b",a,b,sum,carry); // Monitor changes in inputs and outputs

        for(i=0;i<4;i=i+1) begin
            {a,b} = i; 
            #10; 
        end
        // a = 0; b = 0; #10;
        // a = 0; b = 1; #10;
        // a = 1; b = 0; #10;
        // a = 1; b = 1; #10;
    end

    initial begin
        $dumpfile("verilog/sim/halfadder.vcd"); // Specify the VCD file for waveform output
        $dumpvars(0,tb); // Dump all variables in the testbench
    end
endmodule