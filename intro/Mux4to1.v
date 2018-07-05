/**	@task   : Multiplexer 4to1 with always
 *	@data   : 22.03.2017	
 */
module Mux4to1(Sel,MuxIn,MuxOut);

input  [1:0] Sel;
input  [3:0] MuxIn;
output MuxOut;

reg OutReg;

always @(Sel[1:0] or MuxIn[3:0])
	 OutReg <= (Sel[1:0] == 2'b00) ? MuxIn[0] : 
			   ( (Sel[1:0] == 2'b01) ? MuxIn[1] :
			   ( (Sel[1:0] == 2'b10) ? MuxIn[2] : MuxIn[3] ) );	

assign MuxOut = OutReg;

endmodule
 
 /** @task   : Multiplexer 4to1 with Continous Assignment
 *	 @data   : 22.03.2017	
 */
module Mux4to1_Cont(Sel,MuxIn,MuxOut);

input  [1:0] Sel;
input  [3:0] MuxIn;
output MuxOut;

assign MuxOut = (Sel[1:0] == 2'b00) ? MuxIn[0] : 
			  ( (Sel[1:0] == 2'b01) ? MuxIn[1] :
			  ( (Sel[1:0] == 2'b10) ? MuxIn[2] : MuxIn[3] ) );

endmodule
