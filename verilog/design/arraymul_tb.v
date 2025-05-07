module tb;
    reg [3:0] a,b;
    wire [7:0] p;

    arraymul uut (
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
    $monitor("A = %b: B = %b --> P = %b, P(dec) = %0d", A, B, p, p);
    A = 1; B = 0; #3;
    A = 7; B = 5; #3;
    A = 8; B = 9; #3;
    A = 4'hf; B = 4'hf;
  end

endmodule