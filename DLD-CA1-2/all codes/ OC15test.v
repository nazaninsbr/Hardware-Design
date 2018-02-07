module OC15test;
reg  a=0, b=0, c=0, d=0, e=0, f=0, g=0, h=0, i=0, j=0, k=0, l=0, m=0, n=0, o=0;
wire Y0, Y1, Y2, Y3, w0, w1, w2, w3;
OC15switch test(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o,Y3, Y2, Y1, Y0);
OC15assign test2 (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, w3, w2, w1, w0);
initial begin
	repeat (1000) begin 
#200
	 {a, b, c, d, e, f, g, h, i, j, k, l, m, n, o} = {a, b, c, d, e, f, g, h, i, j, k, l, m, n, o} +1;
	end
end 
endmodule 
