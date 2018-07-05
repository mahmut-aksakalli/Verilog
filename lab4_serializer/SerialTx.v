module SerialTx(Clk,Send,PDin[7:0],SCout,SDout);

input Clk;
input Send;
input [7:0] PDin;
output SCout;
output SDout;

reg [7:0] SR;
reg [2:0] Count;
reg Out;
reg Send_d1;
reg Enable;

always @(posedge Clk)
	Send_d1 <= Send;

always @(posedge Clk)
	if ((Send == 1'b1) && (Send_d1 == 1'b0))
		Enable <= 1'b1;
	else
		if(Count == 3'd7)
			Enable <= 1'b0;
		else
			Enable <= Enable;	
	
always @(posedge Clk)
	if(Send == 1'b1 && (Count[2:0] == 3'd0))
		SR[7:0] <= PDin[7:0];
	else
	begin
		SR[7:1] <= SR[6:0];
		SR[0] <= 1'b0;
	end
	
always @(posedge Clk)
	if(Send == 1'b1)
		Out <= 1'b1;
	else
		Out <= SR[7];	

always @(posedge Clk)
	if(Enable == 1'b1)
		Count[2:0]	<= Count[2:0] + 1'b1;
	else
		Count [2:0] <= 3'd0;	
				
assign  SDout = Out;
assign 	SCout = Clk;	
			
endmodule
