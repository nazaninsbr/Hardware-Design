module OC7assign (input a, b, c, d, e, f, g, output Y2, Y1, Y0);
wire g0, g1, w1, w0, x1;
assigny0y1 ASSIGN1 (a, b, c, g0, g1); 
assigny0y1 ASSIGN2 (d, e, f, w0, w1); 
assigny0y1 ASSIGN3 (g0, g, w0, Y0, x1); 
assigny0y1 ASSIGN4 (x1, g1, w1, Y1, Y2); 
endmodule 
