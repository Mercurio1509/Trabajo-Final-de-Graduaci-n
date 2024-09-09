module ladner_fischer_adder_16bit(
    input clk,               // Reloj
    input rst,               // Reset asíncrono activo en alto
    input [15:0] A,          // Primer operando
    input [15:0] B,          // Segundo operando
    output reg [15:0] Sum,   // Resultado de la suma
    output reg Cout          // Bit de acarreo de salida
);

    reg [15:0] G, P; // Registros para los términos Generar (Generate) y Propagar (Propagate)
    reg [15:0] C;    // Registros para los acarreos

    integer i;

    // Calcular términos G y P
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            G <= 0;
            P <= 0;
        end else begin
            for (i = 0; i < 16; i = i + 1) begin
                G[i] <= A[i] & B[i];    // Término Generar
                P[i] <= A[i] ^ B[i];    // Término Propagar
            end
        end
    end

    // Cálculo de acarreos en la estructura Ladner-Fischer
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            C <= 0;
        end else begin
            // Etapa 1
            C[0] <= G[0];
            C[1] <= G[1] | (P[1] & G[0]);

            // Etapa 2
            C[2] <= G[2] | (P[2] & G[1]);
            C[3] <= G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]);

            // Etapa 3
            C[4] <= G[4] | (P[4] & G[3]);
            C[5] <= G[5] | (P[5] & G[4]) | (P[5] & P[4] & G[3]);
            C[6] <= G[6] | (P[6] & G[5]) | (P[6] & P[5] & G[4]);
            C[7] <= G[7] | (P[7] & G[6]) | (P[7] & P[6] & G[5]) | (P[7] & P[6] & P[5] & G[4]);

            // Etapa 4
            C[8]  <= G[8] | (P[8] & G[7]);
            C[9]  <= G[9] | (P[9] & G[8]) | (P[9] & P[8] & G[7]);
            C[10] <= G[10] | (P[10] & G[9]) | (P[10] & P[9] & G[8]);
            C[11] <= G[11] | (P[11] & G[10]) | (P[11] & P[10] & G[9]) | (P[11] & P[10] & P[9] & G[8]);

            // Etapa 5
            C[12] <= G[12] | (P[12] & G[11]);
            C[13] <= G[13] | (P[13] & G[12]) | (P[13] & P[12] & G[11]);
            C[14] <= G[14] | (P[14] & G[13]) | (P[14] & P[13] & G[12]);
            C[15] <= G[15] | (P[15] & G[14]) | (P[15] & P[14] & G[13]) | (P[15] & P[14] & P[13] & G[12]);
        end
    end

    // Calcular la suma final
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Sum <= 0;
            Cout <= 0;
        end else begin
            Sum <= P ^ C; // Suma es el XOR entre términos P y acarreos C
            Cout <= C[15]; // Acarreo de salida
        end
    end
endmodule
