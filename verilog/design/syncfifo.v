//synchronous fifo

module syncfifo #(
    parameter Depth =  8;
    parameter Data_Width = 4;
)(
    input clk, rst_n, w_en, r_en,
    input [Data_Width-1:0] data_in,
    output reg [Data_Width-1:0] data_out,
    output full,empty
);

    //width of pointer based on the depth of the fifo
    reg [$clog2(Depth)-1:0] w_ptr, r_ptr;
    reg [Data_Width-1:0] fifo [Depth];

    //default values
    always @(posedge clk) begin
        if (!rst_n) begin
            w_ptr <= 0;
            r_ptr <= 0;
            data_out <= 0;
            full <= 0;
            empty <= 1;
        end
    end

    //write operation
    always @(posedge clk) begin
        if(w_en && !full) begin
            fifo[w_ptr] <= data_in;
            w_ptr <= w_ptr + 1;
        end
    end

    //read operation
    always @(posedge clk) begin
        if(r_en && !empty) begin
            data_out <= fifo[r_ptr];
            r_ptr <= r_ptr + 1;
        end
    end

    assign full = (w_ptr + 1'b1 == r_ptr)
    assign empty = (w_ptr == r_ptr);
endmodule