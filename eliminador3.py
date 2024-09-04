def eliminar_bits_menos_significativos(archivo_blif, archivo_salida):
    with open(archivo_blif, 'r') as file:
        lineas = file.readlines()
    
    lineas_modificadas = []
    eliminar_latches = {'SUM~0', 'SUM~1'}  # Bits menos significativos a eliminar
    dentro_de_latches = False
    dentro_de_names = False
    contador_latches = 0
    contador_names = 0
    primer_linea_names_eliminada = False

    for linea in lineas:
        if linea.startswith('.outputs'):
            partes = linea.split()
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
            if not linea.startswith('.latch'):
                lineas_modificadas.append(linea)
            else:
                dentro_de_latches = False
                contador_latches = 0
                lineas_modificadas.append(linea)

        elif linea.startswith('.names'):
            dentro_de_names = True
            contador_names += 1
            
            # Solo añadir la línea de .latch si no es la segunda o tercera del bloque
            if contador_names not in [1, 2]:
                lineas_modificadas.append(linea)
        elif dentro_de_names:
            if not linea.startswith('.names'):
                lineas_modificadas.append(linea)
            else:
                dentro_de_names = False
                contador_names = 0
                lineas_modificadas.append(linea)
        
        else:
            lineas_modificadas.append(linea)
    
    # Guardar las líneas modificadas en un nuevo archivo
    with open(archivo_salida, 'w') as file:
        file.writelines(lineas_modificadas)

# Uso del script
archivo_entrada = '/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/sumador_16bits.pre-vpr.blif'
archivo_salida = '/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/eliminando3.blif'
eliminar_bits_menos_significativos(archivo_entrada, archivo_salida)
