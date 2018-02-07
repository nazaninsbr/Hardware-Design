module sign(input signed [13:0] in, output signed [1:0] result);
assign result = (in[13]==0)?2'b01:2'b11;
endmodule 