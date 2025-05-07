module tb;
    parameter N = 4;
    reg [N-1:0] bin;
    wire [N-1:0] gray;

    btg #(.N(N)) uut (
        .bin(bin),
        .gray(gray)
    );
    initial begin
        $monitor("Binary = %b --> Gray = %b", bin, gray);
        bin = 4'b1011; #1;
        bin = 4'b0111; #1;
        bin = 4'b0101; #1;
        bin = 4'b1100; #1;
        bin = 4'b1111;
    end
endmodule