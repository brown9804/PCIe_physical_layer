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
	rm -f *.out
	rm -f *.vcd
	rm -f demux1x4_struct_syn.v
	rm -f demux1x4_struct.v

run:
	echo Simulando valores...
	gtkwave muxy.vcd
	echo listo!
sed:
	sed -e 's/demux1x4_behav/demux1x4_struct/; s/demux2x4_behav/demux2x4_struct/; s/demux1x2_behav/demux1x2_struct/; s/ff1in1o/ff1in1o_struct/; s/ff2in2o/ff2in2o_struct/; s/ff4in4o/ff4in4o_struct/; s/ff4in4ovalid/ff4in4ovalid_struct/ ' ./demux1x4_struct_syn.v >> demux1x4_struct.v
	sed -i '2i `include "cmos_cells.v" ' demux1x4_struct.v

autosyn: 
	yosys ./Autosyn.ys
