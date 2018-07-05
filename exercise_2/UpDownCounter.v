/**	@task   : UpDownCounter with Sycn Reset
 *  @param  : UnD = 0 -> Count Down 
 *			  UnD = 1 -> Count Up 
 *	@date   : 29.03.2017	
 */
module UpDownCounter(Clk,nSReset,UnD,Count);

input Clk;
input nSReset;
input UnD;
output [7:0] Count;

reg [7:0] Counter;

always @(posedge Clk)
	if (nSReset == 1'b0)
		Counter <= 0;
	else
		if (UnD == 1'b0) 
			Counter <= Counter - 1'b1;
		else
			Counter <= Counter + 1'b1;

assign Count = Counter;
			
endmodule

/**	@task   : UpDownCounter with ASycn Reset and Count Enable
 *  @param  : UnD = 0 -> Count Down 
 *			  UnD = 1 -> Count Up 
 *			  CntEn = 0 -> Stop	
 *			  CntEn = 1 -> Start	
 *	@date   : 29.03.2017	
 */
module UpDownCounterAsyc(Clk,nAReset,CntEn,UnD,Count);

input Clk;
input nAReset;
input CntEn;
input UnD;
output [7:0] Count;

reg [7:0] Counter;

always @(posedge Clk or negedge nAReset)
	if (nAReset == 1'b0)
		Counter <= 0;
	else
		if (CntEn == 1'b0)
			Counter <= Counter;
		else
			if (UnD == 1'b0) 
				Counter <= Counter - 1'b1;
			else
				Counter <= Counter + 1'b1;

assign Count = Counter;
			
endmodule
