module ripple_carry_adder_8bit (
    input clk,               // Señal de reloj
    input rst,               // Señal de reset asíncrono activo en alto
    input [7:0] a,           // Primer operando de 8 bits
    input [7:0] b,           // Segundo operando de 8 bits
    input cin,               // Entrada de acarreo inicial
    output reg [7:0] sum,   // Resultado de la suma
    output reg cout          // Salida de acarreo final
);

    reg [8:0] carry; // Registro de acarreo de 9 bits para manejar el acarreo final

    // Generación de sumadores de un bit
    wire [7:0] sum_bits;
    wire [7:0] carry_out;

    // Sumadores de un bit
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : adder_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(i == 0 ? cin : carry_out[i-1]),
                .sum(sum_bits[i]),
                .cout(carry_out[i])
            );
        end
    endgenerate

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 8'd0;
            cout <= 1'b0;
        end else begin
            sum <= sum_bits;
            cout <= carry_out[7]; // El último acarreo es el acarreo final
        end
    end
endmodule

// Módulo de sumador completo (full adder)
module full_adder (
    input a,           // Primer bit de entrada
    input b,           // Segundo bit de entrada
    input cin,         // Entrada de acarreo
    output sum,        // Resultado de la suma
    output cout        // Salida de acarreo
);

    assign {cout, sum} = a + b + cin;

endmodule
