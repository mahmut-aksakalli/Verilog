module LongPulse(Clk,Pin,Pout);

input  Clk, Pin;
output Pout;
wire   Pin_1cyc;

reg Pin_d1;
reg pulseEn;
reg [2:0] Count;


always @(posedge Clk)
	Pin_d1 <= Pin;
assign Pin_1cyc = Pin & ~Pin_d1;

always @(posedge Clk)
	if(pulseEn == 1'b0)
		Count[2:0] <= 2'b0;
	else
		Count[2:0] <= Count[2:0] + 1'b1;
		
always @(posedge Clk)
begin
	if(Count[2:0] == 3'd4)
		pulseEn <= 1'b0;
	else
		if(Pin_1cyc == 1'b1)
			pulseEn <= 1'b1;	
		else
			pulseEn <= pulseEn;		
end
assign Pout = pulseEn;

endmodule
