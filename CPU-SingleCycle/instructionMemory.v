module instructionMemory #(parameter SIZE=8) (
	input clk, 
	input [4*SIZE-1:0] adr,  
	output reg [4*SIZE-1:0] instruction);
	
	reg [SIZE-1:0] InstMemory [0:255]; 
	
	initial begin 
		{InstMemory[0],InstMemory[1],InstMemory[2],InstMemory[3]} = {6'b001000, 5'b0, 5'b1, 16'd80};
		{InstMemory[4],InstMemory[5],InstMemory[6],InstMemory[7]} = {6'b001000, 5'd0, 5'd10, 16'd1};
		{InstMemory[8],InstMemory[9],InstMemory[10],InstMemory[11]} = {6'b001000, 5'd0, 5'd2, 16'b0};
		{InstMemory[12],InstMemory[13],InstMemory[14],InstMemory[15]} = {6'b000100, 5'd1, 5'd2, 16'd12};
		{InstMemory[16],InstMemory[17],InstMemory[18],InstMemory[19]} = {6'b001000, 5'd2, 5'd3, 16'd0};
		{InstMemory[20],InstMemory[21],InstMemory[22],InstMemory[23]} = {6'b000100, 5'd1, 5'd3, 16'd8};
		{InstMemory[24],InstMemory[25],InstMemory[26],InstMemory[27]} = {6'b100011, 5'd2, 5'd4, 16'b0}; 
		{InstMemory[28],InstMemory[29],InstMemory[30],InstMemory[31]} = {6'b100011, 5'd3, 5'd5, 16'b0};
		{InstMemory[32],InstMemory[33],InstMemory[34],InstMemory[35]} = {6'b0, 5'd5, 5'd4, 5'd6, 5'b0, 6'h2a};
		{InstMemory[36],InstMemory[37],InstMemory[38],InstMemory[39]} = {6'b000100, 5'd6, 5'd10, 16'd2};
		{InstMemory[40],InstMemory[41],InstMemory[42],InstMemory[43]} = {6'b101011, 5'd3, 5'd4, 16'b0};
		{InstMemory[44],InstMemory[45],InstMemory[46],InstMemory[47]} = {6'b101011, 5'd2, 5'd5, 16'b0};
		{InstMemory[48],InstMemory[49],InstMemory[50],InstMemory[51]} = {6'b001000, 5'd3, 5'd3, 16'd4};
		{InstMemory[52],InstMemory[53],InstMemory[54],InstMemory[55]} = {6'b000010, 26'd5};
		{InstMemory[56],InstMemory[57],InstMemory[58],InstMemory[59]} = {6'b001000, 5'd2, 5'd2, 16'd4};
		{InstMemory[60],InstMemory[61],InstMemory[62],InstMemory[63]} = {6'b000010, 26'd3};
		{InstMemory[64],InstMemory[65],InstMemory[66],InstMemory[67]} = {32'b0};
	end 
	
	always @(posedge clk) begin 
	   instruction <= {InstMemory[adr], InstMemory[adr+1], InstMemory[adr+2], InstMemory[adr+3]};
	end 	
endmodule  
