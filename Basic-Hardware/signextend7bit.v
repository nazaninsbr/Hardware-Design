module signextend7bit(input [6:0] in, output [13:0] out);
assign out = {(in[6]==0)?7'b0000000:7'b1111111 ,in};
endmodule 
