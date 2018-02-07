
module controller( input [5:0] opcode,func,
        input zero,
        output reg RegDst, Branch, MemRead, MemWrite, MemToReg, ALUsrc, regWrite, IsJal,IsLui, [1:0]PCselect,
        output reg [3:0] ALUop
        );

always @ (opcode , func, zero) begin
  RegDst <=0;
  Branch <=0; 
  MemRead<=1; 
  MemWrite<=0;
  MemToReg <=0; 
  ALUsrc<=0; 
  regWrite<=0; 
  IsJal<=0; 
  IsLui<=0; 
  PCselect<=2'b0;
  ALUop<=4'b0;
  //ALU_Controller(func,alufunc);
	case (opcode) 
		//R-Type
		0 : case (func) 
				//add
				32 : begin 
					 	regWrite <=1;
					 	ALUsrc <=1;
					 	PCselect<=2'b00;
					 	RegDst <= 1;
					 	ALUop<=4'b0;
					 	MemToReg<=0;
					 	IsJal<=0; 
            			IsLui<=0; 
					 end	
				//sub
				34 : begin
						 regWrite <=1;
					 	 ALUsrc <=1;
					   	 ALUop<=4'b0001;
					   	 PCselect<=2'b00;
					   	 RegDst <= 1;
					 	 MemToReg<=0;
					 	 IsJal<=0; 
					 	 IsLui<=0; 
					 end
				//and
				36 : begin
						regWrite <=1;
						RegDst <= 1;
					 	ALUsrc <=1;
					 	ALUop<=4'b0011;
					 	PCselect<=2'b00;
					 	MemToReg<=0;
					 	IsJal<=0; 
           			 	IsLui<=0; 
					 end	 	
				//or
				37 : begin
					 	regWrite <=1;
					 	ALUsrc <=1;
					 	RegDst <= 1;
					 	ALUop<=4'b0010;
					 	PCselect<=2'b00;
					 	MemToReg<=0;
					 	IsJal<=0; 
            			IsLui<=0; 
					 end
				//xor
				38 : begin
						regWrite <=1;
						PCselect<=2'b00;
					 	ALUsrc <=1;
					 	ALUop<=4'b0100;
					 	MemToReg<=0;
					 	IsJal<=0; 
					 	RegDst <= 1;
            			IsLui<=0; 
					 end
					 
				//slt
				42 : begin
						regWrite <=1;
						RegDst <=1;
					 	ALUsrc <=1;
					 	ALUop<=4'b0101;
					 	MemToReg<=0;
					 	IsJal<=0; 
            			IsLui<=0; 
            			PCselect <= 2'b00;
					 end
				
				//mult
				24 : begin
						regWrite <=1;
					 	ALUsrc <=1;
					 	RegDst <= 0;
					 	PCselect<=2'b00;
					 	ALUop<=4'b0110;
					 	MemToReg<=0;
					 	IsJal<=0; 
            			IsLui<=0; 
					 end
					 
				//div
				26 : begin
						regWrite <=1;
					 	ALUsrc <=1;
					 	PCselect<=2'b00;
					 	RegDst <= 0;
					 	ALUop<=4'b1001;
					 	MemToReg<=0;
					 	IsJal<=0; 
            			IsLui<=0; 
					 end 
					//jr
				8  : begin
					 PCselect <= 2'b10;
				  end 
		    //mflo
				18 : begin
						 regWrite <=1;
					 	 ALUsrc <=1;
					 	 RegDst <= 1;
					 	 PCselect<=2'b00;
					 	 ALUop<=4'b1000;
					 	 MemToReg<=0;
					 	 IsJal<=0; 
             			 IsLui<=0; 
					 end
				//mfhi
				16 : begin
						 regWrite <=1;
					 	ALUsrc <=1;
					 	ALUop<=4'b0111;
					 	MemToReg<=0;
					 	IsJal<=0;
					 	RegDst <= 1;
					 	PCselect<=2'b00; 
            			IsLui<=0; 
					 end	
		endcase
		//lw
		35 : begin
						 regWrite <=1;
					 	ALUsrc <=0;
					 	ALUop<=4'b0000;
					 	MemToReg<=1;
					 	MemRead <=1;
					 	IsJal<=0; 
					 	PCselect<=2'b00;
            			IsLui<=0; 
			 end
		//sw
		43 : begin
				  		regWrite <=0;
					 	ALUsrc <=0;
					 	ALUop<=4'b0000;
					 	MemToReg<=1;
					 	PCselect<=2'b00;
					 	MemWrite<=1;
					 	IsJal<=0; 
            			IsLui<=0;  
			 end
		//slti
			10 : begin
						regWrite <=1;
					 	ALUsrc <=0;
					 	RegDst <=0;
					 	ALUop<=4'b0101;
					 	MemToReg<=0;
					 	IsJal<=0; 
            			IsLui<=0; 
            			PCselect <=2'b00;
					 end	 
				//lui
		15 : begin
				 regWrite <=1;
				 RegDst <=0;
				 ALUsrc <= 0;
				 MemToReg <= 0;
				IsJal<=0; 
          		IsLui<=1; 
			 end	 
					 
				//j
	     	2 : begin 
	     	   regWrite <=0;
			   PCselect <= 2'b11;
	     	  end
			 
		   //jal
		    3 : begin
			 	   regWrite <=1;
				   PCselect <= 2'b11;
					IsJal<=1; 
            		IsLui<=0;
            		RegDst <= 0; 
     			 end
				 //addi
	     	 8 : begin
				    regWrite <=1;
					 	ALUsrc <=0;
					 	ALUop<=4'b0;
					 	RegDst <=0;
					 	PCselect <= 2'b00;
					 	MemToReg<=0;
					 	IsJal<=0; 
            			IsLui<=0; 
			      end 
		//beq
		4  : begin 
				RegDst <= 0;
				ALUsrc <= 1;
				ALUop<=4'b1;
				 if(zero) PCselect <= 2'b01;
				 else PCselect <= 2'b00;
			 end
		//bnq 
		5  : begin
				RegDst <= 0;
				ALUsrc <= 1;
				ALUop<=4'b1;
				 if(~zero) PCselect <= 2'b01;
				 else PCselect <= 2'b00;
			 end
	endcase
 end
endmodule




