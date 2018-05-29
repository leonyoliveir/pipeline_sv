module mips(input logic clk, reset, output logic [31:0] pc,
            input logic [31:0] instr,
            output logic memwriteM,
            output logic [31:0] aluout, writedata,
            input logic [31:0] readdata);
  
  logic [31:0] instrD;  
  logic memtoreg, alusrc, regdst, regwrite, jump, branch, memwrite;
  logic [2:0] alucontrol;
  
  controller c(instrD[31:26], instrD[5:0], memtoreg, memwrite,
     alusrc, regdst, regwrite, jump, branch, alucontrol);
  
  datapath dp(clk, reset, memtoreg, memwrite, alusrc, regdst, regwrite,
    jump, branch, alucontrol, pc, instr, aluout, writedata, readdata, instrD, memwriteM);

endmodule