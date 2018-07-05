module SerialRx4(Clk,SDin,PDout[7:0],PDready,ParErr);

input Clk;
input SDin;
output [7:0] PDout;
output PDready;
output ParErr;

reg [7:0] SR;
reg [3:0] Count;
reg Enable;
reg SDin_d1;
reg ready;
reg parity;

always @(posedge Clk)
	SDin_d1 <= SDin;
	
always @(posedge Clk)
	if ((SDin == 1'b1) && (SDin_d1 == 1'b0) && (Count == 4'd0))
		Enable <= 1'b1;
	else
		if(Count == 4'd8)
		begin
			Enable <= 1'b0;
			ready  <= 1'b1;
		end	
		else
		begin
			Enable <= Enable;
			ready <= 1'b0;
		end
		
always @(posedge Clk)
	if(Enable == 1'b1)
		Count[3:0]	<= Count[3:0] + 1'b1;
	else
		Count [3:0] <= 4'd0;	
		
always @(posedge Clk)
	if((Enable == 1'b1) && Count[3:0] != 4'd8)
	begin
		SR[0] <= SDin;
		SR[7:1] <= SR[6:0];

	end
	else
		SR[7:0] <= SR[7:0];


always @(posedge Clk)
	if(Count[3:0] == 4'd8)
		parity <= SDin;
	else
		parity <= parity;		
				
assign PDready = ready;
assign PDout[7:0] = (PDready == 1'b1) ? SR[7:0] : PDout[7:0];						
assign ParErr = ((^PDout[7:0]) == parity) ? 1'b0 : 1'b1; 
 
endmodule
