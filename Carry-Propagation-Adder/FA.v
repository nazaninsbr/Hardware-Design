module FA(input a, b, ci, output s, co);
assign {co, s} = a + b + ci;
endmodule 