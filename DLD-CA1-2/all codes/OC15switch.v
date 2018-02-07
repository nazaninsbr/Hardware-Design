module OC15switch (input a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, output Y3, Y2, Y1, Y0); 
wire x0, x1, x2, w0, w1, w2, L1, N2;
OC7 OC7_1 (a,b, c, d, e, f, g, x2, x1, x0); 
OC7 OC7_2 (h, i, j, k, l, m, n, w2, w1, w0); 
switchlevel OC3_1 (o,w0, x0, Y0, L1);
switchlevel OC3_2 (L1, w1, x1, Y1, N2);
switchlevel OC3_3 (w2, x2, N2, Y2, Y3);
endmodule 