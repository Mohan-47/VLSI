//1010 non overlapping mealy sequence detector

module mealyno(
    input clk, rst_n,
    input x,
    output z
);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
    reg [3:0] state, next_state;

    always @( posedge clk or negedge rst_n) begin 
        if (!rst_n) begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    always @(state or x) begin 
        case (state)

        A : begin
            next_state = (x) ? B : A; 
            end
        B : begin
            next_state = (x) ? B : C; 
            end
        C : begin
            next_state = (x) ? D : A; 
            end
        D : begin
            next_state = (x) ? B : A; 
            end
            default: next_state = A; // reset to state A
        endcase
    end
    assign z = (state == D) && (x==0);

endmodule