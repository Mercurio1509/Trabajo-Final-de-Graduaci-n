import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

def parse_blif(file_path):
    graph = nx.DiGraph()  # Grafo dirigido para representar dependencias
    
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    for line in lines:
        tokens = line.strip().split()
        if not tokens:
            continue

        # Parsear entradas y salidas
        if tokens[0] == '.inputs':
            inputs = tokens[1:]
            graph.add_nodes_from(inputs, type='input')
        elif tokens[0] == '.outputs':
            outputs = tokens[1:]
            graph.add_nodes_from(outputs, type='output')

        # Parsear flip-flops
        elif tokens[0] == '.latch':
            if len(tokens) >= 3:  # Verifica que haya suficientes tokens
                input_node = tokens[1]
                output_node = tokens[2]
                graph.add_node(output_node, type='FF')
                graph.add_edge(input_node, output_node)

        # Parsear LUTs (tablas de verdad)
        elif tokens[0] == '.names':
            output_node = tokens[-1]
            graph.add_node(output_node, type='LUT')
            for input_node in tokens[1:-1]:
                graph.add_edge(input_node, output_node)

        # Parsear subcircuitos
        elif tokens[0] == '.subckt':
            subckt_name = tokens[1]
            subckt_inputs = {param.split('=')[0]: param.split('=')[1] for param in tokens[2:]}
            for input_signal, output_signal in subckt_inputs.items():
                graph.add_edge(output_signal, subckt_name)
                graph.add_node(subckt_name, type='subckt')

    # Asegurarse de que todos los nodos tengan un tipo asignado
    for node in graph.nodes():
        if 'type' not in graph.nodes[node]:
            graph.nodes[node]['type'] = 'undefined'  # Asignar un tipo por defecto

    return graph

def hierarchical_layout(graph, spacing=5):
    pos = {}
    levels = {'input': 0, 'LUT': 1, 'FF': 2, 'output': 3}  # Definir niveles para el layout
    
    # Crear un mapa de niveles para cada nodo
    level_positions = {}
    for node, data in graph.nodes(data=True):
        node_type = data.get('type', 'undefined')
        level = levels.get(node_type, 4)  # Nivel por defecto para nodos indefinidos
        if level not in level_positions:
            level_positions[level] = []
        level_positions[level].append(node)
    
    # Asignar posiciones a los nodos en cada nivel con separación ajustable
    for level, nodes in level_positions.items():
        num_nodes = len(nodes)
        if num_nodes > 1:
            # Ajusta el rango de espaciado para cubrir una distancia más amplia horizontalmente
            x_positions = np.linspace(-spacing * (num_nodes - 1), spacing * (num_nodes - 1), num_nodes)
        else:
            x_positions = [0]
        
        for x_pos, node in zip(x_positions, nodes):
            pos[node] = (x_pos, -level)
    
    return pos

def draw_graph(graph):
    pos = hierarchical_layout(graph, spacing=2000)  # Ajustar 'spacing' según sea necesario
    
    colors = {
        'input': 'skyblue',
        'output': 'lightgreen',
        'LUT': 'orange',
        'FF': 'pink',
        'subckt': 'purple',
        'undefined': 'white'  # Color para nodos sin tipo definido
    }
    node_colors = [colors[data['type']] for _, data in graph.nodes(data=True)]

    plt.figure(figsize=(18, 12))  # Aumentar el tamaño de la figura para acomodar más nodos horizontalmente
    nx.draw(graph, pos, with_labels=True, node_color=node_colors, node_size=2000, font_size=10, edge_color='grey', alpha=0.7)
    plt.title('Diagrama BLIF')
    
    # Guardar el gráfico como archivo de imagen usando plt.savefig
    plt.savefig('grafo_blif.png', format='png')
    plt.close()  # Cerrar la figura después de guardar

# Reemplaza 'archivo.blif' con la ruta de tu archivo
graph = parse_blif('/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/sumador_16bits.pre-vpr.blif')
draw_graph(graph)
