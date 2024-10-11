import re
import sys
def procesar_archivos(archivo_latches, archivo_datos):
    # Leer los nombres de los latches del primer archivo
    latches = []
    with open(archivo_latches, 'r') as archivo:
        for linea in archivo:
            # Buscar patrón .latch seguido por el nombre
            match = re.search(r'\.latch\s+(\S+)', linea)
            if match:
                latch_name = match.group(1)
                latches.append(latch_name)

    # Leer y modificar el segundo archivo
    with open(archivo_datos, 'r') as archivo:
        lineas = archivo.readlines()

    # Reescribimos el segundo archivo con las líneas modificadas
    if len(latches) != 0:
        with open(archivo_datos, 'w') as archivo:
            contador = 0
            print(latches)
            for linea in lineas:
                # Separar la línea por espacios para verificar si el primer elemento coincide con un latch
                partes = linea.split()
                nombre = partes[0]  # El primer elemento es el nombre
                patron1 = r'n\d+_1'
                patron2 = r'n\d'
                if re.match(patron1, nombre) or re.match(patron2, nombre):
                    print("Estaba", partes[0],"ahora", latches[contador])
                    # Sustituir la línea con un texto personalizado (aquí puedes definir el formato que desees)
                    archivo.write(f"{latches[contador]} {partes[1]} {partes[2]}\n")
                    contador = contador + 1
                else:
                    archivo.write(linea)
    with open(archivo_datos, 'r') as archivo:
        lineas = archivo.readlines()

    with open(archivo_datos, 'w') as archivo:
        for linea in lineas:
            partes = linea.split()
            nombre = partes[0]  # El primer elemento es el nombre
            patron1 = r'new_new_n\d+_1'
            patron2 = r'new_new_n\d'
            if re.match(patron1, nombre) or re.match(patron2, nombre):
                nuevo_nombre = re.sub(r'new_new_', 'new_', nombre)
                # Reescribir la línea con el nombre modificado y los valores originales
                archivo.write(f"{nuevo_nombre} {partes[1]} {partes[2]}\n")
                #print(f"{nuevo_nombre} {partes[1]} {partes[2]}")
            else:
                archivo.write(linea)
# Ejemplo de uso:
#archivo_latches = 'WT_8b.pre-vpr.blif'      # Archivo con los .latch
#archivo_datos = 'WT_8b.pre-vpr.act' # Archivo que se va a modificar
#archivo_blif = 'circuit_unmapped_full_modiff.pre-vpr.blif'      # Archivo con los .latch
#archivo_act = 'circuit_unmapped_full_modiff.pre-vpr.act' # Archivo que se va a modificar
#procesar_archivos(archivo_blif, archivo_act)

# Ejemplo de uso
#nombre_archivo = 'WT_8b.pre-vpr.blif'  # Cambiar por el nombre de tu archivo
#nombre_archivo = 'circuit_unmapped_full_modiff.pre-vpr.blif'
if __name__ == "__main__":
    # Verificar que se pasaron los argumentos correctos
    if len(sys.argv) != 3:
        print("Uso: corregidor.py primer_archivo.blif segundo_archivo.act")
        sys.exit(1)

    # Leer los archivos desde los argumentos de la línea de comandos
    archivo_blif = sys.argv[1]
    archivo_act = sys.argv[2]

    # Ejecutar la función con los archivos proporcionados
    procesar_archivos(archivo_blif, archivo_act)
