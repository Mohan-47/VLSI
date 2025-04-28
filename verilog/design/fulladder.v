
module fulladder(
    input a,b,cin,
    output sum,cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
    
endmodule

 // 2.
    // always @(*) begin
    //     sum = a ^ b ^ cin;
    //     cout = (a & b) | (cin & (a ^ b));
    // end


/***
`include "halfadder.v"
module fulladder(
    input a,b,cin,
    output sum,cout
); 
    wire s1,c1,c2;
    halfadder ha1(.a(a),.b(b),.sum(s1),.carry(c1));
    halfadder ha2(.a(s1),.b(cin),.sum(sum),.carry(c2));
    assign cout = c1 | c2; 
endmodule
***/