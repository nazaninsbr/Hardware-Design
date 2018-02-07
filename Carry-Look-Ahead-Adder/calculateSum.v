module calculateSum(input [3:0] p, c, output [3:0] s);
genvar i; 
for(i=0; i<4; i=i+1) begin 
assign s[i] =  ((~c[i])&p[i]) | ((~p[i])&c[i]);
end 
endmodule 