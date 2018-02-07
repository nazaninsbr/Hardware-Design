module testMemory();
  reg clk, memRead, memWrite;
	reg [31:0] address;
	reg [31:0] WriteData; 
	wire [31:0] ReadData;
  memory #(32) mem(memRead, memWrite, address, WriteData, ReadData);
  initial begin 
    #100
      clk = 0;
      memRead = 0; 
      memWrite = 0; 
      address = 32'b0; 
    #100
      memRead = 1; 
    #100
      WriteData = 32'd12; 
    #100 
      memRead = 0; 
    #100 
      memWrite = 1; 
    #100 
      memWrite = 0; 
    #100 
      WriteData = 32'b0;
  end
endmodule