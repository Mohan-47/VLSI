`include "verilog/design/fulladder.v"
module rca #(
    parameter N = 4
)(
    input [N-1:0] a,b,
    input cin,
    output [N-1:0] sum, cout
);
    genvar g;

    fulladder fa0(a[0],b[0],cin,sum[0],cout[0]);
    generate
        for(g=1;g<N;g=g+1) begin
            fulladder fa(a[g],b[g],cout[g-1],sum[g],cout[g]);
        end
    endgenerate
    
endmodule