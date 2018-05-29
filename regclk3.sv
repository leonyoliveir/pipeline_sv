module regclk3 (input logic clk, zeroE,
				input logic [31:0] aluoutE, writedataE,
				input logic [4:0] writeregE, input logic [31:0] pcbranchE,
				input logic regwriteE, memtoregE, memwriteE, branchE,
				output logic zeroM, output logic [31:0] aluoutM, writedataM,
				output logic [4:0] writeregM, output logic [31:0] pcbranchM,
				output logic regwriteM, memtoregM, memwriteM, branchM);
				
	always_ff @(posedge clk)
	begin
		zeroM <= zeroE;
		aluoutM <= aluoutE;
		writedataM <= writedataE;
		writeregM <= writeregE;
		pcbranchM <= pcbranchE;
		regwriteM <= regwriteE;
		memtoregM <= memtoregE;
		memwriteM <= memwriteE;
		branchM <= branchE;
	end
		
endmodule