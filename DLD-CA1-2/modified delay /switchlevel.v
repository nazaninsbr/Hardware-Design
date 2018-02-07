module switchlevel(input a,b, c, output Y1, Y0); 
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;
supply1 Vdd;
supply0 Gnd;
pmos # (5, 6, 7)	
				T1(w3, Vdd, ~a), 
				T2(Y1, w3, ~b), 
				T3(Y1, w3, ~c), 
				T4(w4, Vdd, ~b), 
				T5(Y1, w4, ~c);
nmos # (3, 4, 5) 
				T6(Y1, w1, ~a), 
				T7(Y1, w2, ~b), 
				T8(w2, w1, ~c), 
				T9(w1, Gnd, ~b), 
				T10(w1, Gnd, ~c);
pmos # (5, 6, 7)
				T11(w5, Vdd, a), 
				T12(w8, Vdd, ~a), 
				T13(w6, w5, ~b), 
				T14(Y0, w6, c), 
				T15(w7, w5, b), 
				T16(Y0, w7, ~c), 
				T17(w9, w8, ~b), 
				T18(Y0, w9, ~c), 
				T19(w10, w8, b), 
				T20(Y0, w10, c);
nmos # (3, 4, 5)
				T21(Y0, w12, a), 
				T22(Y0, w13, ~b), 
				T23(Y0, w13, c), 
				T24(w13, w12, b), 
				T25(w13, w12, ~c), 
				T26(w12, Gnd, ~a), 
				T27(w12, w11, b), 
				T28(w12, w11, c), 
				T29(w11, Gnd, ~b), 
				T30(w11, Gnd, ~c);

endmodule
