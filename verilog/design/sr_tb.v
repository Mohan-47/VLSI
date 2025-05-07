module tb;
    reg clk,rst_n,s,r;
    wire q,qn;

    sr uut(
        .clk(clk),
        .rst_n(rst_n),
        .s(s),
        .r(r),
        .q(q),
        .qn(qn)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;

        $monitor("time=%0t, clk=%b, rst_n=%b, s=%b, r=%b, q=%b, qn=%b", $time, clk, rst_n, s, r, q, qn);

        rst_n = 1'b0; 
        #10;
        rst_n = 1'b1;

        drive(2'b00); // no change
        drive(2'b01); // reset
        drive(2'b10); // set
        drive(2'b11); 
        #5; // invalid state
        $stop;
    end

    task drive(input [1:0] ip); begin
        @(posedge clk);
        {s,r} = ip;
        #1;
    end
    endtask
endmodule