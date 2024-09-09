`timescale 1ns / 1ps

module tb_sqrt_calculator;

    // Señales de prueba
    reg clk;
    reg rst;
    reg [63:0] num;
    wire [127:0] sqrt;
    wire done;

    // Instancia del módulo sqrt_calculator
    sqrt_calculator uut (
        .clk(clk),
        .rst(rst),
        .num(num),
        .sqrt(sqrt),
        .done(done)
    );

    // Generación de la señal de reloj (50 MHz)
    always #10 clk = ~clk;

    // Procedimiento de prueba
    initial begin
        // Inicialización de señales
        clk = 0;
        rst = 1;
        num = 64'd0;

        // Mantener reset por 20 ns
        #20 rst = 0;

        // Prueba 1: Raíz cuadrada de un número perfecto
        num = 64'h0000000000000040;  // 64 en decimal, raíz cuadrada = 8
        #100; // Esperar tiempo suficiente para el cálculo

        // Prueba 2: Raíz cuadrada de un número no perfecto
        num = 64'h0000000000000500;  // 1280 en decimal, raíz cuadrada aproximada = 35 (con errores de redondeo posibles)
        #100;

        // Prueba 3: Raíz cuadrada del número máximo de 64 bits
        num = 64'hFFFFFFFFFFFFFFFF;  // 18446744073709551615 en decimal, raíz cuadrada aproximada = 2^31 (2147483648)
        #100;

        // Prueba 4: Raíz cuadrada de un número grande
        num = 64'h0000000000001000;  // 4096 en decimal, raíz cuadrada = 64
        #100;

        // Prueba 5: Raíz cuadrada de un número grande pero no perfecto
        num = 64'h0000000000002000;  // 8192 en decimal, raíz cuadrada aproximada = 90 (con errores de redondeo posibles)
        #100;

        // Fin de las pruebas
        $finish;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Time=%0t | num=%h | sqrt=%h | done=%b", $time, num, sqrt, done);
    end

endmodule
