// 4 x 4 array multiplier

`include "verilog/design/halfadder.v"
`include "verilog/design/fulladder.v"

module arraymul(
    input [3:0] a,b,
    output [7:0] p
);
    wire [5:0] s;
    wire [10:0] c;
    reg pp[0:3][0:3];

    genvar g;
    generate
        for (g=0;g<4;g=g+1) begin
            assign pp[g][0] = a[g] & b[0];
            assign pp[g][1] = a[g] & b[1];
            assign pp[g][2] = a[g] & b[2];
            assign pp[g][3] = a[g] & b[3];
        end
    endgenerate

    assign p[0] = pp[0][0];

    //first row of partial products
    halfadder ha1(pp[1][0],pp[0][1],p[1],c[0]);
    halfadder ha2(pp[2][0],pp[1][1],s[0],c[1]);
    halfadder ha3(pp[3][0],pp[2][1],s[1],c[2]);

    //second row of partial products
    fulladder fa1(pp[0][2],s[0],c[0],p[2],c[3]);
    fulladder fa2(pp[1][2],s[1],c[1],s[2],c[4]);
    fulladder fa3(pp[2][2],pp[3][1],c[2],s[3],c[5]);

    //third row of partial products
    fulladder fa4(pp[0][3],s[2],c[3],p[3],c[6]);
    fulladder fa5(pp[1][3],s[3],c[4],s[4],c[7]);
    fulladder fa6(pp[2][3],pp[3][2],c[5],s[5],c[8]);

    //fourth row of partial products'
    halfadder ha4(s[4],c[6],p[4],c[9]);
    fulladder fa7(s[5],c[7],c[9],p[5],c[10]);
    fulladder fa8(pp[3][3],c[8],c[10],p[6],p[7]);


endmodule