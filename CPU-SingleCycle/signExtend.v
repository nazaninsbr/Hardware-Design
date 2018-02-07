module signExtend #(parameter SIZE = 16) (input [SIZE-1:0] val, output [31:0] extended);
  assign extended = { {(32-SIZE){val[SIZE-1]}} ,val[SIZE-1:0]};
endmodule