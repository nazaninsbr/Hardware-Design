module shiftLeft #(parameter SIZE = 16, parameter SIZEOUT = 32)(input [SIZE-1:0] val, input [4:0] sh, output [SIZEOUT-1:0] result);
	//assign result = {[SIZE-1-LEFT:0]val , (LEFT) 1'b0};
	assign result = val<<sh;
endmodule 