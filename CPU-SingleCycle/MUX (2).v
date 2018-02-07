module MUX #(parameter busSIZE=4) (input [busSIZE-1:0] in1, in2, in3, in4, input [1:0] select, output reg [busSIZE-1:0] out);
	always @ (select, in1, in2, in3, in4) begin 
		case(select)
		2'b00: out<=in1;
		2'b01: out<=in2;
		2'b10: out<=in3;
		2'b11: out<=in4;
		default: out<=in1;
		endcase
	end 
endmodule 