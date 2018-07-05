module BCD(Clk,nReset,CntEn,UnD,Cout,NextEn);

input Clk;
input nReset;
input CntEn, UnD;

output [3:0] Cout;
output NextEn;

reg [3:0] Counter;
reg Next;

always @(posedge Clk or negedge nReset)
begin
	if(nReset == 1'b0)
		Counter <= 0;
	else
		if(CntEn == 1'b0)
			Counter <= Counter;
		else
			if(UnD == 1'b0)
				if(Counter[3:0] == 4'd1)
				begin
					Counter <= Counter - 1'b1;
					Next <= 1'b1;
				end
				else if(Counter[3:0] == 4'd0)
				begin
					Counter <= 4'd9;
					Next <= 1'b0;
				end
				else
				begin
					Counter <= Counter - 1'b1;
				end				
			else
				if(Counter[3:0] == 4'd8)
				begin
					Counter <= Counter + 1'b1;
					Next <= 1'b1;
				end
				else if(Counter[3:0] == 4'd9)
				begin
					Counter <= 0;
					Next <= 1'b0;
				end
				else
				begin
					Counter <= Counter + 1'b1;
				end				
end

assign Cout = Counter;		
assign NextEn = Next;

endmodule
