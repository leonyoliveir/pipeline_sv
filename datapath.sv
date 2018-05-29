module datapath(input logic clk, reset,
                input logic memtoreg, memwrite, 
                input logic alusrc, regdst,
                input logic regwrite, jump, branch,
                input logic [2:0] alucontrol,
                output logic [31:0] pc,
                input logic [31:0] instr,
                output logic [31:0] aluoutM, writedata,
                input logic [31:0] readdata,
                output logic [31:0] instD,
                output logic memwriteM);
  logic [4:0] writereg, writeregM, writeregW;
  logic [31:0] pcnext, pcnextbr, pcplus4, pcbranch, pcbranchM;
  logic [31:0] signimm, signimmsh;
  logic [31:0] srca, srcb;
  logic [31:0] result, rd1, rd2;
  logic [31:0] instrD, pcplus4D; 
  logic [31:0] pcplus4E, signimmE, rtE, rdE, rd1E, rd2E, aluout, aluoutW, readdataW;
  logic regwriteE, memtoregE, memwriteE, branchE, alusrcE, regdstE, zero;
  logic regwriteM, memtoregM, branchM, regwriteW, memtoregW;
  logic [1:0] alucontrolE;

  // next PC logic
  flopr #(32) pcreg(clk, reset, pcnext, pc);
  adder pcadd1(pc, 32'b100, pcplus4);
  sl2 immsh(signimmE, signimmsh);
  adder pcadd2(pcplus4E, signimmsh, pcbranch);
  mux2 #(32) pcbrmux(pcplus4, pcbranchM, pcsrc, pcnextbr);
  mux2 #(32) pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, jump, pcnext);
  regclk1 regfetdec(clk, instr, pcplus4, instrD, pcplus4D);
  regclk2 regdecexec(clk, rd1, rd2, instrD[20:16], instrD[15:11], signimm, pcplus4D,
          regwrite, memtoreg, memwrite, branch, alucontrol, alusrc, regdst, rd1E, rd2E,
          rtE, rdE, signimmE, pcplus4E, regwriteE, memtoregE, memwriteE, branchE, alucontrolE,
          alusrcE, regdstE);
  regclk3 regexecmem(clk, zero, aluout, rd2E, writereg, pcbranch, regwriteE, memtoregE, memwriteE,
          branchE, zeroM, aluoutM, writedata, writeregM, pcbranchM, regwriteM, memtoregM,
          memwriteM, branchM);
  regclk4 regmemwrt(clk, aluoutM, readdata, writeregM, regwriteM, memtoregM, aluoutW, readdataW,
          writeregW, regwriteW, memtoregW);
  
  // register file logic
  regfile rf(clk, regwriteW, instrD[25:21], instrD[20:16], writeregW, result, rd1, rd2);
  mux2 #(5) wrmux(rtE, rdE, regdstE, writereg);
  mux2 #(32) resmux(aluoutW, readdataW, memtoregW, result);
  signext se(instrD[15:0], signimm);

  // ALU logic
  mux2 #(32) srcbmux(rd2E, signimmE, alusrcE, srcb);
  alu32 alu(rd1E, srcb, alucontrolE, aluout, zero);
  
  assign pcsrc = branchM & zeroM;
  
endmodule
