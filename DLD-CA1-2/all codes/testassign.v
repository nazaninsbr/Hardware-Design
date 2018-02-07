module testassign;
reg a, b, c;
wire Y0, Y1; 
assigny0y1 ASSIGNY0Y1 (a, b, c, Y1, Y0);
initial begin 
/*	
	this time we see the inputs like 'abc' [c having the lowest value] and count 0 to 7 like this
*/
	a <= 1'b0;
	b <= 1'b0;
	c <= 1'b0; 
	#50
	a <= 1'b0;
	b <= 1'b0;
	c <= 1'b1; 
	#50
	a <= 1'b0;
	b <= 1'b1;
	c <= 1'b1; 
	#50
	a <= 1'b0;
	b <= 1'b1;
	c <= 1'b0; 
	#50
	a <= 1'b1;
	b <= 1'b1;
	c <= 1'b0; 
	#50	
	a <= 1'b1;
	b <= 1'b1;
	c <= 1'b1; 
	#50
	a <= 1'b1;
	b <= 1'b0;
	c <= 1'b1; 
	#50
	a <= 1'b1;
	b <= 1'b0;
	c <= 1'b0; 
	#50	
	a <= 1'b0;
	b <= 1'b0;
	c <= 1'b0;
	#50
	$stop; 
end 
endmodule 