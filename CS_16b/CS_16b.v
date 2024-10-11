/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * For Issues & Bugs, report to <https://github.com/mongrelgem/Verilog-Adders/issues>
*/


// Full Adder
module FA(output sum, cout, input a, b, cin);
  wire w0, w1, w2;
  
  xor (w0, a, b);
  xor (sum, w0, cin);
  
  and (w1, w0, cin);
  and (w2, a, b);
  or (cout, w1, w2);
endmodule

// Ripple Carry Adder - 4 bits
module RCA4(output [3:0] sum, output cout, input [3:0] a, b, input cin);
  
  wire [3:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], cin);
  FA fa[2:1](sum[2:1], c[3:2], a[2:1], b[2:1], c[2:1]);
  FA fa31(sum[3], cout, a[3], b[3], c[3]);
  
endmodule

module SkipLogic(output cin_next,
  input [3:0] a, b, input cin, cout);
  
  wire p0, p1, p2, p3, P, e;
  
  or (p0, a[0], b[0]);
  or (p1, a[1], b[1]);
  or (p2, a[2], b[2]);
  or (p3, a[3], b[3]);
  
  and (P, p0, p1, p2, p3);
  and (e, P, cin);
  
  or (cin_next, e, cout);

endmodule

// Carry Skip Adder - 16 bits
module CSkipA_16b (
    output reg [15:0] sum,   // Salida sum almacenada
    output reg cout,         // Acarreo de salida almacenado
    input [15:0] a, b,       // Entradas de 16 bits
    input clk,               // Señal de reloj
    input rst                // Señal de reset
);

    wire [15:0] sum_next;     // Suma próxima
    wire cout_next;           // Acarreo próximo
    wire [3:0] couts;
    wire [2:0] e;

    // Instancias del sumador Ripple Carry Adder (RCA)
    RCA4 rca0(sum_next[3:0], couts[0], a[3:0], b[3:0], 0);
    RCA4 rca[3:1](sum_next[15:4], couts[3:1], a[15:4], b[15:4], e[2:0]);

    // Instancias de la lógica de salto (Skip Logic)
    SkipLogic skip0(e[0], a[3:0], b[3:0], 0, couts[0]);
    SkipLogic skip[2:1](e[2:1], a[11:4], b[11:4], e[1:0], couts[2:1]);
    SkipLogic skip3(cout_next, a[15:12], b[15:12], e[2], couts[3]);

    // Bloque secuencial sincronizado con el flanco positivo del reloj
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset sincrónico
            sum <= 16'b0;
            cout <= 1'b0;
        end else begin
            // Capturar la suma y el acarreo en los registros
            sum <= sum_next;
            cout <= cout_next;
        end
    end

endmodule
