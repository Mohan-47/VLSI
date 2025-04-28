// `include "../design/hello.v"
module tb;

initial begin
    $display("Testbench started");
    #10;
end
hello uut();
endmodule