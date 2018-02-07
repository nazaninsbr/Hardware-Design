module datapath(
    input RegDst, Branch, MemRead, MemWrite, MemToReg, ALUsrc, regWrite, IsJal,IsLui,
    input [1:0]PCselect,
    input [3:0] ALUOp, 
    input clk, rst,
    output zero,
    output [31:0] Instruction
  );
  
 //ALU wires
  wire [31:0] A, B, ResultALU;
  //PC wires
  wire [31:0] PCprev, PCcurr, PC4, PCbeq, beqoffset, BeqAddress;
  wire junk1, junk2;
  //Register file wires
  wire [1:0] writeRegMuxSelect,writeRegDataSelect;
  wire [4:0] writeRegister;
  wire [31:0] regReadData1, regReadData2, regWriteData;
  //Memory wires
  wire [31:0] memReadData;
  wire [31:0] ALUMemResult;
  // J wires
  wire [27:0] J4;
  wire [31:0] Jaddress;
  //lui wires
  wire [31:0] luiValue; 
    
  
  
  instructionMemory instmem(clk, PCcurr,Instruction);
  memory #(32) mem(clk, MemRead, MemWrite,ResultALU , regReadData2, memReadData);
  MUX2input #(32) memoutMUX(ResultALU, memReadData, MemToReg, ALUMemResult); 
  
  //register file 
  assign writeRegDataSelect = {IsJal, IsLui};
  assign writeRegMuxSelect = {RegDst, IsJal};
  MUX #(5) writeRegMUX(Instruction[20:16],5'b11111 ,Instruction[15:11], 5'b0, writeRegMuxSelect, writeRegister);
  MUX #(32) regWriteDataMux(ALUMemResult, luiValue, PC4, 32'b0, writeRegDataSelect, regWriteData);
  registerfile regfile(clk,Instruction[25:21], Instruction[20:16], writeRegister, regWriteData, regWrite, regReadData1, regReadData2);

  //ALU 
  ALU alu(A, B, ALUOp, ResultALU, zero);
  assign A = regReadData1;
  MUX2input #(32) aluMUX(BeqAddress, regReadData2, ALUsrc, B);
  
  //beq
  signExtend #(16) SE(Instruction[15:0], BeqAddress);
  shiftLeft #(32, 32) sl(BeqAddress, 5'd2, beqoffset);
  adder beqAdder (PC4, beqoffset, PCbeq, junk2);
  //bne
  
  
  //PC
  register PCregister(PCprev, clk, rst , 1'b1, PCcurr); 
  adder PCAdder (PCcurr, 32'b100, PC4, junk1);
  MUX #(32) PCMux( PC4,PCbeq, regReadData1, Jaddress, PCselect, PCprev);
  
  //J, Jal
  shiftLeft #(26, 28) slJ(Instruction[25:0], 5'd2, J4);
  assign Jaddress = {PC4[31:28] , J4};
  
  
  //mflo and mfhi--> [15:11] write register 
  //lui 
  shiftLeft #(16, 32) lowerHalf(Instruction[15:0], 5'd16, luiValue);
endmodule

