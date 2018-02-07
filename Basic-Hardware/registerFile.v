module registerfile(
  input clk,
	input [4:0] readReg1, readReg2, writeReg, 
	input [31:0] writeData,
	input regWrite, 
	output [31:0] readData1, readData2);
	
	
	reg [31:0] regfile [0:31];
	
	always @(*) regfile[0]<=32'b0;
	 initial begin
		    regfile[0] = 32'b00000000000000000000000000000000;	
	end

	
	always @(posedge clk) begin 
		if(regWrite == 1'b1)
  		  regfile[writeReg] <= writeData; 
	end 
	
	assign readData1 = regfile[readReg1];
	assign readData2 = regfile[readReg2];
	
endmodule 