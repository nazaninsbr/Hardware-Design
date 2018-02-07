module testMUX();
  reg [31:0] in1, in2, in3, in4;
  reg [1:0] sel;
  wire [31:0] out;
  MUX #(32) mux(in1, in2, in3, in4, sel, out);
  initial begin 
    #100 
      in1= 32'd1;
      in2= 32'd3; 
      in3 = 32'd5; 
      in4 = 32'd7; 
    #100
      sel = 2'd0; 
    #100
      sel = 2'd3; 
    #100
      sel= 2'd2;
    #100
      sel = 2'd0;
  end
endmodule