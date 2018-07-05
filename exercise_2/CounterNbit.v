/**	@task   : N bit Counter with Asycn. Reset
 *	@params : You can specify number of bit of counter @default -> Nbit = 3 
 *	@date   : 22.03.2017	
 */
module CounterNbit(Clk,nAReset,Count);
parameter Nbit = 3;

input Clk;
input nAReset;
output [Nbit-1:0] Count;

reg [Nbit-1:0] Counter;

always @(posedge Clk or negedge nAReset)
	if(nAReset == 1'b0)
		Counter <= 0;	
	else
		Counter <= Counter + 1'b1;

assign Count = Counter;
	
endmodule


module OpSelect(In1,In2,Sel,OpOut);

input In1,In2;
input Sel;
output OpOut;

reg OutReg;

always @(Sel or In1 or In2)
	if(Sel == 1'b0)
		OutReg <= In1 & In2;
	else
		OutReg <= In1 ^ In2;

assign OpOut = OutReg;		 	

endmodule
