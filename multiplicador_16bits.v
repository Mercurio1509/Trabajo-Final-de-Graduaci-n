module Mult16Bit (
    input wire clk,                 // Señal de reloj
    input wire rst,                 // Señal de reset
    input wire [15:0] a,            // Primer operando de 16 bits
    input wire [15:0] b,            // Segundo operando de 16 bits
    output reg [31:0] product       // Resultado de la multiplicación de 32 bits
);

    // Registro intermedio para almacenar el resultado de la multiplicación
    reg [31:0] temp_product;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Resetear el resultado a 0
            product <= 32'b0;
        end else begin
            // Multiplicar los operandos y almacenar el resultado
            temp_product = a * b;
            product <= temp_product;
        end
    end

endmodule
