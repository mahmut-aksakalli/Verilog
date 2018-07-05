module Detector(Clk,nReset,Sin,Pattern,Pcount);

input Clk, nReset, Sin;
input [3:0] Pattern;
output [7:0] Pcount;

reg [3:0] Buffer;
reg [7:0] Count;


always @(posedge Clk)
	Buffer[3:0] <= {Buffer[2:0] , Sin};

always @(posedge Clk or negedge nReset)
	if(nReset == 1'b0)
		Count[7:0] <= 8'b0;
	else
		if(Buffer[3:0] == Pattern[3:0])
			Count[7:0] <= Count[7:0] + 1'b1;
		else
			Count[7:0] <= Count[7:0];
			
assign Pcount[7:0] = Count[7:0];			

endmodule
