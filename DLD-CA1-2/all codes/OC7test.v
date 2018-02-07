module OC7test;
reg a =0, b = 0 , c = 0, d = 0 , e = 0 , f = 0, g = 0;
wire Y0, Y1, Y2, w0, w1, w2;
OC7 test (a, b, c, d, e, f, g, Y2, Y1, Y0);
OC7assign test2 (a, b, c, d, e, f, g, w2, w1, w0);
initial begin
	repeat (128) begin 
#200
	 {a, b, c, d, e, f, g} = {a, b, c, d, e, f, g} +1;
	end
end 
endmodule 
