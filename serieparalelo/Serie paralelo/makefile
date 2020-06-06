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
	rm -f mux4x1_struct_syn.v
	rm -f mux4x1_struct.v

run:
	echo Simulando valores...
	gtkwave muxy.vcd
	echo listo!
sed:
	sed -e ' s/serieparalelo/serieparalelo_struct/' ./serieparalelo_struct_syn.v >> serieparalelo_struct.v
	rm -f serieparalelo_struct_syn.v
autosyn: 
	yosys ./Autosyn.ys
