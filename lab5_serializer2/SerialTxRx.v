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


//SerialTx2 Tx(Clk,Send,PDin[7:0],SCout_,SDout_);
//SerialRx Rx(SCout_,SDout_,PDout[7:0],ready);

SerialTx Tx(Clk,Send,PDin[7:0],SCout_,SDout_);
SerialRx Rx(SCout_,SDout_,PDout[7:0],ready);

assign SCout =  SCout_;
assign SDout =  SDout_;

endmodule

//module SerialTxRx(Clk,Send,PDin[7:0],SCout,SDout,PDout,ready,ParErr);
//
//input  Clk;
//input  Send;
//input  [7:0] PDin;
//output SCout;
//output SDout;
//output [7:0] PDout;
//output ready;
//output ParErr;
//
//wire SCout_;
//wire SDout_;
//
//
//SerialTx3 Tx(Clk,Send,PDin[7:0],SCout_,SDout_);
//SerialRx4 Rx(SCout_,SDout_,PDout[7:0],ready,ParErr);
//
////SerialTx Tx3(Clk,Send,PDin[7:0],SCout_,SDout_);
////SerialRx Rx(SCout_,SDout_,PDout[7:0],ready);
//
//assign SCout =  SCout_;
//assign SDout =  SDout_;
//
//endmodule
//


