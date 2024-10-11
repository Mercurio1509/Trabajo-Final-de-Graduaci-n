module tb_CSkipA_16b;
    // Declaración de señales
    reg [15:0] a, b;
    reg clk, rst;
    wire [16:0] sum;
    wire cout;

    // Memorias para almacenar los valores de a y b
    reg [15:0] memA [0:999999];  // Memoria para almacenar 1000 valores de a
    reg [15:0] memB [0:999999];  // Memoria para almacenar 1000 valores de b

    integer i, out_file;  // Variables para control de lectura y escritura

    // Instancia del módulo CSkipA_16b
    CSkipA_16b UUT(
        .\a~0 (a[0]), .\a~1 (a[1]), .\a~2 (a[2]), .\a~3 (a[3]), .\a~4 (a[4]), .\a~5 (a[5]), 
        .\a~6 (a[6]), .\a~7 (a[7]), .\a~8 (a[8]), .\a~9 (a[9]), .\a~10 (a[10]), .\a~11 (a[11]), 
        .\a~12 (a[12]), .\a~13 (a[13]), .\a~14 (a[14]), .\a~15 (a[15]), 
        .\b~0 (b[0]), .\b~1 (b[1]), .\b~2 (b[2]), .\b~3 (b[3]), .\b~4 (b[4]), 
        .\b~5 (b[5]), .\b~6 (b[6]), .\b~7 (b[7]), .\b~8 (b[8]), .\b~9 (b[9]), 
        .\b~10 (b[10]), .\b~11 (b[11]), .\b~12 (b[12]), .\b~13 (b[13]), .\b~14 (b[14]), .\b~15 (b[15]), 
        .clk(clk), .rst(rst), 
        .cout(sum[16]), 
        .\sum~0 (sum[0]), .\sum~1 (sum[1]), .\sum~2 (sum[2]), .\sum~3 (sum[3]), .\sum~4 (sum[4]), 
        .\sum~5 (sum[5]), .\sum~6 (sum[6]), .\sum~7 (sum[7]), .\sum~8 (sum[8]), .\sum~9 (sum[9]), 
        .\sum~10 (sum[10]), .\sum~11 (sum[11]), .\sum~12 (sum[12]), .\sum~13 (sum[13]), 
        .\sum~14 (sum[14]), .\sum~15 (sum[15])
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

