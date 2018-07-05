module SerialRx(Clk,SDin,PDout[7:0],PDready);

input Clk;
input SDin;
output [7:0] PDout;
output PDready;

reg [7:0] SR;
reg [2:0] Count;
reg Enable;
reg SDin_d1;
reg ready;

always @(posedge Clk)
	SDin_d1 <= SDin;
	
always @(posedge Clk)
	if ((SDin == 1'b1) && (SDin_d1 == 1'b0))
		Enable <= 1'b1;
	else
		if(Count == 3'd7)
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
		Count[2:0]	<= Count[2:0] + 1'b1;
	else
		Count [2:0] <= 3'd0;	
		
always @(posedge Clk)
	if(Enable == 1'b1)
	begin
		SR[0] <= SDin;
		SR[7:1] <= SR[6:0];
	end
	else
		SR[7:0] <= SR[7:0];
		
assign PDready = ready;
assign PDout[7:0] = (PDready == 1'b1) ? SR[7:0] : PDout[7:0];						
 
endmodule
