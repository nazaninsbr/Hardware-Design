module testgateswitch; 
reg a, b, c;
wire Y0_s, Y1_s, Y0, Y0_2, Y0_3, Y0_4, Y1, Y1_2;
switchlevel SWITCH (a, b, c, Y1_s, Y0_s);
gatelevel GATE (a, b, c, Y0, Y0_2, Y0_3, Y0_4, Y1, Y1_2);
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