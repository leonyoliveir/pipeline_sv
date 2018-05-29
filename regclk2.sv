module regclk2 (input logic clk, input logic [31:0] rd1D, rd2D,
				input logic [4:0] RtD, RdD, 
				input logic [31:0] signimmD, pcplus4D,
				input logic regwriteD, memtoregD, memwriteD, branchD,
				input logic [2:0] alucontrolD, input logic alusrcD, regdstD,
				output logic [31:0] rd1E, rd2E, output logic [4:0] RtE, RdE,
				output logic [31:0] signimmE, pcplus4E,
				output logic regwriteE, memtoregE, memwriteE, branchE,
				output logic [2:0] alucontrolE, output logic alusrcE, regdstE);
				
	always_ff @(posedge clk)
	begin
		rd1E <= rd1D;
		rd2E <= rd2D;
		RtE <= RtD;
		RdE <= RdD;
		signimmE <= signimmD;
		pcplus4E <= pcplus4D;
		regwriteE <= regwriteD;
		memtoregE <= memtoregD;
		memwriteE <= memwriteD;
		branchE <= branchD;
		alucontrolE <= alucontrolD;
		alusrcE <= alusrcD;
		regdstE <= regdstD;
	end		
		
endmodule