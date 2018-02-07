module OC7 (input a, b, c, d, e, f, g, output Y2, Y1, Y0);
wire g0, g1, w0, w1, x1;
switchlevel OC3_1 (a, b, c, g1, g0);
switchlevel OC3_2 (d, e, f, w1, w0); 
switchlevel OC3_3 (g, g0, w0, x1, Y0);
switchlevel OC3_4(x1, g1, w1, Y2, Y1); 
endmodule 