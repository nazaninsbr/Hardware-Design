module OC15assign (input a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, output Y3, Y2, Y1, Y0); 
wire x0, x1, x2, w0, w1, w2, L1, N2;
OC7assign ASSIGN1 (a,b, c, d, e, f, g, x2, x1, x0);
OC7assign ASSIGN2 (h, i, j, k, l, m, n, w2, w1, w0); 
assigny0y1 ASSIGN3 (o,w0, x0, Y0, L1);
assigny0y1 ASSIGN4 (L1, w1, x1, Y1, N2);
assigny0y1 ASSIGN5 (w2, x2, N2, Y2, Y3);
endmodule 