# Crear y seleccionar la librería de trabajo
vlib work
vmap work work

# Compilar los archivos Verilog o VHDL (modifica los nombres según tu proyecto)
vlog rca_tb.v
vlog ripple_carry_adder_8bit_post_synthesis.v 
vlog primitives.v 

# Cargar el testbench en el simulador
vsim -voptargs="+acc" work.ripple_carry_adder_8bit_tb

# Habilitar la generación de señales para el archivo VCD
log -r /*
add wave /tb_sumador_sincrono_16bits/*

# Configurar la salida del archivo VCD
vcd file simulation_output_new.vcd
vcd add /*

# Ejecutar la simulación durante un tiempo específico (modifica según sea necesario)
run 1ns -all

