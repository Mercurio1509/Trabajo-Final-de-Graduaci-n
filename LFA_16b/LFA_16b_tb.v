`timescale 1ns / 1ps

module tb_ladner_fischer_adder_16bit;

    // Señales de entrada y salida
    reg clk;
    reg rst;
    reg [15:0] A;
    reg [15:0] B;
    wire [15:0] Sum;
    wire Cout;

    // Instancia del sumador Ladner-Fischer de 16 bits
    ladner_fischer_adder_16bit uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Generación de la señal de reloj (50 MHz)
    always #10 clk = ~clk;

    // Procedimiento de prueba
    initial begin
        // Inicialización de señales
        clk = 0;
        rst = 1;
        A = 0;
        B = 0;

        // Mantener reset por 20 ns
        #20 rst = 0;

        // Prueba 1: Suma de dos números positivos
        A = 16'h0A0A;  // 2570 en decimal
        B = 16'h0505;  // 1285 en decimal
        #20;

        // Prueba 2: Suma de un número positivo y cero
        A = 16'h1234;  // 4660 en decimal
        B = 16'h0000;  // 0 en decimal
        #20;

        // Prueba 3: Suma de números con acarreo
        A = 16'hFFFF;  // -1 en decimal (complemento a dos)
        B = 16'h0001;  // 1 en decimal
        #20;

        // Prueba 4: Suma de números grandes
        A = 16'h8000;  // 32768 en decimal
        B = 16'h8000;  // 32768 en decimal
        #20;

        // Fin de las pruebas
        $finish;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Time=%0t | A=%h | B=%h | Sum=%h | Cout=%b", $time, A, B, Sum, Cout);
    end

endmodule
