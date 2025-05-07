// Universal shift register

module usr (
    input clk, rst_n,
    input [1:0] select,
    input [3:0] din,
    input s_left, s_right,
    output reg [3:0] dout
);
    always @(posedge clk ) begin
        if(!rst_n) dout <= 0;
        else begin
            case (select) 
                2'b01: dout <= {s_right, dout[3:1]};
                2'b10: dout <= {dout[2:0], s_left};
                2'b11: dout <= din;
                default: dout <= dout; // no change
            endcase
        end
    end
endmodule