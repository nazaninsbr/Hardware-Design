module calculateCarry(input [3:0] p, g, input ci, output [3:0] cout);
assign cout[0] = ci;
genvar j;
for(j=1; j<4; j = j+1) begin 
assign cout[j] = g[j-1] | (p[j-1]&cout[j-1]);
end 
endmodule 