module testALU();
  reg [31:0] a, b; 
  reg [3:0] ALUOp;
  wire [31:0] result;
  wire Zero;
  ALU alu(a, b, ALUOp, result, Zero);
  initial begin
    #100
      a = 31'd10;
      b = 31'd13;
    #100
      ALUOp = 4'd0; 
    #100
      ALUOp = 4'b1001;
    #100
      ALUOp = 4'b0100;
    #100 
      ALUOp = 4'd1;
    #100
      ALUOp = 4'd0;
  end 
endmodule 