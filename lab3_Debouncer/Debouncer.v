module Debouncer(Clk,SwOut,SwOutDB1,SwOutDB2);

input Clk;
input SwOut;
output SwOutDB1,SwOutDB2;
wire   SwOutDB1_W,SwOutDB2_W;

Debouncer1 DB1(Clk,SwOut,SwOutDB1_W);
Debouncer2 DB2(Clk,SwOut,SwOutDB2_W);

assign 	SwOutDB1 = 	SwOutDB1_W;
assign 	SwOutDB2 = 	SwOutDB2_W;	

endmodule


module Debouncer1(Clk,SwOut,SwOutDB1);

input Clk;
input SwOut;
output SwOutDB1;

reg [1:0] Cntr;
reg SwOut_d1;
reg DelayEn;
reg OutDB1;

wire Pressed;

// if there is transition to 1-0 or 0-1 
always @(posedge Clk)
	SwOut_d1 <= SwOut;
assign Pressed = ((SwOut == ~SwOut_d1) && !DelayEn) ? 1'b1 : 1'b0 ;

// Delay Counter ,4 cycle,
always @(posedge Clk)
	if(DelayEn == 1'b0)
		Cntr[1:0] <= 2'b0;
	else
		Cntr[1:0] <= Cntr[1:0] + 2'b1;

// Determine Start or Stop Delay
always @(posedge Clk)
	if (Pressed == 1'b1) 
		DelayEn <= 1'b1;
	else
		DelayEn <= (Cntr[1:0] == 2'd3) ? 1'b0 : DelayEn;	

always @(posedge Clk)
	OutDB1 <= (Cntr[1:0] == 2'd3) ?  SwOut_d1 : OutDB1;
assign SwOutDB1 = OutDB1;
			
endmodule

module Debouncer2(Clk,SwOut,SwOutDB2);

input Clk;
input SwOut;
output SwOutDB2;

reg [1:0] Cntr;
reg SwOut_d1;
reg DelayEn;
reg OutDB1;

wire Pressed;

// if there is transition to 1-0 or 0-1 
always @(posedge Clk)
	SwOut_d1 <= SwOut;
assign Pressed = ((SwOut == ~SwOut_d1) && !DelayEn) ? 1'b1 : 1'b0 ;

// Delay Counter ,4 cycle,
always @(posedge Clk)
	if(DelayEn == 1'b0)
		Cntr[1:0] <= 2'b0;
	else
		Cntr[1:0] <= Cntr[1:0] + 2'b1;

// Determine Start or Stop Delay
always @(posedge Clk)
	if (Pressed == 1'b1) 
		DelayEn <= 1'b1;
	else
		DelayEn <= (Cntr[1:0] == 2'd3) ? 1'b0 : DelayEn;	

always @(posedge Clk)
	OutDB1 <= (Cntr[1:0] == 2'd0) ?  SwOut_d1 : OutDB1;
assign SwOutDB2 = OutDB1;
			
endmodule

