//module FSM(Clk,d1,d2,counter);
//
//input Clk;
//input d1;
//input d2;
//output [2:0] counter;
//
//parameter s0 = 3'b000, s1 = 3'b010, s2 = 3'b011, s3 = 3'b001, s4 = 3'b100;
//
//reg  [2:0] count;
//reg  [3:0] state;
//
//always @(posedge Clk)
//begin
//	case(state[3:0])
//		s0: 
//			if(d1 == 1'b1 && d2 == 1'b0)
//				state <= s1;
//			else
//				state <= s0;
//		s1:
//			if(d1 == 1'b1 && d2 == 1'b0)
//				state <= s1;
//			else if(d1 == 1'b1 && d2 == 1'b1)
//				state <= s2;
//			else
//				state <= s0;							
//		s2:
//			if(d1 == 1'b1 && d2 == 1'b0)
//				state <= s1;
//			else if(d1 == 1'b1 && d2 == 1'b1)
//				state <= s2;
//			else if(d1 == 1'b0 && d2 == 1'b1)
//				state <= s3;
//			else
//				state <= s0;															
//		s3:
//			if(d1 == 1'b0 && d2 == 1'b1)
//				state <= s3;
//			else if(d1 == 1'b1 && d2 == 1'b1)
//				state <= s2;
//			else if(d1 == 1'b0 && d2 == 1'b0)
//				state <= s4;	
//			else
//				state <= s0;
//		s4:
//		begin
//			count[2:0] <= count[2:0] + 1'b1;
//			state <= s0;
//		end	 			
//		default:
//			state <= s0;
//	endcase
//end
//
//assign counter[2:0] = count[2:0];
//
//endmodule

module FSM(Clk,d1,d2,counter);

input Clk;
input d1;
input d2;
output [2:0] counter;

parameter s0 = 3'b000, s1 = 3'b010, s2 = 3'b011, s3 = 3'b001, s4 = 3'b100, s5 = 3'b101;

reg  [2:0] count;
reg  [3:0] state;

always @(posedge Clk)
begin
	case(state[3:0])
		s0: 
			if(d1 == 1'b1 && d2 == 1'b0)
				state <= s1;
			else if (d1 == 1'b0 && d2 == 1'b1)
				state <= s3;
			else
				state <= s0;
		s1:
			if(d1 == 1'b1 && d2 == 1'b0)
				state <= s1;
			else if(d1 == 1'b1 && d2 == 1'b1)
				state <= s2;
			else if(d1 == 1'b0 && d2 == 1'b0)
				state <= 3'b101;
			else	
				state <= s0;							
		s2:
			if(d1 == 1'b1 && d2 == 1'b0)
				state <= s1;
			else if(d1 == 1'b1 && d2 == 1'b1)
				state <= s2;
			else if(d1 == 1'b0 && d2 == 1'b1)
				state <= s3;
			else
				state <= s0;															
		s3:
			if(d1 == 1'b0 && d2 == 1'b1)
				state <= s3;
			else if(d1 == 1'b1 && d2 == 1'b1)
				state <= s2;
			else if(d1 == 1'b0 && d2 == 1'b0)
				state <= s4;	
			else
				state <= s0;
		s4:
		begin
			count[2:0] <= count[2:0] + 1'b1;
			state <= s0;
		end	
		s5:
		begin
			count[2:0] <= count[2:0] - 1'b1;
			state <= s0;
		end			 			
		default:
			state <= s0;
	endcase
end

assign counter[2:0] = count[2:0];

endmodule



