/*----------------------------------------------------------------------------
  Copyright (c) 2004 Aoki laboratory. All rights reserved.

  Top module: UBBKA_15_0_15_0

  Operand-1 length: 16
  Operand-2 length: 16
  Two-operand addition algorithm: Brent-Kung adder
----------------------------------------------------------------------------*/

module GPGenerator(Go, Po, A, B);
  output Go;
  output Po;
  input A;
  input B;
  assign Go = A & B;
  assign Po = A ^ B;
endmodule

module CarryOperator(Go, Po, Gi1, Pi1, Gi2, Pi2);
  output Go;
  output Po;
  input Gi1;
  input Gi2;
  input Pi1;
  input Pi2;
  assign Go = Gi1 | ( Gi2 & Pi1 );
  assign Po = Pi1 & Pi2;
endmodule

module UBPriBKA_15_0(S, X, Y, Cin, clk, rst);
  output reg[16:0] S;
  input Cin;
  input [15:0] X;
  input [15:0] Y;
  input clk, rst;
  wire [15:0] G0;
  wire [15:0] G1;
  wire [15:0] G2;
  wire [15:0] G3;
  wire [15:0] G4;
  wire [15:0] G5;
  wire [15:0] G6;
  wire [15:0] G7;
  wire [15:0] G8;
  wire [15:0] P0;
  wire [15:0] P1;
  wire [15:0] P2;
  wire [15:0] P3;
  wire [15:0] P4;
  wire [15:0] P5;
  wire [15:0] P6;
  wire [15:0] P7;
  wire [15:0] P8;
  assign P1[0] = P0[0];
  assign G1[0] = G0[0];
  assign P1[2] = P0[2];
  assign G1[2] = G0[2];
  assign P1[4] = P0[4];
  assign G1[4] = G0[4];
  assign P1[6] = P0[6];
  assign G1[6] = G0[6];
  assign P1[8] = P0[8];
  assign G1[8] = G0[8];
  assign P1[10] = P0[10];
  assign G1[10] = G0[10];
  assign P1[12] = P0[12];
  assign G1[12] = G0[12];
  assign P1[14] = P0[14];
  assign G1[14] = G0[14];
  assign P2[0] = P1[0];
  assign G2[0] = G1[0];
  assign P2[1] = P1[1];
  assign G2[1] = G1[1];
  assign P2[2] = P1[2];
  assign G2[2] = G1[2];
  assign P2[4] = P1[4];
  assign G2[4] = G1[4];
  assign P2[5] = P1[5];
  assign G2[5] = G1[5];
  assign P2[6] = P1[6];
  assign G2[6] = G1[6];
  assign P2[8] = P1[8];
  assign G2[8] = G1[8];
  assign P2[9] = P1[9];
  assign G2[9] = G1[9];
  assign P2[10] = P1[10];
  assign G2[10] = G1[10];
  assign P2[12] = P1[12];
  assign G2[12] = G1[12];
  assign P2[13] = P1[13];
  assign G2[13] = G1[13];
  assign P2[14] = P1[14];
  assign G2[14] = G1[14];
  assign P3[0] = P2[0];
  assign G3[0] = G2[0];
  assign P3[1] = P2[1];
  assign G3[1] = G2[1];
  assign P3[2] = P2[2];
  assign G3[2] = G2[2];
  assign P3[3] = P2[3];
  assign G3[3] = G2[3];
  assign P3[4] = P2[4];
  assign G3[4] = G2[4];
  assign P3[5] = P2[5];
  assign G3[5] = G2[5];
  assign P3[6] = P2[6];
  assign G3[6] = G2[6];
  assign P3[8] = P2[8];
  assign G3[8] = G2[8];
  assign P3[9] = P2[9];
  assign G3[9] = G2[9];
  assign P3[10] = P2[10];
  assign G3[10] = G2[10];
  assign P3[11] = P2[11];
  assign G3[11] = G2[11];
  assign P3[12] = P2[12];
  assign G3[12] = G2[12];
  assign P3[13] = P2[13];
  assign G3[13] = G2[13];
  assign P3[14] = P2[14];
  assign G3[14] = G2[14];
  assign P4[0] = P3[0];
  assign G4[0] = G3[0];
  assign P4[1] = P3[1];
  assign G4[1] = G3[1];
  assign P4[2] = P3[2];
  assign G4[2] = G3[2];
  assign P4[3] = P3[3];
  assign G4[3] = G3[3];
  assign P4[4] = P3[4];
  assign G4[4] = G3[4];
  assign P4[5] = P3[5];
  assign G4[5] = G3[5];
  assign P4[6] = P3[6];
  assign G4[6] = G3[6];
  assign P4[7] = P3[7];
  assign G4[7] = G3[7];
  assign P4[8] = P3[8];
  assign G4[8] = G3[8];
  assign P4[9] = P3[9];
  assign G4[9] = G3[9];
  assign P4[10] = P3[10];
  assign G4[10] = G3[10];
  assign P4[11] = P3[11];
  assign G4[11] = G3[11];
  assign P4[12] = P3[12];
  assign G4[12] = G3[12];
  assign P4[13] = P3[13];
  assign G4[13] = G3[13];
  assign P4[14] = P3[14];
  assign G4[14] = G3[14];
  assign P5[0] = P4[0];
  assign G5[0] = G4[0];
  assign P5[1] = P4[1];
  assign G5[1] = G4[1];
  assign P5[2] = P4[2];
  assign G5[2] = G4[2];
  assign P5[3] = P4[3];
  assign G5[3] = G4[3];
  assign P5[4] = P4[4];
  assign G5[4] = G4[4];
  assign P5[5] = P4[5];
  assign G5[5] = G4[5];
  assign P5[6] = P4[6];
  assign G5[6] = G4[6];
  assign P5[7] = P4[7];
  assign G5[7] = G4[7];
  assign P5[8] = P4[8];
  assign G5[8] = G4[8];
  assign P5[9] = P4[9];
  assign G5[9] = G4[9];
  assign P5[10] = P4[10];
  assign G5[10] = G4[10];
  assign P5[11] = P4[11];
  assign G5[11] = G4[11];
  assign P5[12] = P4[12];
  assign G5[12] = G4[12];
  assign P5[13] = P4[13];
  assign G5[13] = G4[13];
  assign P5[14] = P4[14];
  assign G5[14] = G4[14];
  assign P5[15] = P4[15];
  assign G5[15] = G4[15];
  assign P6[0] = P5[0];
  assign G6[0] = G5[0];
  assign P6[1] = P5[1];
  assign G6[1] = G5[1];
  assign P6[2] = P5[2];
  assign G6[2] = G5[2];
  assign P6[3] = P5[3];
  assign G6[3] = G5[3];
  assign P6[4] = P5[4];
  assign G6[4] = G5[4];
  assign P6[5] = P5[5];
  assign G6[5] = G5[5];
  assign P6[6] = P5[6];
  assign G6[6] = G5[6];
  assign P6[7] = P5[7];
  assign G6[7] = G5[7];
  assign P6[8] = P5[8];
  assign G6[8] = G5[8];
  assign P6[9] = P5[9];
  assign G6[9] = G5[9];
  assign P6[10] = P5[10];
  assign G6[10] = G5[10];
  assign P6[12] = P5[12];
  assign G6[12] = G5[12];
  assign P6[13] = P5[13];
  assign G6[13] = G5[13];
  assign P6[14] = P5[14];
  assign G6[14] = G5[14];
  assign P6[15] = P5[15];
  assign G6[15] = G5[15];
  assign P7[0] = P6[0];
  assign G7[0] = G6[0];
  assign P7[1] = P6[1];
  assign G7[1] = G6[1];
  assign P7[2] = P6[2];
  assign G7[2] = G6[2];
  assign P7[3] = P6[3];
  assign G7[3] = G6[3];
  assign P7[4] = P6[4];
  assign G7[4] = G6[4];
  assign P7[6] = P6[6];
  assign G7[6] = G6[6];
  assign P7[7] = P6[7];
  assign G7[7] = G6[7];
  assign P7[8] = P6[8];
  assign G7[8] = G6[8];
  assign P7[10] = P6[10];
  assign G7[10] = G6[10];
  assign P7[11] = P6[11];
  assign G7[11] = G6[11];
  assign P7[12] = P6[12];
  assign G7[12] = G6[12];
  assign P7[14] = P6[14];
  assign G7[14] = G6[14];
  assign P7[15] = P6[15];
  assign G7[15] = G6[15];
  assign P8[0] = P7[0];
  assign G8[0] = G7[0];
  assign P8[1] = P7[1];
  assign G8[1] = G7[1];
  assign P8[3] = P7[3];
  assign G8[3] = G7[3];
  assign P8[5] = P7[5];
  assign G8[5] = G7[5];
  assign P8[7] = P7[7];
  assign G8[7] = G7[7];
  assign P8[9] = P7[9];
  assign G8[9] = G7[9];
  assign P8[11] = P7[11];
  assign G8[11] = G7[11];
  assign P8[13] = P7[13];
  assign G8[13] = G7[13];
  assign P8[15] = P7[15];
  assign G8[15] = G7[15];
  GPGenerator U0 (G0[0], P0[0], X[0], Y[0]);
  GPGenerator U1 (G0[1], P0[1], X[1], Y[1]);
  GPGenerator U2 (G0[2], P0[2], X[2], Y[2]);
  GPGenerator U3 (G0[3], P0[3], X[3], Y[3]);
  GPGenerator U4 (G0[4], P0[4], X[4], Y[4]);
  GPGenerator U5 (G0[5], P0[5], X[5], Y[5]);
  GPGenerator U6 (G0[6], P0[6], X[6], Y[6]);
  GPGenerator U7 (G0[7], P0[7], X[7], Y[7]);
  GPGenerator U8 (G0[8], P0[8], X[8], Y[8]);
  GPGenerator U9 (G0[9], P0[9], X[9], Y[9]);
  GPGenerator U10 (G0[10], P0[10], X[10], Y[10]);
  GPGenerator U11 (G0[11], P0[11], X[11], Y[11]);
  GPGenerator U12 (G0[12], P0[12], X[12], Y[12]);
  GPGenerator U13 (G0[13], P0[13], X[13], Y[13]);
  GPGenerator U14 (G0[14], P0[14], X[14], Y[14]);
  GPGenerator U15 (G0[15], P0[15], X[15], Y[15]);
  CarryOperator U16 (G1[1], P1[1], G0[1], P0[1], G0[0], P0[0]);
  CarryOperator U17 (G1[3], P1[3], G0[3], P0[3], G0[2], P0[2]);
  CarryOperator U18 (G1[5], P1[5], G0[5], P0[5], G0[4], P0[4]);
  CarryOperator U19 (G1[7], P1[7], G0[7], P0[7], G0[6], P0[6]);
  CarryOperator U20 (G1[9], P1[9], G0[9], P0[9], G0[8], P0[8]);
  CarryOperator U21 (G1[11], P1[11], G0[11], P0[11], G0[10], P0[10]);
  CarryOperator U22 (G1[13], P1[13], G0[13], P0[13], G0[12], P0[12]);
  CarryOperator U23 (G1[15], P1[15], G0[15], P0[15], G0[14], P0[14]);
  CarryOperator U24 (G2[3], P2[3], G1[3], P1[3], G1[1], P1[1]);
  CarryOperator U25 (G2[7], P2[7], G1[7], P1[7], G1[5], P1[5]);
  CarryOperator U26 (G2[11], P2[11], G1[11], P1[11], G1[9], P1[9]);
  CarryOperator U27 (G2[15], P2[15], G1[15], P1[15], G1[13], P1[13]);
  CarryOperator U28 (G3[7], P3[7], G2[7], P2[7], G2[3], P2[3]);
  CarryOperator U29 (G3[15], P3[15], G2[15], P2[15], G2[11], P2[11]);
  CarryOperator U30 (G4[15], P4[15], G3[15], P3[15], G3[7], P3[7]);
  CarryOperator U31 (G6[11], P6[11], G5[11], P5[11], G5[7], P5[7]);
  CarryOperator U32 (G7[5], P7[5], G6[5], P6[5], G6[3], P6[3]);
  CarryOperator U33 (G7[9], P7[9], G6[9], P6[9], G6[7], P6[7]);
  CarryOperator U34 (G7[13], P7[13], G6[13], P6[13], G6[11], P6[11]);
  CarryOperator U35 (G8[2], P8[2], G7[2], P7[2], G7[1], P7[1]);
  CarryOperator U36 (G8[4], P8[4], G7[4], P7[4], G7[3], P7[3]);
  CarryOperator U37 (G8[6], P8[6], G7[6], P7[6], G7[5], P7[5]);
  CarryOperator U38 (G8[8], P8[8], G7[8], P7[8], G7[7], P7[7]);
  CarryOperator U39 (G8[10], P8[10], G7[10], P7[10], G7[9], P7[9]);
  CarryOperator U40 (G8[12], P8[12], G7[12], P7[12], G7[11], P7[11]);
  CarryOperator U41 (G8[14], P8[14], G7[14], P7[14], G7[13], P7[13]);
 
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      S <= 17'b0; // Reiniciar S en caso de reset
    end else begin
      S[0] <= Cin ^ P0[0];
      S[1] <= ( G8[0] | ( P8[0] & Cin ) ) ^ P0[1];
      S[2] <= ( G8[1] | ( P8[1] & Cin ) ) ^ P0[2];
      S[3] <= ( G8[2] | ( P8[2] & Cin ) ) ^ P0[3];
      S[4] <= ( G8[3] | ( P8[3] & Cin ) ) ^ P0[4];
      S[5] <= ( G8[4] | ( P8[4] & Cin ) ) ^ P0[5];
      S[6] <= ( G8[5] | ( P8[5] & Cin ) ) ^ P0[6];
      S[7] <= ( G8[6] | ( P8[6] & Cin ) ) ^ P0[7];
      S[8] <= ( G8[7] | ( P8[7] & Cin ) ) ^ P0[8];
      S[9] <= ( G8[8] | ( P8[8] & Cin ) ) ^ P0[9];
      S[10] <= ( G8[9] | ( P8[9] & Cin ) ) ^ P0[10];
      S[11] <= ( G8[10] | ( P8[10] & Cin ) ) ^ P0[11];
      S[12] <= ( G8[11] | ( P8[11] & Cin ) ) ^ P0[12];
      S[13] <= ( G8[12] | ( P8[12] & Cin ) ) ^ P0[13];
      S[14] <= ( G8[13] | ( P8[13] & Cin ) ) ^ P0[14];
      S[15] <= ( G8[14] | ( P8[14] & Cin ) ) ^ P0[15];
      S[16] <= G8[15] | ( P8[15] & Cin );
    end
  end
  
endmodule

//module UBZero_0_0(O);
 // output [0:0] O;
  //assign O[0] = 0;
//endmodule

module UBBKA_15_0_15_0 (S, X, Y, clk, rst);
  output [16:0] S;
  input [15:0] X;
  input [15:0] Y;
  input clk;
  input rst;
  UBPureBKA_15_0 U0 (S[16:0], X[15:0], Y[15:0], clk, rst);
endmodule

module UBPureBKA_15_0 (S, X, Y, clk, rst);
  output [16:0] S;
  input [15:0] X;
  input [15:0] Y;
  wire C;
  input clk, rst;
  UBPriBKA_15_0 U0 (S, X, Y, 1'b0, clk, rst);
  //UBZero_0_0 U1 (C);
endmodule
