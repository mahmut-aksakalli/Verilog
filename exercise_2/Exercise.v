module Exercise(Clk,nReset,CntEn,Cout,NextEn);

input Clk;
input nReset;
input CntEn;

output [3:0] Cout;
output NextEn;

BCDCounter BCD1(Clk,nReset,CntEn,Cout[3:0],NextEn);


endmodule
