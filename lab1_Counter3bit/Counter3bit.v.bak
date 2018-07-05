module intro(Clk,nAReset,Sel,Out);

input Clk;
input nAReset;
input Sel;
output Out;

wire [2:0] Count;

CounterNbit #(3) Cntr1(Clk,nAReset,Count[2:0]);

OpSelect Select1(.In1(Count[0]), .In2(Count[2]), .Sel(Sel), .OpOut(Out));


endmodule