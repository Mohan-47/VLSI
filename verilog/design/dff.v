
//Asynchronous reset D flip flop with active low reset
/***
module dff(
    input clk, rst_n,
    input d,
    output reg q
);
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            q <= 1'b0;
        end else begin 
            q <= d;
        end
        
    end
endmodule
***/

// synchronous reset D flip flop with active low reset

module dff(
    input clk, rst_n,
    input d,
    output reg q
);
    
    always @(posedge clk) begin
        if(!rst_n) begin
            q <= 1'b0;
        end else begin 
            q <= d;
        end
        
    end
endmodule