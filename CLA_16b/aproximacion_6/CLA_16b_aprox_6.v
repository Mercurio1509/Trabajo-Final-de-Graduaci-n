/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module CLA_16b(\B~12 , clk, rst, \A~0 , \A~1 , \A~2 , \A~3 , \B~13 , \A~4 , \A~5 , \B~14 , \B~15 , \A~6 , Cin, \A~7 , \A~8 , \A~9 , \A~10 , \A~11 , \A~12 , \A~13 , \A~14 , \A~15 , \B~0 , \B~1 , \B~2 , \B~3 , \B~4 , \B~5 , \B~6 , \B~7 , \B~8 , \B~9 , \B~10 , \B~11 , \S~13 , \S~14 , \S~15 , Cout, \S~0 , \S~1 , \S~2 , \S~3 , \S~4 , \S~5 , \S~6 , \S~7 , \S~8 , \S~9 , \S~10 , \S~11 , \S~12 );
  input \A~0 ;
  input \A~1 ;
  input \A~10 ;
  input \A~11 ;
  input \A~12 ;
  input \A~13 ;
  input \A~14 ;
  input \A~15 ;
  input \A~2 ;
  input \A~3 ;
  input \A~4 ;
  input \A~5 ;
  input \A~6 ;
  input \A~7 ;
  input \A~8 ;
  input \A~9 ;
  input \B~0 ;
  input \B~1 ;
  input \B~10 ;
  input \B~11 ;
  input \B~12 ;
  input \B~13 ;
  input \B~14 ;
  input \B~15 ;
  input \B~2 ;
  input \B~3 ;
  input \B~4 ;
  input \B~5 ;
  input \B~6 ;
  input \B~7 ;
  input \B~8 ;
  input \B~9 ;
  input Cin;
  output Cout;
  output \S~0 ;
  output \S~1 ;
  output \S~10 ;
  output \S~11 ;
  output \S~12 ;
  output \S~13 ;
  output \S~14 ;
  output \S~15 ;
  output \S~2 ;
  output \S~3 ;
  output \S~4 ;
  output \S~5 ;
  output \S~6 ;
  output \S~7 ;
  output \S~8 ;
  output \S~9 ;
  input clk;
  wire new_n55;
  wire new_n56;
  wire new_n57;
  wire new_n58;
  wire new_n59;
  wire new_n60;
  wire new_n61;
  wire new_n62;
  wire new_n63;
  wire new_n64;
  wire new_n65;
  wire new_n66;
  wire new_n67;
  wire new_n69;
  wire new_n70;
  wire new_n80;
  wire new_n85;
  input rst;
  assign \S~13  = 64'h0f04ff4ff0fb00b0 >> { new_n67, \A~12 , new_n66, \B~12 , new_n64, new_n55 };
  assign new_n63 = 4'h1 >> { \B~10 , \A~10  };
  assign new_n64 = 8'h07 >> { new_n65, \A~11 , \B~11  };
  assign new_n65 = 4'h8 >> { \B~10 , \A~10  };
  assign new_n66 = 4'h1 >> { \B~11 , \A~11  };
  assign new_n67 = 4'h6 >> { \A~13 , \B~13  };
  assign \S~14  = 16'he11e >> { \A~14 , \B~14 , new_n70, new_n69 };
  assign new_n69 = 64'hf000fbb000000000 >> { new_n67, new_n66, \A~12 , \B~12 , new_n64, new_n55 };
  assign new_n70 = 4'h8 >> { \A~13 , \B~13  };
  assign \S~15  = 64'hfee0011f011ffee0 >> { \A~15 , \B~15 , \A~14 , \B~14 , new_n70, new_n69 };
  assign Cout = 64'hfce8fce8fce8e8c0 >> { new_n69, new_n70, \A~14 , \A~15 , \B~15 , \B~14  };
  assign new_n55 = 64'h00000000fcd4d4c0 >> { new_n63, \B~8 , \A~8 , \B~9 , \A~9 , new_n56 };
  assign \S~6  = 8'h69 >> { \B~6 , \A~6 , new_n80 };
  assign new_n80 = 16'h1117 >> { new_n60, new_n57, \B~5 , \A~5  };
  assign \S~7  = 32'd3559599060 >> { \B~7 , \A~7 , \B~6 , \A~6 , new_n80 };
  assign \S~8  = 8'h69 >> { \B~8 , \A~8 , new_n56 };
  assign new_n56 = 64'h5757577f00000000 >> { new_n62, new_n57, new_n60, \B~5 , \A~5 , new_n61 };
  assign \S~9  = 32'd3559599060 >> { \B~9 , \A~9 , \B~8 , \A~8 , new_n56 };
  assign \S~10  = 8'h69 >> { \B~10 , \A~10 , new_n85 };
  assign new_n85 = 32'd53160767 >> { \B~8 , \A~8 , \B~9 , \A~9 , new_n56 };
  assign \S~11  = 16'he11e >> { \B~11 , \A~11 , new_n65, new_n55 };
  assign \S~12  = 32'd200602635 >> { \A~12 , \B~12 , new_n66, new_n64, new_n55 };
  assign new_n57 = 64'hfcd4d4c000000000 >> { new_n59, \B~2 , \A~2 , \B~3 , \A~3 , new_n58 };
  assign new_n58 = 32'd51844927 >> { \B~0 , Cin, \B~1 , \A~1 , \A~0  };
  assign new_n59 = 4'h6 >> { \B~4 , \A~4  };
  assign new_n60 = 4'h8 >> { \B~4 , \A~4  };
  assign new_n61 = 16'h1428 >> { \B~6 , \B~7 , \A~7 , \A~6  };
  assign new_n62 = 16'h1777 >> { \A~6 , \B~6 , \B~7 , \A~7  };
  assign \S~5  = \A~5 ;
  assign \S~4  = \A~4 ;
  assign \S~3  = \A~3 ;
  assign \S~2  = \A~2 ;
  assign \S~1  = \A~1 ;
  assign \S~0  = \A~0 ;
endmodule
