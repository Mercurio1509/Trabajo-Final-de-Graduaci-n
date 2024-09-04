def eliminar_bits_menos_significativos(archivo_blif, archivo_salida):
    with open(archivo_blif, 'r') as file:
        lineas = file.readlines()
    
    # Almacenar las líneas modificadas
    lineas_modificadas = []
    eliminar_latches = {'SUM~0', 'SUM~1'}  # Bits menos significativos a eliminar
    
    for linea in lineas:
        # Modificar la línea de salidas para eliminar SUM~0 y SUM~1
        if linea.startswith('.outputs'):
            partes = linea.split()
            # Filtrar las salidas a eliminar
            nuevas_salidas = [salida for salida in partes[1:] if salida not in eliminar_latches]
            linea_modificada = '.outputs ' + ' '.join(nuevas_salidas) + '\n'
            lineas_modificadas.append(linea_modificada)
        
        # Filtrar las líneas de latches relacionadas con SUM~0 y SUM~1
        elif linea.startswith('.latch'):
            if not any(salida in linea for salida in eliminar_latches):
                lineas_modificadas.append(linea)
        
        # Añadir las otras líneas sin modificación
        else:
            lineas_modificadas.append(linea)
    
    # Guardar las líneas modificadas en un nuevo archivo
    with open(archivo_salida, 'w') as file:
        file.writelines(lineas_modificadas)

# Uso del script
archivo_entrada = '/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/sumador_16bits.pre-vpr.blif'  # Nombre del archivo de entrada
archivo_salida = '/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/eliminado.blif'  # Nombre del archivo de salida
eliminar_bits_menos_significativos(archivo_entrada, archivo_salida)
