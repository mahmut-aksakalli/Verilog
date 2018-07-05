/**	@task   : D Flip Flop Module
 *	@date   : 22.03.2017	
 */
module DFlipFlop(Din,Clk,Dout);

input  Din;
input  Clk;
output Dout;

reg OutReg;

always @(posedge Clk)
	OutReg <= Din;

assign Dout = OutReg;

endmodule

/**	@task   : D Flip Flop Module with synchronous reset
 *	@date   : 22.03.2017	
 */
module Dff_SReset(Din,nSReset,Clk,Dout);

input Din;
input nSReset;
input Clk;
output Dout;

wire DinTemp;
reg  OutReg;

assign DinTemp = Din & nSReset;

always @(posedge Clk)
	OutReg <= DinTemp;

assign Dout = OutReg;

endmodule

/**	@task   : D Flip Flop Module with Asynchronous reset 
 *	@date   : 22.03.2017	
 */
module Dff_AReset(Din,nAReset,Clk,Dout);

input Din;
input nAReset;
input Clk;
output Dout;

reg OutReg;

always @(posedge Clk or negedge nAReset)
	if (nAReset == 1'b0)
		OutReg <= 1'b0;
	else
		OutReg <= Din;
		
assign Dout = OutReg;
		
endmodule
