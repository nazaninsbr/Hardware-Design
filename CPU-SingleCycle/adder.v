module adder #(parameter SIZE = 32) (input [SIZE-1:0] a, b, output [SIZE-1:0] out, output c);
	assign {c, out}  = a + b;
endmodule  
