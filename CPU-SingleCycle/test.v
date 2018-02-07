module test();
	reg clk, rst; 
	MIPS mipsCPU (clk, rst);
	initial begin #500 rst=1;
			  #1000 rst=0;	
	end
	initial begin 
	  clk = 0;
		repeat(5000) #1000 clk=~clk;
	end
	
endmodule 