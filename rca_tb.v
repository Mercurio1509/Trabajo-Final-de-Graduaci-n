`timescale 1ns/1ps
module ripple_carry_adder_8bit_tb;

    // Definición de señales
    //reg clk;               // Señal de reloj
    //reg rst;               // Señal de reset
    //reg [7:0] a;           // Primer operando de 8 bits
    //reg [7:0] b;           // Segundo operando de 8 bits
    //reg cin;               // Entrada de acarreo inicial
    //wire [7:0] sum;        // Resultado de la suma
    //wire cout;             // Salida de acarreo final

    // Instancia del módulo bajo prueba (DUT: Device Under Test)
    //ripple_carry_adder_8bit uut (
      //  .clk(clk),
       // .rst(rst),
       // .a(a),
       // .b(b),
       // .cin(cin),
       // .sum(sum),
       // .cout(cout)
    //);

    // Definición de señales
    reg clk;               // Señal de reloj
    reg rst;               // Señal de reset
    reg \a~0;           // Primer operando de 8 bits
    reg \a~1;
    reg \a~2;  
    reg \a~3;  
    reg \a~4;  
    reg \a~5;  
    reg \a~6;  
    reg \a~7;    
    reg \b~0; 
    reg \b~1;           // Segundo operando de 8 bits
    reg \b~2; 
    reg \b~3; 
    reg \b~4; 
    reg \b~5; 
    reg \b~6; 
    reg \b~7; 
    reg cin;               // Entrada de acarreo inicial
    wire \sum~0;        // Resultado de la suma
    wire \sum~1; 
    wire \sum~2;
    wire \sum~3;
    wire \sum~4;
    wire \sum~5;
    wire \sum~6;
    wire \sum~7;
    wire cout;             // Salida de acarreo final

    // Instancia del módulo bajo prueba (DUT: Device Under Test)
    //ripple_carry_adder_8bit uut (
    //    .clk(clk),
    //    .rst(rst),
    //    .\a~0(\a~0),
    //    .\a~1(\a~1),
    //    .\a~2(\a~2),
    //    .\a~3(\a~3),
    //    .\a~4(\a~4),
    //    .\a~5(\a~5),
    //    .\a~6(\a~6),
    //    .\a~7(\a~7),
    //    .\b~0(\b~0),
    //    .\b~1(\b~1),
    //    .\b~2(\b~2),
    //    .\b~3(\b~3),
    //    .\b~4(\b~4),
    //    .\b~5(\b~5),
    //    .\b~6(\b~6),
    //    .\b~7(\b~7),
    //    .cin(cin),
    //    .\sum~0(\sum~0),
    //    .\sum~1(\sum~1),
    //    .\sum~2(\sum~2),
    //    .\sum~3(\sum~3),
    //    .\sum~4(\sum~4),
    //    .\sum~5(\sum~5),
    //    .\sum~6(\sum~6),
    //    .\sum~7(\sum~7),
    //    .cout(cout)
    //);

    ripple_carry_adder_8bit uut ( .* );

    initial $sdf_annotate("ripple_carry_adder_8bit_post_synthesis.sdf", uut);

    // Generación de la señal de reloj
    always begin
        #5 clk = ~clk; // Genera un pulso de reloj cada 5 unidades de tiempo
    end

    // Proceso de prueba
    initial begin
        // Inicialización de señales
        clk = 0;
        rst = 0;
        //a = 8'd0;
        //b = 8'd0;
        //cin = 1'b0;

        // Aplicar reset
        #10;
        rst = 1;
        #10;
        rst = 0;

        // Test 1: Suma básica sin acarreo
        #10;
        //a = 8'd15;   // 00001111
        //b = 8'd10;   // 00001010
        //cin = 0;
        #10;

        // Test 2: Suma con acarreo inicial
        //a = 8'd255;  // 11111111
        //b = 8'd1;    // 00000001
        //cin = 1;
        #10;

        // Test 3: Suma sin acarreo inicial, pero genera acarreo final
        //a = 8'd128;  // 10000000
        //b = 8'd128;  // 10000000
        //cin = 0;
        #10;

        // Test 4: Suma con reset activado
        rst = 1;
        #10;
        rst = 0;
        //a = 8'd85;   // 01010101
        //b = 8'd85;   // 01010101
        //cin = 1'b1;
        #10;

        // Terminar la simulación
        $stop;
    end

endmodule

