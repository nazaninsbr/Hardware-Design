module testCPA();
reg [3:0] a, b; 
reg ci;
wire [3:0] s;
wire co;
CPA cpa(a, b, ci, s, co);
initial begin 
#100
a = 4'b1010;
b = 4'b0001; 
ci = 1'b0; 
#100 
a = 4'b1010;
b = 4'b0001; 
ci = 1'b0; 
end 
endmodule 