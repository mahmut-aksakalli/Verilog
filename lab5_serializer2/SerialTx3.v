module SerialTx3(Clk,Send,PDin[7:0],SCout,SDout);

input Clk;
input Send;
input [7:0] PDin;
output SCout;
output SDout;

reg [7:0] SR;
reg [3:0] Count;
reg Out;
reg Send_en;
reg Enable;
reg parity;

always @(Send)
	if(Send == 1'b1)
		if(Count[3:0] == 3'd0)
			Send_en = 1'b1;
		else
			Send_en = 1'b0;
	else
		Send_en = 1'b0;
		
always @(posedge Clk)
	if (Send_en == 1'b1)
		Enable <= 1'b1;
	else
		if(Count == 4'd9)
			Enable <= 1'b0;
		else
			Enable <= Enable;	
	
always @(posedge Clk)
	if(Send_en == 1'b1 && (Count[3:0] == 4'd0))
	begin
		SR[7:0] <= PDin[7:0];
		parity <= ^PDin[7:0];
	end
	else
	begin
		SR[7:1] <= SR[6:0];
		SR[0] <= 1'b0;
		parity <= parity;
	end
	
always @(posedge Clk)
	if( Send_en == 1'b1 && (Count[3:0] == 4'd0) && (Enable == 1'b1))
		Out <= 1'b1;
	else if(Count[3:0] == 4'd9)
		Out <= parity;
	else		
		Out <= SR[7];	

always @(posedge Clk)
	if(Enable == 1'b1)
		Count[3:0]	<= Count[3:0] + 1'b1;
	else
		Count [3:0] <= 4'd0;	
				
assign  SDout = Out;
assign 	SCout = Clk;	
			
endmodule


//module SerialTx3(Clk,Send,PDin[7:0],SCout,SDout);
//
//input Clk;
//input Send;
//input [7:0] PDin;
//output SCout;
//output SDout;
//
//reg [7:0] SR;
//reg [3:0] Count;
//reg Out;
//reg Send_en;
//reg Enable;
//reg parity;
//
//always @(Send)
//	if(Send == 1'b1)
//		if(Count[3:0] == 3'd0)
//			Send_en = 1'b1;
//		else
//			Send_en = 1'b0;
//	else
//		Send_en = 1'b0;
//		
//always @(posedge Clk)
//	if (Send_en == 1'b1)
//		Enable <= 1'b1;
//	else
//		if(Count == 4'd9)
//			Enable <= 1'b0;
//		else
//			Enable <= Enable;	
//	
//always @(posedge Clk)
//	if(Send_en == 1'b1 && (Count[3:0] == 4'd0))
//	begin
//		SR[7:0] <= PDin[7:0];
//		parity <= 1'b1;
//	end
//	else
//	begin
//		SR[7:1] <= SR[6:0];
//		SR[0] <= 1'b0;
//		parity <= 1'b1;
//	end
//	
//always @(posedge Clk)
//	if( Send_en == 1'b1 && (Count[3:0] == 4'd0) && (Enable == 1'b1))
//		Out <= 1'b1;
//	else if(Count[3:0] == 4'd9)
//		Out <= parity;
//	else		
//		Out <= SR[7];	
//
//always @(posedge Clk)
//	if(Enable == 1'b1)
//		Count[3:0]	<= Count[3:0] + 1'b1;
//	else
//		Count [3:0] <= 4'd0;	
//				
//assign  SDout = Out;
//assign 	SCout = Clk;	
//			
//endmodule