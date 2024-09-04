def eliminar_bits_menos_significativos(archivo_blif, archivo_salida):
    with open(archivo_blif, 'r') as file:
        lineas = file.readlines()
    
    lineas_modificadas = []
    dentro_de_latches = False
    contador_latches = 0
    eliminar_latches = {'SUM~0', 'SUM~1'}  # Bits menos significativos a eliminar

    for linea in lineas:
        # Detectar el inicio del bloque .latch
        if linea.startswith('.outputs'):
            partes = linea.split()
            # Filtrar las salidas a eliminar
            nuevas_salidas = [salida for salida in partes[1:] if salida not in eliminar_latches]
            linea_modificada = '.outputs ' + ' '.join(nuevas_salidas) + '\n'
            lineas_modificadas.append(linea_modificada)

        elif linea.startswith('.latch'):
            dentro_de_latches = True
            contador_latches += 1
            
            # Solo añadir la línea de .latch si no es la segunda o tercera del bloque
            if contador_latches not in [2, 3]:
                lineas_modificadas.append(linea)
        elif dentro_de_latches:
            # Continuar añadiendo líneas al archivo después del bloque de .latch
            if not linea.startswith('.latch'):
                lineas_modificadas.append(linea)
            else:
                contador_latches = 1  # Reiniciar el contador para el siguiente bloque
                lineas_modificadas.append(linea)
        else:
            lineas_modificadas.append(linea)
    
    # Guardar las líneas modificadas en un nuevo archivo
    with open(archivo_salida, 'w') as file:
        file.writelines(lineas_modificadas)

# Uso del script
archivo_entrada = '/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/sumador_16bits.pre-vpr.blif'  # Nombre del archivo de entrada
archivo_salida = '/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/elimiando2.blif'  # Nombre del archivo de salida
eliminar_bits_menos_significativos(archivo_entrada, archivo_salida)
