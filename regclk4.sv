module regclk4 (input logic clk, input logic [31:0] aluoutM, readdataM, 
				input logic [4:0] writeregM, input logic regwriteM, memtoregM,
				output logic [31:0] aluoutW, output logic [31:0] readdataW, 
				output logic [4:0] writeregW, output logic regwriteW, memtoregW);
				
	always_ff @(posedge clk)
		assign aluoutW = aluoutM;
		assign readdataW = readdataM;
		assign writeregW = writeregM;
		assign regwriteW = regwriteM;
		assign memtoregW = memtoregM;
				
endmodule