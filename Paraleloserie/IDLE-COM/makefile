all: clean  autosyn sed ejecutable tabla
	echo Simulando valores...
	gtkwave ptos_IDLE.vcd
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
	rm -f paralelltoserial_IDLE_syn.v
	rm -f paralelltoserial_IDLE_struct.v

run:
	echo Simulando valores...
	gtkwave ptos_IDLE.vcd
	echo listo!
sed:
	sed -e ' s/paralelo_a_serial_IDLE/paralelo_a_serial_IDLE_struct/' ./paralelltoserial_IDLE_syn.v >> paralelltoserial_IDLE_struct.v
	rm -f paralleltoserial_IDLE_syn.v
autosyn: 
	yosys ./Autosyn.ys
