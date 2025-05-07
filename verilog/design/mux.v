//2 x 1 mux
module mux2x1 (
    input a,b,sel,
    output y
);
    assign y = sel? b : a;
endmodule

// 4x1 mux
/***
module mux4x1(
    input [3:0] a,
    input [1:0] sel,
    output reg y
);
    always @(*) begin
        case (sel)
            2'b00 :  y = a[0];
            2'b01 :  y = a[1];
            2'b10 :  y = a[2];
            2'b11 :  y = a[3]; 
            default :  y = 1'bx;
    endcase
    end
endmodule
***/

//4x1 mux using 2x1 muxes

module mux4x1(
    input [3:0] a;
    input [1:0] sel;
    output y
);  
    wire s1,s2;
    mux2x1 m1(a[0],a[1],sel[0],s1);
    mux2x1 m2(a[2],a[3],sel[0],s2);
    mux2X1 m3(s1,s2,sel[1],y);
endmodule