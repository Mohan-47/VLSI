module tb;
    reg [3:0] a;
    reg [1:0] sel;
    wire y;

    mux4x1 uut (
        .a(a),
        .sel(sel),
        .y(y)
    );

    initial begin
        $monitor("a=%b, sel=%b, y=%b", a, sel, y);
        a = 4'h5; // 0101
        repeat(6) begin
            sel = $random;
            #5;
        end

    end
endmodule