import networkx as nx
import matplotlib.pyplot as plt

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
            # .latch <entrada> <salida> <tipo_control> <control> <estado_inicial>
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
            # Añadir nodos y aristas para los subcircuitos
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

def draw_graph(graph):
    pos = nx.spring_layout(graph)
    colors = {
        'input': 'skyblue',
        'output': 'lightgreen',
        'LUT': 'orange',
        'FF': 'pink',
        'subckt': 'purple',
        'undefined': 'white'  # Color para nodos sin tipo definido
    }
    node_colors = [colors[data['type']] for _, data in graph.nodes(data=True)]

    nx.draw(graph, pos, with_labels=True, node_color=node_colors, node_size=2000, font_size=10)
    plt.savefig('grafo_blif.png')
    plt.close()  
    #plt.show()

# Reemplaza 'archivo.blif' con la ruta de tu archivo
graph = parse_blif('/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/sumador_16bits.pre-vpr.blif')
draw_graph(graph)
