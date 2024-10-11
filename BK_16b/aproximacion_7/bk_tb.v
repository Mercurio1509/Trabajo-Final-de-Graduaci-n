module tb_brentk_16b;
    // Declaración de señales
    reg [15:0] a, b;
    reg clk, rst;
    wire [16:0] sum;

    // Memorias para almacenar los valores de a y b
    reg [15:0] memA [0:999999];  // Memoria para almacenar 1000 valores de a
    reg [15:0] memB [0:999999];  // Memoria para almacenar 1000 valores de b

    integer i, out_file;  // Variables para control de lectura y escritura

    // Instancia del módulo CSkipA_16b
    UBBKA_15_0_15_0 UUT(
        .\X~0 (a[0]), .\X~1 (a[1]), .\X~2 (a[2]), .\X~3 (a[3]), .\X~4 (a[4]), .\X~5 (a[5]), 
        .\X~6 (a[6]), .\X~7 (a[7]), .\X~8 (a[8]), .\X~9 (a[9]), .\X~10 (a[10]), .\X~11 (a[11]), 
        .\X~12 (a[12]), .\X~13 (a[13]), .\X~14 (a[14]), .\X~15 (a[15]), 
        .\Y~0 (b[0]), .\Y~1 (b[1]), .\Y~2 (b[2]), .\Y~3 (b[3]), .\Y~4 (b[4]), 
        .\Y~5 (b[5]), .\Y~6 (b[6]), .\Y~7 (b[7]), .\Y~8 (b[8]), .\Y~9 (b[9]), 
        .\Y~10 (b[10]), .\Y~11 (b[11]), .\Y~12 (b[12]), .\Y~13 (b[13]), .\Y~14 (b[14]), .\Y~15 (b[15]), 
        .clk(clk), .rst(rst),  
        .\S~0 (sum[0]), .\S~1 (sum[1]), .\S~2 (sum[2]), .\S~3 (sum[3]), .\S~4 (sum[4]), 
        .\S~5 (sum[5]), .\S~6 (sum[6]), .\S~7 (sum[7]), .\S~8 (sum[8]), .\S~9 (sum[9]), 
        .\S~10 (sum[10]), .\S~11 (sum[11]), .\S~12 (sum[12]), .\S~13 (sum[13]), 
        .\S~14 (sum[14]), .\S~15 (sum[15]), .\S~16 (sum[16])
    );

    // Generador de reloj
    always begin
        #5 clk = ~clk;
    end

    // Procedimiento inicial
    initial begin
        // Inicialización
        clk = 0;
        rst = 1;
        a = 16'b0;
        b = 16'b0;

        // Leer archivos de memoria
        $readmemh("memA.dat", memA);  // Leer valores de 'a' desde archivo memA.txt
        $readmemh("memB.dat", memB);  // Leer valores de 'b' desde archivo memB.txt

        // Abrir archivo de salida
        out_file = $fopen("output_sum.txt", "w");

        // Reset
        #10 rst = 0;

        // Aplicar valores de memA y memB
        for (i = 0; i < 1000000; i = i + 1) begin
            a = memA[i];
            b = memB[i];
            #10;  // Esperar para que los valores se propaguen
            $fwrite(out_file, "%h\n", sum);  // Escribir solo la salida sum en archivo
        end

        // Cerrar el archivo de salida
        $fclose(out_file);

        // Finalización de la simulación
        #10 $finish;
    end
endmodule

