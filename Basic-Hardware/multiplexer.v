module multiplexer(input [13:0] a, b, input select, output [13:0] out);
assign out =(select)?a:b;
endmodule 