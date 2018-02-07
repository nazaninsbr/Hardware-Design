module testController();
	reg [5:0] opcode,func;
    reg zero;
    wire RegDst, Branch, MemRead, MemWrite, MemToReg, ALUsrc, regWrite, IsJal,IsLui; 
    wire [1:0]PCselect;
    wire [3:0] ALUop;
    controller ct(opcode, func, zero, RegDst, Branch, MemRead, MemWrite, MemToReg, ALUsrc, regWrite, IsJal,IsLui, PCselect, ALUop);
    initial begin 
    	zero = 0;
    	opcode = 0; 
    	func = 32; 
    #100
    	zero = 0;
    	func = 16; 
    #100
    	opcode = 43;
    #100
    	opcode = 2;
    #100
    	opcode = 4; 
    #100
    	zero = 1;
    #100
    	opcode = 0;
    end 
endmodule 