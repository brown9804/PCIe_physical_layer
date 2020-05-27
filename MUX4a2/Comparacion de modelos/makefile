all: clean  autosyn sed ejecutable tabla
	echo Simulando valores...
	gtkwave muxy.vcd
	echo listo!

ejecutable:
	echo generando ejecutable...
	iverilog tb.v -o exe.o
	echo listo!
tabla:
	echo Creando tabla de datas...
	vvp exe.o
	echo listo!
clean:
	rm -f *.o
	rm -f *.vcd
	rm -f mux4x2_struct_syn.v
	rm -f mux4x2_struct.v

run:
	echo Simulando valores...
	gtkwave muxy.vcd
	echo listo!
sed:
	sed -e 's/mux4x2_behav/mux4x2_struct/; s/mux2x1_behav/mux2x1_struct/ ' ./mux4x2_struct_syn.v >> mux4x2_struct.v
	sed -i '2i `include "cmos_cells.v" ' mux4x2_struct.v
	rm -f mux2x1_struct.v
autosyn: 
	yosys ./Autosyn.ys
