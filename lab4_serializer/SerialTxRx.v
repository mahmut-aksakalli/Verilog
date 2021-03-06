module SerialTxRx(Clk,Send,PDin[7:0],SCout,SDout,PDout,ready);

input  Clk;
input  Send;
input  [7:0] PDin;
output SCout;
output SDout;
output [7:0] PDout;
output ready;

wire SCout_;
wire SDout_;

SerialTx Tx(Clk,Send,PDin[7:0],SCout_,SDout_);

SerialRx Rx(SCout_,SDout_,PDout[7:0],ready);

assign SCout =  SCout_;
assign SDout =  SDout_;

endmodule



