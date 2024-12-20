yosys -import



plugin -i parmys

yosys -import



read_verilog -nomem2reg +/parmys/vtr_primitives.v

setattr -mod -set keep_hierarchy 1 single_port_ram

setattr -mod -set keep_hierarchy 1 dual_port_ram



puts "Using parmys as partial mapper"



# arch file: /home/moises-leiva/vtr_work/CLA_16b/temp/EArch.xml

# input files: [CLA_16b.v]

# other args: [YYY]

# config file: /home/moises-leiva/vtr_work/CLA_16b/temp/odin_config.xml

# output file: CLA_16b.parmys.blif



parmys_arch -a /home/moises-leiva/vtr_work/CLA_16b/temp/EArch.xml



if {$env(PARSER) == "surelog" } {

	puts "Using Yosys read_uhdm command"

	plugin -i systemverilog

	yosys -import

	read_uhdm CLA_16b.v

} elseif {$env(PARSER) == "system-verilog" } {

	puts "Using Yosys read_systemverilog command"

	plugin -i systemverilog

	yosys -import

	read_systemverilog CLA_16b.v

} elseif {$env(PARSER) == "default" } {

	puts "Using Yosys read_verilog command"

	read_verilog -sv -nolatches CLA_16b.v

} else {

	error "Invalid PARSER"

}



# Check that there are no combinational loops

scc -select

select -assert-none %

select -clear



hierarchy -check -auto-top -purge_lib



opt_expr

opt_clean

check

opt -nodffe -nosdff

procs -norom

fsm

opt

wreduce

peepopt

opt_clean

share



opt -full

memory -nomap

flatten



opt -full



techmap -map +/parmys/adff2dff.v

techmap -map +/parmys/adffe2dff.v

techmap -map +/parmys/aldff2dff.v

techmap -map +/parmys/aldffe2dff.v



opt -full



parmys -a /home/moises-leiva/vtr_work/CLA_16b/temp/EArch.xml -nopass -c /home/moises-leiva/vtr_work/CLA_16b/temp/odin_config.xml YYY



opt -full



techmap 

opt -fast



dffunmap

opt -fast -noff



#autoname



stat



hierarchy -check -auto-top -purge_lib



write_blif -true + vcc -false + gnd -undef + unconn -blackbox CLA_16b.parmys.blif

