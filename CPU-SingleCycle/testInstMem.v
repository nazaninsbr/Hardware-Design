module testInstMem();
	reg clk;
	reg [31:0] pc;
	wire [31:0] instruction;
	instructionMemory #(8) instmem (clk, pc, instruction);
	initial begin 
		pc = 32'b0;
		clk = 0;
	#100
		clk = 1;
	#100
		clk = 0;
		pc = 32'b0100;
	#100
		clk = 1;
	#100
		clk= 0;
		pc = 32'b1000;
	#100
		clk= 1;
	#100
		clk = 0;
	end 
endmodule 