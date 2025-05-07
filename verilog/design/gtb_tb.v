module tb;
    parameter N = 4;
    reg [N-1:0] gray;
    wire [N-1:0] bin;

    gtb #(.N(N)) uut (
        .gray(gray),
        .bin(bin)
    );

    initial begin
        $monitor("Gray = %b --> Binary = %b", gray, bin);
        gray = 4'b1011; #1;
        gray = 4'b0111; #1;
        gray = 4'b0101; #1;
        gray = 4'b1100; #1;
        gray = 4'b1111;
    end
endmodule