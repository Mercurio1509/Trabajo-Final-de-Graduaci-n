import re

# Función para extraer los números de las 13 líneas debajo de "Pb types usage..." y el valor decimal de "Total "
def extract_numbers_and_total(input_file1, input_file2, output_file):
    # Palabra clave para buscar la línea "Pb types usage..."
    keyword1 = "Pb types usage..."
    # Palabra clave para buscar la línea que empieza con "Total "
    keyword2 = "Total "
    
    # Patrón de búsqueda para el número que sigue a ":"
    pattern1 = re.compile(r':\s*(\d+)')
    # Patrón de búsqueda para números decimales o enteros que siguen a "Total "
    pattern2 = re.compile(r'Total\s+([\d.]+)')

    # Almacenar los números extraídos del primer archivo
    numbers = []

    # Leer el primer archivo de entrada (archivo 1)
    with open(input_file1, 'r') as file1:
        lines = file1.readlines()

    # Encontrar la línea que contiene "Pb types usage..." y procesar las 13 siguientes
    for i, line in enumerate(lines):
        if keyword1 in line:
            # Extraer las 13 líneas siguientes
            for j in range(i + 1, i + 14):
                match = pattern1.search(lines[j])
                if match:
                    numbers.append(match.group(1))
            break

    # Leer el segundo archivo de entrada (archivo 2) para buscar "Total "
    total_value = None
    with open(input_file2, 'r') as file2:
        for line in file2:
            match = pattern2.search(line)
            if match:
                total_value = match.group(1)  # Esto capturará decimales también
                break

    # Escribir la primera línea y los números extraídos en el archivo de salida
    with open(output_file, 'w') as file:
        # Escribir "Area | Potencia" en la primera línea
        file.write("              Area                | Potencia (W)\n")
        # Escribir los números extraídos en la segunda línea
        file.write(' '.join(numbers))
        # Añadir un pipe y el valor total del segundo archivo si fue encontrado
        if total_value:
            file.write(f' | {total_value}')

# Llamar a la función con los nombres de archivos de entrada y salida
input_file1 = 'vpr_stdout.log'  # Primer archivo de entrada
input_file2 = 'RCA_8b.pre-vpr.power'  # Segundo archivo de entrada (que contiene "Total ")
output_file = 'archivo_salida.txt'    # Archivo de salida
extract_numbers_and_total(input_file1, input_file2, output_file)
