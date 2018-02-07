module testReg();
  reg clk, rst;
  wire [31:0] prev;
  wire [31:0] curr;
  reg [31:0] in1, in2, in3, in4;
  reg [1:0] sel;
  MUX #(32) mux(in1, in2, in3, in4, sel, prev);
  register #(32) regis(prev, clk, rst, 1'b1, curr);
  initial begin 
    #100 
      rst = 1;
    #100
      rst = 0;
    #100
      clk = 0;
      in1= 32'd1;
      in2= 32'd3; 
      in3 = 32'd5; 
      in4 = 32'd7; 
    #100
      sel = 2'd0; 
    #100
      clk = 1;
    #100 
      clk = 0;
    #100
      clk = 1;
      sel = 2'd3; 
    #100
      clk = 0;
    #100
      clk = 1;
      sel= 2'd2;
    #100
      clk = 0;
    #100
      sel = 2'd0;
  end
endmodule