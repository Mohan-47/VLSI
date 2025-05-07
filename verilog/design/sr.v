// SR FF

module sr(
    input clk,rst_n,s,r,
    output reg q,
    output qn
);
    always @(posedge clk) begin
        if (!rst_n)begin
            q<= 1'b0;
        end else begin
            case ({s,r}) 
                2'b00: q <= q; // no change
                2'b01: q <= 1'b0; // reset
                2'b10: q <= 1'b1; // set
                2'b11: q <= 1'bx; // invalid state
            endcase
        end
    end
    assign qn = ~q;
endmodule