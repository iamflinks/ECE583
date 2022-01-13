vlib work
vlog FullAdder.v FullAdder_tb.v

vsim FullAdder_tb
vsim -t ns FullAdder_tb

add wave A B Cin Sum Cout  
run 800ns