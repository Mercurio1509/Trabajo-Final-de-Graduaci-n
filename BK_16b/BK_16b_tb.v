module testbench;
  reg [15:0] X;
  reg [15:0] Y;
  reg Cin;
  reg clk;
  reg rst;
  wire [16:0] S;

  // Instancia del módulo a probar
  UBPriBKA_15_0 uut (
    .S(S),
    .X(X),
    .Y(Y),
    .Cin(Cin),
    .clk(clk),
    .rst(rst)
  );

  // Generador de reloj
  always #5 clk = ~clk;  // Reloj con periodo de 10 unidades de tiempo

  // Monitor para mostrar las señales
  initial begin
    $monitor("Time=%0t | X=%b | Y=%b | Cin=%b | rst=%b | S=%b", 
             $time, X, Y, Cin, rst, S);
  end

  // Proceso de testeo
  initial begin
    // Inicialización de señales
    clk = 0;
    rst = 1;
    Cin = 0;
    X = 16'b0;
    Y = 16'b0;

    // Espera para simular la salida del reset
    #10 rst = 0;

    // Caso de prueba 1
    X = 16'b0000000000001010;  // 10 en binario
    Y = 16'b0000000000000101;  // 5 en binario
    Cin = 0;
    #20;  // Espera 20 unidades de tiempo

    // Caso de prueba 2
    X = 16'b1111111111111111;  // Máximo valor para X
    Y = 16'b0000000000000001;  // 1 en binario
    Cin = 0;
    #20;

    // Caso de prueba 3
    X = 16'b1010101010101010;  // Patrón alternante
    Y = 16'b0101010101010101;  // Patrón complementario
    Cin = 1;
    #20;

    // Finaliza la simulación
    $finish;
  end
endmodule
