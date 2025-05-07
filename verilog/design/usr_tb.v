module tb;
    reg clk, rst_n, s_left, s_right;
    reg [1:0] select;
    reg [3:0] din;
    wire [3:0] dout;

    usr uut(
        .clk(clk),
        .rst_n(rst_n),
        .select(select),
        .din(din),
        .s_left(s_left),
        .s_right(s_right),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("time=%0t, clk=%b, rst_n=%b, select=%b, din=%b, s_left=%b, s_right=%b, dout=%b", $time, clk, rst_n, select, din, s_left, s_right, dout);
        
        clk = 0;
        rst_n = 0;
        #10;
        rst_n = 1;

        din = 4'b1010;
        s_left = 1'b0;
        s_right = 1'b1;

        select = 2'b11;
        #10;
        select = 2'b01; // Shift right
        #10;
        select = 2'b10; // Shift left
        #10;

        $finish;


    end
endmodule