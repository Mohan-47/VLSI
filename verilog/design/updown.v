// up down counter 

module updown(
    input clk, rst_n,up,
    output reg [3:0] q,
    output qn
);
    always @(posedge clk ) begin
        if(!rst_n) begin
            q <= 4'b0000;
        end else begin
            if (up) begin
                q <= q + 1; // increment
            end else begin
                q <= q - 1; // decrement
            end
        end
    end
    assign qn = ~q;
endmodule