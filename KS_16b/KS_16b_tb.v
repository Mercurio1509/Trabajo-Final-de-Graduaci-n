`timescale 1ns/1ps

module testbench;
  // Definimos los parámetros de prueba
  reg [15:0] X, Y;
  reg clk, rst;
  wire [16:0] S;

  // Instanciamos el DUT (Device Under Test)
  KS_16b dut (
    .X(X),
    .Y(Y),
    .S(S),
    .clk(clk),
    .rst(rst)
  );

  // Generamos el clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Periodo de 10 ns
  end

  // Secuencia de prueba
  initial begin
    // Inicializamos la simulación
    rst = 1; 
    X = 16'b0;
    Y = 16'b0;
    #10 rst = 0; // Desactivamos reset

    // Caso de prueba 1
    #10;
    X = 16'hFFFF; 
    Y = 16'h0001;
    
    // Caso de prueba 2
    #10;
    X = 16'hAAAA;
    Y = 16'h5555;

    // Caso de prueba 3
    #10;
    X = 16'h1234;
    Y = 16'h4321;

    // Finalizamos la simulación
    #50 $finish;
  end

  // Monitor para observar los valores de las señales
  initial begin
    $monitor("Time = %0t | X = %h | Y = %h | S = %h", $time, X, Y, S);
  end

endmodule
