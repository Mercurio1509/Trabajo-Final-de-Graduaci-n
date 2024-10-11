/* Generated by Yosys 0.33 (git sha1 2584903a060) */

module UBBKA_15_0_15_0(\Y~7 , rst, clk, \Y~15 , \Y~14 , \Y~13 , \Y~12 , \Y~11 , \Y~10 , \Y~9 , \Y~8 , \Y~6 , \Y~5 , \Y~4 , \Y~3 , \Y~2 , \Y~1 , \Y~0 , \X~15 , \X~14 , \X~13 
, \X~12 , \X~11 , \X~10 , \X~9 , \X~8 , \X~7 , \X~6 , \X~5 , \X~4 , \X~3 , \X~2 , \X~1 , \X~0 , \S~8 , \S~9 , \S~7 , \S~6 , \S~5 , \S~4 , \S~3 , \S~2 
, \S~1 , \S~0 , \S~14 , \S~15 , \S~16 , \S~10 , \S~11 , \S~12 , \S~13 );
  output \S~0 ;
  reg \S~0 ;
  output \S~1 ;
  reg \S~1 ;
  output \S~10 ;
  reg \S~10 ;
  output \S~11 ;
  reg \S~11 ;
  output \S~12 ;
  reg \S~12 ;
  output \S~13 ;
  reg \S~13 ;
  output \S~14 ;
  reg \S~14 ;
  output \S~15 ;
  reg \S~15 ;
  output \S~16 ;
  reg \S~16 ;
  output \S~2 ;
  reg \S~2 ;
  output \S~3 ;
  reg \S~3 ;
  output \S~4 ;
  reg \S~4 ;
  output \S~5 ;
  reg \S~5 ;
  output \S~6 ;
  reg \S~6 ;
  output \S~7 ;
  reg \S~7 ;
  output \S~8 ;
  reg \S~8 ;
  output \S~9 ;
  reg \S~9 ;
  input \X~0 ;
  wire \X~0 ;
  input \X~1 ;
  wire \X~1 ;
  input \X~10 ;
  wire \X~10 ;
  input \X~11 ;
  wire \X~11 ;
  input \X~12 ;
  wire \X~12 ;
  input \X~13 ;
  wire \X~13 ;
  input \X~14 ;
  wire \X~14 ;
  input \X~15 ;
  wire \X~15 ;
  input \X~2 ;
  wire \X~2 ;
  input \X~3 ;
  wire \X~3 ;
  input \X~4 ;
  wire \X~4 ;
  input \X~5 ;
  wire \X~5 ;
  input \X~6 ;
  wire \X~6 ;
  input \X~7 ;
  wire \X~7 ;
  input \X~8 ;
  wire \X~8 ;
  input \X~9 ;
  wire \X~9 ;
  input \Y~0 ;
  wire \Y~0 ;
  input \Y~1 ;
  wire \Y~1 ;
  input \Y~10 ;
  wire \Y~10 ;
  input \Y~11 ;
  wire \Y~11 ;
  input \Y~12 ;
  wire \Y~12 ;
  input \Y~13 ;
  wire \Y~13 ;
  input \Y~14 ;
  wire \Y~14 ;
  input \Y~15 ;
  wire \Y~15 ;
  input \Y~2 ;
  wire \Y~2 ;
  input \Y~3 ;
  wire \Y~3 ;
  input \Y~4 ;
  wire \Y~4 ;
  input \Y~5 ;
  wire \Y~5 ;
  input \Y~6 ;
  wire \Y~6 ;
  input \Y~7 ;
  wire \Y~7 ;
  input \Y~8 ;
  wire \Y~8 ;
  input \Y~9 ;
  wire \Y~9 ;
  input clk;
  wire clk;
  wire n104;
  wire n108;
  wire n112;
  wire n116;
  wire n120;
  wire n124;
  wire n128;
  wire n132;
  wire n136;
  wire n140;
  wire n144;
  wire n148;
  wire n152;
  wire n156;
  wire n160;
  wire n164;
  wire n168;
  wire new_new_n108_1;
  wire new_new_n110;
  wire new_new_n113;
  wire new_new_n115_1;
  wire new_new_n116_1;
  wire new_new_n117;
  wire new_new_n119_1;
  wire new_new_n121;
  wire new_new_n123_1;
  wire new_new_n126;
  wire new_new_n127_1;
  wire new_new_n128_1;
  wire new_new_n129;
  wire new_new_n132_1;
  wire new_new_n135_1;
  input rst;
  wire rst;
  always @(posedge clk)
    \S~0  <= n104;
  always @(posedge clk)
    \S~9  <= n140;
  always @(posedge clk)
    \S~10  <= n144;
  always @(posedge clk)
    \S~11  <= n148;
  always @(posedge clk)
    \S~12  <= n152;
  always @(posedge clk)
    \S~13  <= n156;
  always @(posedge clk)
    \S~14  <= n160;
  always @(posedge clk)
    \S~15  <= n164;
  always @(posedge clk)
    \S~16  <= n168;
  always @(posedge clk)
    \S~1  <= n108;
  always @(posedge clk)
    \S~2  <= n112;
  always @(posedge clk)
    \S~3  <= n116;
  always @(posedge clk)
    \S~4  <= n120;
  always @(posedge clk)
    \S~5  <= n124;
  always @(posedge clk)
    \S~6  <= n128;
  always @(posedge clk)
    \S~7  <= n132;
  always @(posedge clk)
    \S~8  <= n136;
  assign new_new_n108_1 = 16'h1777 >> { \X~0 , \Y~0 , \X~1 , \Y~1  };
  assign new_new_n110 = 64'h0157157f157f157f >> { \X~0 , \Y~0 , \X~2 , \X~1 , \Y~1 , \Y~2  };
  assign new_new_n113 = 32'd53160767 >> { \X~3 , \Y~3 , \X~4 , \Y~4 , new_new_n110 };
  assign new_new_n115_1 = 64'hfcd4d4c000000000 >> { new_new_n116_1, \X~3 , \Y~3 , \X~4 , \Y~4 , new_new_n110 };
  assign new_new_n116_1 = 4'h6 >> { \X~5 , \Y~5  };
  assign new_new_n117 = 4'h8 >> { \X~5 , \Y~5  };
  assign n132 = 16'h1441 >> { \X~7 , \Y~7 , new_new_n119_1, rst };
  assign new_new_n119_1 = 16'h1117 >> { new_new_n117, new_new_n115_1, \X~6 , \Y~6  };
  assign n136 = 16'h1441 >> { \X~8 , \Y~8 , new_new_n121, rst };
  assign new_new_n121 = 64'h015701570157157f >> { new_new_n115_1, new_new_n117, \X~7 , \X~6 , \Y~6 , \Y~7  };
  assign n140 = 16'h1441 >> { \X~9 , \Y~9 , new_new_n123_1, rst };
  assign new_new_n123_1 = 8'h2b >> { \X~8 , \Y~8 , new_new_n121 };
  assign n144 = 64'h00d4002b002b00d4 >> { \X~10 , \Y~10 , rst, \X~9 , \Y~9 , new_new_n123_1 };
  assign n148 = 16'h1441 >> { \X~11 , \Y~11 , new_new_n126, rst };
  assign new_new_n126 = 4'h1 >> { new_new_n129, new_new_n127_1 };
  assign new_new_n127_1 = 64'hfcd4d4c000000000 >> { new_new_n128_1, \X~8 , \Y~8 , \X~9 , \Y~9 , new_new_n121 };
  assign new_new_n128_1 = 4'h6 >> { \X~10 , \Y~10  };
  assign new_new_n129 = 4'h8 >> { \X~10 , \Y~10  };
  assign n152 = 64'h00d4002b002b00d4 >> { \X~12 , \Y~12 , rst, \X~11 , \Y~11 , new_new_n126 };
  assign n156 = 16'h1441 >> { \X~13 , \Y~13 , new_new_n132_1, rst };
  assign new_new_n132_1 = 64'h015701570157157f >> { new_new_n127_1, new_new_n129, \X~12 , \X~11 , \Y~11 , \Y~12  };
  assign n160 = 64'h00d4002b002b00d4 >> { \X~14 , \Y~14 , rst, \X~13 , \Y~13 , new_new_n132_1 };
  assign n164 = 16'h1441 >> { \X~15 , \Y~15 , new_new_n135_1, rst };
  assign new_new_n135_1 = 32'd53160767 >> { \X~13 , \Y~13 , \X~14 , \Y~14 , new_new_n132_1 };
  assign n168 = 16'h00d4 >> { rst, \X~15 , \Y~15 , new_new_n135_1 };
  assign n128 = \Y~6 ;
  assign n124 = \Y~5 ;
  assign n120 = \Y~4 ;
  assign n116 = \Y~3 ;
  assign n112 = \Y~2 ;
  assign n108 = \Y~1 ;
  assign n104 = \Y~0 ;
endmodule
