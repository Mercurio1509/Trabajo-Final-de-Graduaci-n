// sumador_sincrono_16bits.v
module sumador_sincrono_16bits (
    input clk,              // Reloj
    input rst,              // Reset asíncrono
    input [15:0] A,         // Primer número de 16 bits
    input [15:0] B,         // Segundo número de 16 bits
    input carry_in,         // Carry de entrada
    output reg [15:0] SUM,  // Resultado de la suma
    output reg carry_out    // Carry de salida
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        SUM <= 16'b0;
        carry_out <= 1'b0;
    end else begin
        {carry_out, SUM} <= A + B + carry_in;
    end
end

endmodule
