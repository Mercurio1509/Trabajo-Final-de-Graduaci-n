import argparse

#def read_values(filename):
#    with open(filename, 'r') as f:
#        return [int(line.strip(), 0) for line in f if line.strip()]  # Asegúrate de que la línea no esté vacía
    
def read_values(filename):
    """Lee los valores de un archivo y los convierte de hexadecimal a decimal."""
    with open(filename, 'r') as f:
        return [int(line.strip(), 16) for line in f if line.strip()] 

def calculate_med(exact_values, approx_values):
    # Filtrar valores que no son cero
    filtered_exact = [val for val in exact_values if val != 0]
    filtered_approx = [approx_values[i] for i in range(len(approx_values)) if exact_values[i] != 0]

    # Comprobar si hay valores suficientes para calcular el MED
    if not filtered_exact:
        print("No hay valores válidos para calcular el MED.")
        return None

    errors = [abs(exact - approx) for exact, approx in zip(filtered_exact, filtered_approx)]
    med = sum(errors) / len(errors)  # Promedio del error
    return med

def calculate_med_percentage(exact_values, approx_values):
    # Filtrar valores que no son cero
    filtered_exact = [val for val in exact_values if val != 0]
    filtered_approx = [approx_values[i] for i in range(len(approx_values)) if exact_values[i] != 0]

    # Comprobar si hay valores suficientes para calcular el porcentaje
    if not filtered_exact:
        print("No hay valores válidos para calcular el porcentaje del MED.")
        return None

    errors = []
    for exact, approx in zip(filtered_exact, filtered_approx):
        error = abs(exact - approx) / abs(exact) if exact != 0 else float('inf')
        errors.append(error)

    med_percentage = (sum(errors) / len(errors)) * 100  # Medición del porcentaje de error
    return med_percentage

def main():
    parser = argparse.ArgumentParser(description="Calculate the Mean Error Distance (MED) and its percentage.")
    parser.add_argument('exact_output_file', type=str, help='File containing the exact values.')
    parser.add_argument('approx_output_file', type=str, help='File containing the approximate values.')

    args = parser.parse_args()

    exact_values = read_values(args.exact_output_file)
    approx_values = read_values(args.approx_output_file)

    med = calculate_med(exact_values, approx_values)
    med_percentage = calculate_med_percentage(exact_values, approx_values)

    if med is not None:
        print(f"Mean Error Distance: {med}")
    if med_percentage is not None:
        print(f"Percentage of Mean Error Distance: {med_percentage}%")

if __name__ == "__main__":
    main()
