module BCDCounter_3digit(Clk,nReset,Enable,UnD,Co1,Co10,Co100);

input Clk;
input nReset;
input Enable,UnD;

output [3:0] Co1;
output [3:0] Co10;
output [3:0] Co100;

wire NextEn,NextEn10,NextEn100,BCD2En,BCD3En;

BCD BCD1(Clk,nReset,Enable,UnD,Co1[3:0],NextEn10);

assign BCD2En = (Enable & NextEn10);
BCD BCD2(Clk,nReset,BCD2En,UnD,Co10[3:0],NextEn100);

assign BCD3En = Enable & NextEn10 & NextEn100 ;
BCD BCD3(Clk,nReset,BCD3En,UnD,Co100[3:0],NextEn);

endmodule
