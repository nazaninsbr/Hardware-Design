module register #(parameter SIZE=32) (input [SIZE-1:0] val, input clk, rst, ld, output reg[SIZE-1:0] out);
  always @ (negedge clk, posedge rst) begin 
    if(rst ==1'b1) out<={(SIZE){1'b0}};
    else if(ld ==1'b1) out <= val;
    else out<={(SIZE){1'b0}};
  end 
endmodule