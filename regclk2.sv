module regclk2 (input logic clk, input logic [31:0] rd1D, rd2D,
				input logic [4:0] RtD, RdD, input logic [31:0] signimmD,
				input logic regwriteD, memtoregD, memwriteD, branchD,
				input logic [2:0] alucontrolD, input logic alusrcD, regdstD,
				output logic [31:0] rd1E, rd2E, output logic [4:0] RtE, RdE,
				output logic [31:0] signimmE,
				output logic regwriteE, memtoregE, memwriteE, branchE,
				output logic [2:0] alucontrolE, output logic alusrcE, regdstE);
				
	always_ff @(posedge clk)
		assign rd1E = rd1D;
		assign rd2E = rd2D;
		assign RtE = RtD;
		assign RdE = RdD;
		assign signimmE = signimmD;
		assign regwriteE = regwriteD;
		assign memtoregE = memtoregD;
		assign memwriteE = memwriteD;
		assign branchE = branchD;
		assign alucontrolE = alucontrolD;
		assign alusrcE = alusrcD;
		assign regdstE = regdstD;
		
		
endmodule