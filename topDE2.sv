module topDE2(input logic clk, reset,
        output logic[6:0] HEX0, 
		  output logic[6:0] HEX1,
		  output logic[6:0] HEX2,
		  output logic[6:0] HEX3,
		  output logic[6:0] HEX4,
		  output logic[6:0] HEX5,
		  output logic[6:0] HEX6,
		  output logic[6:0] HEX7);
        
  logic [31:0] writedata, dataadr, pc;
  logic memwrite, clk2;
  logic [25:0] count;
  
  always@(posedge clk)
  begin
	count <= count+1;
	if(count === 50000000)
	begin
		clk2 <= 1;
		count <= 0;
	end
	else
		clk2 <= 0;
  end
  
  top dut (clk2, ~reset, writedata, dataadr, pc, memwrite);
  
  SEG7_LUT_8 u0 ( HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,pc);
endmodule