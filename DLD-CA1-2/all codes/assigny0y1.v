module assigny0y1(input a,b,c, output Y0, Y1);
assign # 20.5 Y0 = ~a & (~b & c | b & ~c) | a & (~b & ~c | b & c);
assign # 14.5 Y1 = a & b | a & c | b & c;
endmodule 