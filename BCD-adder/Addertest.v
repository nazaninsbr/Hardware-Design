module Addertest();
reg [3:0] a, b;
wire [3:0] s;
wire cout;
bcdAdder bcdtest(a, b, s, cout);
initial begin 
#100
a = 4'b0;
b= 4'b0;
#100
a = 4'b0010;
b = 4'b0011;
#100
a = 4'b0111;
b = 4'b0101;
#100
a = 4'b0;
b= 4'b0;
end 
endmodule 
