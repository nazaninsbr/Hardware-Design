module CLA(input [3:0] a, b, input ci, output [3:0] s, output co);
wire [3:0] p, g;
wire [3:0] cout;
calculatePandG cpg(a, b, p, g);
calculateCarry cc(p, g, ci, cout);
calculateSum cs(p, cout, s);
assign co = g[3] | (p[3]&cout[3]);
endmodule 