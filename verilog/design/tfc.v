
/*

Traffic Light Controller 
========================
2-way traffic intersection
NS - north-south
EW - east-west

A simple moore FSM ( does not depend on input, timer based state transitions)

4 states:
S0: NS green, EW red
S1: NS yellow, EW red
S2: NS red, EW green
S3: NS red, EW yellow

outputs: 
00 - red
01 - yellow
10 - green

ns: 2'b ew: 2'b

*/

module tfc(
    input clk, rst_n,
    output reg [1:0] NS, EW
);

    parameter S0_NS_G = 2'b00, S1_NS_Y = 2'b01, S2_EW_G = 2'b10, S3_EW_Y = 2'b11;
    reg [1:0] state, next_state;

    reg [3:0] timer; // 4-bit timer for 15 sec

    //state register
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= S0_NS_G; // reset to initial state
        end else if (timer == 10) begin 
            state <= next_state;
        end
    end

    // timer for state transitions
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer <= 0;
        end else if (timer == 10) begin
            timer <= 0;
        end else begin
            timer <= timer + 1;
        end
    end

    // next state logic
    always @(*) begin
        case (state)
            S0_NS_G : next_state = S1_NS_Y; 
            S1_NS_Y : next_state = S2_EW_G;
            S2_EW_G : next_state = S3_EW_Y;
            S3_EW_Y : next_state = S0_NS_G; 
            default: next_state = S0_NS_G; 
        endcase
    end

    // output logic
    always @(*) begin
       case (state)
        S0_NS_G : begin
            NS = 2'b10; // green
            EW = 2'b00; // red
        end
        S1_NS_Y : begin
            NS = 2'b01; // yellow
            EW = 2'b00; // red
        end
        S2_EW_G : begin
            NS = 2'b00; // red
            EW = 2'b10; // green
        end
        S3_EW_Y : begin
            NS = 2'b00; // red
            EW = 2'b01; // yellow
        end
        default: begin 
                NS = 2'b00; 
                EW = 2'b00;
        end 
       endcase 
    end
endmodule