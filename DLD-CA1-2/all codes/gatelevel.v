module gatelevel(input a, b, c, output Y0, Y0_2, Y0_3, Y0_4, Y1, Y1_2);
/* first we write Y1 based on formula: ab+ac+bc, this is not CMOS*/
wire w1, w2, w3, na, nb, nc, w4, w5, w6, w7, x1, x2, x3, x4, l1, l2, l3, l4, p1, p2, p3, p4;
nand # (10, 8) G1(w1, a, b),
		   	   G2(w2, a, c),
		   	   G3(w3, b, c);
nand # (15, 12) G4(Y1, w1, w2, w3);
/*based on formula but with the delay of transistors, a little more complex gate-ish*/
/*best*/
nand # (0, 0) G26(x1, a, b),
		   	  G5(x2, a, c),
		   	  G6(x3, b, c);
nand # (15, 14) G7(Y1_2, x1, x2, x3);
/*first we write Y0 based on formula: ~a~bc+~ab~c+a~b~c+abc, not CMOS*/
not # (5,7) 
			G8(na, a), 
			G9(nb, b), 
			G10(nc, c); 
nand# (15, 12) 
			G11(w4, na, nb, c), 
			G12(w5, na, b, nc), 
			G13(w6, a, nb, nc), 
			G14(w7, a, b, c);
nand#(20, 16)G15(Y0, w4, w5, w6, w7);
/*this time assuming we are given the nots*/ 
nand# (15, 12) 
			G16(l1, ~a, ~b, c), 
			G17(l2, ~a, b, ~c), 
			G18(l3, a, ~b, ~c), 
			G19(l4, a, b, c);
nand#(20, 16)G20(Y0_2, l1, l2, l3, l4);
/*based on formula but with the delay of transistors, a little more complex gate-ish*/
/*best*/
nand# (0,0) 
			G21(p1, ~a, ~b, c), 
			G22(p2, ~a, b, ~c), 
			G23(p3, a, ~b, ~c), 
			G24(p4, a, b, c);
nand#(20, 21)G25(Y0_3, p1, p2, p3, p4);
/*Y0 is also equal to xor so we can write it like so*/
xor #(20, 21) G27(Y0_4, a, b, c);
endmodule
