module regclk1 (input logic clk, input logic [31:0] instF, pcplus4F,
				output logic [31:0] instD, pcplus4D);
				
	always_ff @(posedge clk)
		assign instD = instF;
		assign pcplus4D = pcplus4F;
		
endmodule