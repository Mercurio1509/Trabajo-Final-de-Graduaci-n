/* Generated by Yosys 0.33 (git sha1 2584903a060) */

module KS_16b(rst, clk, \Y~15 , \Y~14 , \Y~13 , \Y~12 , \Y~11 , \Y~10 , \Y~9 , \Y~8 , \Y~7 , \Y~6 , \Y~5 , \Y~4 , \Y~3 , \Y~2 , \Y~1 , \Y~0 , \X~15 , \X~14 , \X~13 
, \X~12 , \X~11 , \X~10 , \X~9 , \X~8 , \X~7 , \X~6 , \X~5 , \X~4 , \X~3 , \X~2 , \X~1 , \X~0 , \S~12 , \S~16 , \S~15 , \S~14 , \S~13 , \S~11 , \S~10 , \S~9 
, \S~8 , \S~7 , \S~6 , \S~5 , \S~4 , \S~3 , \S~2 , \S~1 , \S~0 );
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
  wire new_new_n112_1;
  wire new_new_n114;
  wire new_new_n115_1;
  wire new_new_n116_1;
  wire new_new_n117;
  wire new_new_n119_1;
  wire new_new_n120_1;
  wire new_new_n121;
  wire new_new_n122;
  wire new_new_n124_1;
  wire new_new_n125;
  wire new_new_n126;
  wire new_new_n127_1;
  wire new_new_n128_1;
  wire new_new_n130;
  wire new_new_n131_1;
  wire new_new_n132_1;
  wire new_new_n133;
  wire new_new_n136_1;
  wire new_new_n138;
  wire new_new_n139_1;
  wire new_new_n140_1;
  wire new_new_n141;
  wire new_new_n142;
  wire new_new_n143_1;
  wire new_new_n145;
  wire new_new_n146;
  wire new_new_n147_1;
  wire new_new_n148_1;
  wire new_new_n149;
  wire new_new_n150;
  wire new_new_n151_1;
  wire new_new_n154;
  wire new_new_n156;
  wire new_new_n157;
  wire new_new_n158;
  wire new_new_n160;
  wire new_new_n161;
  wire new_new_n162;
  wire new_new_n163;
  wire new_new_n164;
  wire new_new_n165;
  wire new_new_n167;
  wire new_new_n168;
  wire new_new_n169;
  wire new_new_n171;
  wire new_new_n172;
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
  assign new_new_n112_1 = 4'h6 >> { \X~4 , \Y~4  };
  assign new_new_n114 = 4'h1 >> { \X~3 , \Y~3  };
  assign new_new_n115_1 = 4'h1 >> { \X~4 , \Y~4  };
  assign new_new_n116_1 = 4'h6 >> { \X~5 , \Y~5  };
  assign new_new_n117 = 16'h0777 >> { \X~3 , \Y~3 , \X~4 , \Y~4  };
  assign new_new_n119_1 = 64'h00000000f7755555 >> { new_new_n120_1, new_new_n112_1, \X~3 , \Y~3 , new_new_n110, new_new_n121 };
  assign new_new_n120_1 = 4'h1 >> { \X~5 , \Y~5  };
  assign new_new_n121 = 16'h0777 >> { \X~4 , \Y~4 , \X~5 , \Y~5  };
  assign new_new_n122 = 4'h6 >> { \X~6 , \Y~6  };
  assign new_new_n124_1 = 4'h1 >> { new_new_n127_1, new_new_n125 };
  assign new_new_n125 = 64'hff00e000ff00ff00 >> { new_new_n116_1, new_new_n115_1, new_new_n126, new_new_n117, new_new_n114, new_new_n110 };
  assign new_new_n126 = 16'h0777 >> { \X~5 , \Y~5 , \X~6 , \Y~6  };
  assign new_new_n127_1 = 4'h1 >> { \X~6 , \Y~6  };
  assign new_new_n128_1 = 4'h6 >> { \X~7 , \Y~7  };
  assign n136 = 64'h0000ff700000008f >> { new_new_n133, rst, new_new_n132_1, new_new_n130, new_new_n122, new_new_n119_1 };
  assign new_new_n130 = 8'h07 >> { new_new_n131_1, \X~6 , \Y~6  };
  assign new_new_n131_1 = 4'h8 >> { \X~7 , \Y~7  };
  assign new_new_n132_1 = 4'h1 >> { \X~7 , \Y~7  };
  assign new_new_n133 = 4'h6 >> { \X~8 , \Y~8  };
  assign n140 = 32'd7405710 >> { new_new_n136_1, rst, n136, \X~8 , \Y~8  };
  assign new_new_n136_1 = 4'h6 >> { \X~9 , \Y~9  };
  assign n144 = 16'h0e01 >> { new_new_n143_1, rst, new_new_n142, new_new_n138 };
  assign new_new_n138 = 64'hff007000ff00ff00 >> { new_new_n133, new_new_n132_1, new_new_n139_1, new_new_n130, new_new_n119_1, new_new_n122 };
  assign new_new_n139_1 = 4'h1 >> { new_new_n141, new_new_n140_1 };
  assign new_new_n140_1 = 4'h8 >> { \X~8 , \Y~8  };
  assign new_new_n141 = 4'h8 >> { \X~9 , \Y~9  };
  assign new_new_n142 = 4'h1 >> { \X~9 , \Y~9  };
  assign new_new_n143_1 = 4'h6 >> { \X~10 , \Y~10  };
  assign n148 = 32'd15990795 >> { new_new_n151_1, rst, new_new_n150, new_new_n148_1, new_new_n145 };
  assign new_new_n145 = 64'h000010ff00000000 >> { new_new_n136_1, new_new_n147_1, new_new_n146, new_new_n128_1, new_new_n125, new_new_n127_1 };
  assign new_new_n146 = 4'h1 >> { new_new_n140_1, new_new_n131_1 };
  assign new_new_n147_1 = 4'h1 >> { \X~8 , \Y~8  };
  assign new_new_n148_1 = 4'h1 >> { new_new_n149, new_new_n141 };
  assign new_new_n149 = 4'h8 >> { \X~10 , \Y~10  };
  assign new_new_n150 = 4'h1 >> { \X~10 , \Y~10  };
  assign new_new_n151_1 = 4'h6 >> { \X~11 , \Y~11  };
  assign n152 = 32'd7405710 >> { new_new_n154, rst, n148, \X~11 , \Y~11  };
  assign new_new_n154 = 4'h6 >> { \X~12 , \Y~12  };
  assign n156 = 8'h14 >> { new_new_n158, new_new_n156, rst };
  assign new_new_n156 = 64'h0fbf0f0f0f0f0f0f >> { new_new_n151_1, new_new_n154, new_new_n150, new_new_n157, new_new_n148_1, new_new_n145 };
  assign new_new_n157 = 16'h1777 >> { \X~11 , \Y~11 , \X~12 , \Y~12  };
  assign new_new_n158 = 4'h6 >> { \X~13 , \Y~13  };
  assign n160 = 32'd15990795 >> { new_new_n164, rst, new_new_n163, new_new_n165, new_new_n160 };
  assign new_new_n160 = 64'h000010ff00000000 >> { new_new_n154, new_new_n162, new_new_n161, new_new_n143_1, new_new_n138, new_new_n142 };
  assign new_new_n161 = 8'h07 >> { new_new_n149, \X~11 , \Y~11  };
  assign new_new_n162 = 4'h1 >> { \X~11 , \Y~11  };
  assign new_new_n163 = 4'h1 >> { \X~13 , \Y~13  };
  assign new_new_n164 = 4'h6 >> { \X~14 , \Y~14  };
  assign new_new_n165 = 16'h0777 >> { \X~12 , \Y~12 , \X~13 , \Y~13  };
  assign n164 = 64'h0000ff700000008f >> { new_new_n168, rst, new_new_n167, new_new_n169, new_new_n158, new_new_n156 };
  assign new_new_n167 = 4'h1 >> { \X~14 , \Y~14  };
  assign new_new_n168 = 4'h6 >> { \X~15 , \Y~15  };
  assign new_new_n169 = 16'h0777 >> { \X~13 , \Y~13 , \X~14 , \Y~14  };
  assign n168 = 64'h0fbf0f0f00000000 >> { new_new_n172, new_new_n164, new_new_n163, new_new_n171, new_new_n165, new_new_n160 };
  assign new_new_n171 = 16'h0777 >> { \X~14 , \Y~14 , \X~15 , \Y~15  };
  assign new_new_n172 = 8'h0e >> { rst, \X~15 , \Y~15  };
  assign n132 = \X~7 ;
  assign n128 = \X~6 ;
  assign n124 = \X~5 ;
  assign n120 = \X~4 ;
  assign n116 = \X~3 ;
  assign n112 = \X~2 ;
  assign n108 = \X~1 ;
  assign n104 = \X~0 ;
endmodule
