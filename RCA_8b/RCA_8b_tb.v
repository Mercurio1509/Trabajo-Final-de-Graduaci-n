`timescale 1ns / 1ps

module tb_ripple_carry_adder_8bit;

    // Señales de prueba
    reg clk;
    reg rst;
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    // Instancia del módulo ripple_carry_adder_8bit
    ripple_carry_adder_8bit uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Generación de la señal de reloj (50 MHz)
    always #10 clk = ~clk;

    // Procedimiento de prueba
    initial begin
        // Inicialización de señales
        clk = 0;
        rst = 1;
        a = 8'd0;
        b = 8'd0;
        cin = 1'b0;

        // Mantener reset por 20 ns
        #20 rst = 0;

        // Prueba 1: Suma simple
        a = 8'd15;   // 15 en decimal
        b = 8'd10;   // 10 en decimal
        cin = 1'b0;  // Sin acarreo de entrada
        #20;         // Esperar tiempo suficiente para el cálculo

        // Prueba 2: Suma con acarreo de entrada
        a = 8'd200;  // 200 en decimal
        b = 8'd55;   // 55 en decimal
        cin = 1'b1;  // Con acarreo de entrada
        #20;

        // Prueba 3: Resultado de acarreo
        a = 8'hFF;   // 255 en decimal
        b = 8'h01;   // 1 en decimal
        cin = 1'b0;  // Sin acarreo de entrada
        #20;

        // Prueba 4: Resultado con acarreo de entrada
        a = 8'h7F;   // 127 en decimal
        b = 8'h80;   // 128 en decimal
        cin = 1'b1;  // Con acarreo de entrada
        #20;

        // Prueba 5: Resultado con el máximo valor posible
        a = 8'hFF;   // 255 en decimal
        b = 8'hFF;   // 255 en decimal
        cin = 1'b0;  // Sin acarreo de entrada
        #20;

        // Fin de las pruebas
        $finish;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Time=%0t | a=%
