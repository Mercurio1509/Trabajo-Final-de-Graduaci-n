module tb_CSkipA_16b;

    // Señales
    reg [15:0] a, b;    // Entradas a y b
    reg clk, rst;       // Señales de reloj y reset
    wire [15:0] sum;    // Salida sum
    wire cout;          // Salida de acarreo (carry-out)

    // Instancia del DUT (Device Under Test)
    CSkipA_16b dut (
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b),
        .clk(clk),
        .rst(rst)
    );

    // Generación del reloj
    always #5 clk = ~clk;  // Periodo de 10 unidades de tiempo

    // Procedimiento inicial para aplicar los estímulos
    initial begin
        // Inicialización
        clk = 0;
        rst = 1;
        a = 16'b0;
        b = 16'b0;
        
        #10 rst = 0;  // Desactivar el reset después de 10 unidades de tiempo

        // Caso de prueba 1: Suma básica
        a = 16'b0000000000000001;  // a = 1
        b = 16'b0000000000000010;  // b = 2
        #20; // Esperar 20 unidades de tiempo para observar el resultado
        $display("Test 1: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);

        // Caso de prueba 2: Suma con acarreo
        a = 16'b1111111111111111;  // a = 65535
        b = 16'b0000000000000001;  // b = 1
        #20;
        $display("Test 2: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);

        // Caso de prueba 3: Suma con propagación de acarreo
        a = 16'b1010101010101010;  // a = 43690
        b = 16'b0101010101010101;  // b = 21845
        #20;
        $display("Test 3: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);

        // Caso de prueba 4: Suma de números grandes
        a = 16'b1111000011110000;  // a = 61680
        b = 16'b0000111100001111;  // b = 3855
        #20;
        $display("Test 4: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);

        $finish; // Terminar la simulación
    end

endmodule
