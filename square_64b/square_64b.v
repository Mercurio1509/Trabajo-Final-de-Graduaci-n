module sqrt_calculator (
    input clk,               // Señal de reloj
    input rst,               // Señal de reset asíncrono activo en alto
    input [63:0] num,        // Número de entrada de 64 bits
    output reg [127:0] sqrt, // Resultado de la raíz cuadrada en 128 bits
    output reg done          // Señal de finalización
);

    reg [127:0] low;          // Límite inferior para la búsqueda binaria (128 bits)
    reg [127:0] high;         // Límite superior para la búsqueda binaria (128 bits)
    reg [127:0] mid;          // Valor medio en la búsqueda binaria (128 bits)
    reg [127:0] mid_squared;  // Cuadrado del valor medio (128 bits)

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            low <= 128'd0;
            high <= 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Valor máximo posible de 128 bits
            sqrt <= 128'd0;
            done <= 1'b0;
        end else if (!done) begin
            mid <= (low + high) >> 1;
            mid_squared <= mid * mid;

            if (mid_squared == num) begin
                sqrt <= mid; // Resultados en 128 bits directamente
                done <= 1'b1;
            end else if (mid_squared < num) begin
                low <= mid + 1;
            end else begin
                high <= mid - 1;
            end

            // Verificar si la búsqueda ha terminado
            if (low > high) begin
                sqrt <= high; // Resultados en 128 bits
                done <= 1'b1;
            end
        end
    end
endmodule
