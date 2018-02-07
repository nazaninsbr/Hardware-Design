module comparator(input signed [1:0] a, input signed [1:0] b, output eq);
assign eq =(a[1]==b[1])?( (a[0]==b[0])?1:0 ): 0;
endmodule 