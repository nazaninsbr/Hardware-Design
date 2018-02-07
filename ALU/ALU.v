module ALU(input [31:0] a, b, 
     input [3:0] ALUOp,
  output reg [31:0] result,
  output Zero);
  
  reg  [31:0]hiReg , loReg;
  
  always @ (ALUOp, a, b) begin 
    case(ALUOp) 
      4'b0000: result <= a + b;
      4'b0001: result <= a-b; 
      4'b0010: result <= a | b;
      4'b0011: result <= a & b;      
      4'b0100: result <= a ^ b;
      4'b0101: result <= (a>b)? 32'b01: 32'b0;
      4'b0110: {hiReg, loReg} <= a *b;
      4'b0111: result <= hiReg;
      4'b1000: result <= loReg;
      4'b1001: {hiReg , loReg} <= {a / b , a % b};
      default: result <= 32'b0;
    endcase 
  end 
  
  assign Zero = (result==32'b0)? 1'b1: 1'b0;
  
endmodule 