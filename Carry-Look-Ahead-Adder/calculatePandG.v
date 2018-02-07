module calculatePandG(input [3:0] a, b, output [3:0] p , g);
genvar i;
for(i=0; i<4; i = i+1) begin 
assign p[i] = ((~a[i])&b[i]) | ((~b[i])&a[i]);
assign g[i] = a[i]&b[i];
end 
endmodule 