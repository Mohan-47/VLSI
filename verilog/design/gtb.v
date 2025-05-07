//Gray to Binary code converter
module gtb #(
    parameter N = 4
)(
    input [N-1:0] gray,
    output [N-1:0] bin
);
    assign bin[N-1] = gray[N-1];
    genvar i;
    generate
        for(i=N-2;i>=0;i=i-1) begin
            assign bin[i] = gray[i] ^ bin[i+1];
        end
    endgenerate
endmodule