module bcdAdder(input [3:0] a, b, output [3:0] s, output cout);
wire [3:0] binaryAdder, value;
wire a1, a2, c;
assign {c, binaryAdder} = a +b;
and(a1, binaryAdder[3], binaryAdder[2]);
and(a2, binaryAdder[3], binaryAdder[1]);
or(cout, a1, a2, c);
assign value[3]=1'b0;
assign value[0]=1'b0;
assign value[1]=cout;
assign value[2]=cout;
assign s = binaryAdder + value;
endmodule 