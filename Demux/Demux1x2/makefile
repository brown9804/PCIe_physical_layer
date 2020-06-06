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
	rm -f demux1x2_struct_syn.v
	rm -f demux1x2_struct.v

run:
	echo Simulando valores...
	gtkwave muxy.vcd
	echo listo!
sed:
	sed -e ' s/demux1x2_behav/demux1x2_struct/' ./demux1x2_struct_syn.v >> demux1x2_struct.v
	rm -f demux1x2_struct_syn.v
autosyn: 
	yosys ./Autosyn.ys
