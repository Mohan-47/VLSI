//Binary to Gray code converter
module btg #(
    parameter N = 4
)(
    input [N-1:0] bin,
    output [N-1:0] gray
);
    assign gray[N-1] = bin[N-1]; 
    genvar i;
    generate
        for(i=0;i<N-1;i=i+1) begin
            assign gray[i] = bin[i] ^ bin[i+1];
        end
    endgenerate
endmodule 