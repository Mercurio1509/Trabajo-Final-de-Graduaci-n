import networkx as nx
import plotly.graph_objects as go

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
            graph.add_nodes_from(inputs, type='input', level=0)
        elif tokens[0] == '.outputs':
            outputs = tokens[1:]
            graph.add_nodes_from(outputs, type='output', level=-1)

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

    # Calcular niveles jerárquicos de los nodos
    for node in nx.topological_sort(graph):
        if 'level' not in graph.nodes[node]:
            predecessors = list(graph.predecessors(node))
            if predecessors:
                # Asignar nivel basado en el máximo nivel de sus predecesores más 1
                graph.nodes[node]['level'] = max(graph.nodes[p]['level'] for p in predecessors) + 1
            else:
                graph.nodes[node]['level'] = 0  # Nodo raíz, nivel 0

    return graph

def draw_graph_interactive(graph):
    # Calcular posiciones de nodos jerárquicas
    levels = {}
    for node, data in graph.nodes(data=True):
        level = data['level']
        if level not in levels:
            levels[level] = []
        levels[level].append(node)

    # Definir posiciones iniciales con espaciado horizontal
    pos = {}
    max_nodes_per_level = max(len(nodes) for nodes in levels.values())
    for level, nodes in levels.items():
        for i, node in enumerate(nodes):
            # Ajustar posición horizontal
            x = i - len(nodes) / 2
            # Ajustar espaciado vertical
            y = -level
            pos[node] = (x, y)

    edge_x = []
    edge_y = []

    # Crear coordenadas para aristas (edges)
    for edge in graph.edges():
        x0, y0 = pos[edge[0]]
        x1, y1 = pos[edge[1]]
        edge_x.extend([x0, x1, None])
        edge_y.extend([y0, y1, None])

    edge_trace = go.Scatter(
        x=edge_x, y=edge_y,
        line=dict(width=1, color='#888'),
        hoverinfo='none',
        mode='lines')

    node_x = []
    node_y = []
    node_text = []
    node_color = []

    colors = {
        'input': 'skyblue',
        'output': 'lightgreen',
        'LUT': 'orange',
        'FF': 'pink',
        'subckt': 'purple',
        'undefined': 'white'  # Color para nodos sin tipo definido
    }

    # Crear coordenadas para nodos
    for node in graph.nodes():
        x, y = pos[node]
        node_x.append(x)
        node_y.append(y)
        node_text.append(f"{node} ({graph.nodes[node].get('type', 'undefined')})")
        node_color.append(colors[graph.nodes[node].get('type', 'undefined')])

    node_trace = go.Scatter(
        x=node_x, y=node_y,
        mode='markers+text',
        text=node_text,
        marker=dict(
            size=10,
            color=node_color,
            line_width=2),
        hoverinfo='text')

    fig = go.Figure(data=[edge_trace, node_trace],
                    layout=go.Layout(
                        title='Diagrama Interactivo de BLIF con Jerarquías',
                        title_x=0.5,
                        showlegend=False,
                        hovermode='closest',
                        margin=dict(b=20, l=5, r=5, t=40),
                        xaxis=dict(showgrid=False, zeroline=False),
                        yaxis=dict(showgrid=False, zeroline=False))
                    )

    fig.show()

# Reemplaza 'archivo.blif' con la ruta de tu archivo
graph = parse_blif('/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/sumador_16bits.pre-vpr.blif')
draw_graph_interactive(graph)
