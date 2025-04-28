/***
module halfadder(
    input a,b,
    output sum,carry
);
    assign sum = a ^ b; 
    assign carry = a & b; 
endmodule
***/

module halfadder(
    input a,b,
    output reg sum,carry
);

    always @(*) begin
        sum = a ^ b;
        carry = a & b;
    end
endmodule