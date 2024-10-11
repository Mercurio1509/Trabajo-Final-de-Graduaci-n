import random

def generate_random_numbers(file_name, count):
    with open(file_name, 'w') as file:
        for _ in range(count):
            # Genera un número aleatorio de 16 bits
            num = random.randint(0, 0xFFFF)  # 16 bits: de 0 a 65535
            # Escribe el número en formato hexadecimal
            file.write(f"{num:04X}\n")

# Configuraciones
count = 1000000  # Cantidad de números a generar

# Generar archivos
generate_random_numbers('memA.txt', count)
generate_random_numbers('memB.txt', count)

print("Archivos generados con éxito: memA.txt y memB.txt.")
