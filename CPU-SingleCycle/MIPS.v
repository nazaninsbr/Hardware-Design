module MIPS(
	input clk, rst); 
	wire Zero; 
	wire [31:0] Instruction;
	wire [3:0] ALUop;
	wire [5:0] opcode, func;  
	wire [1:0] PCselect;	 
	
  assign opcode = {Instruction[31:26]};
  assign func = {Instruction[5:0]};
  
  
	datapath cpuDP(RegDst, Branch, MemRead, MemWrite, MemToReg, ALUsrc, regWrite, IsJal,IsLui, PCselect, ALUop, clk, rst, Zero, Instruction);
	controller cpuControl(opcode,func,Zero, RegDst, Branch, MemRead, MemWrite, MemToReg, ALUsrc, regWrite, IsJal,IsLui, PCselect,ALUop);
	
endmodule 