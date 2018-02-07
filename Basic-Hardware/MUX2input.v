module MUX2input #(parameter busSIZE=5) (input [busSIZE-1:0] in1, in2, input select, output [busSIZE-1:0] out);
	assign out = select == 1'b0 ? in1 : in2;
endmodule 