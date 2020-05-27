#Verilog

# Making verilog makefile
# Makefile to simulate Verilog HDL designs under OSX.
###
######## belindabrownr@gmail.com
###


# 							Makefile logic:
# To create this file you need these files:
# $ @ replace left
# $ ^ right

all:

#				For 				mux 2:1 2 bits	....	 	# =	0
#				For 				mux 2:1 4 bits 	....		# =	1
#				For 				mux 4:1 4 bits 	....		# = 2


#******************************************************************************
#										TARGETS
#******************************************************************************
### 						YOSYS 		use $make	y#
# To generate the structural design of the
# behavioral design automatically through synthesis
#It is defined as a roughly RTL (Register Transfer Level)
#synthesizer that allows you to convert the HDL (Hardware
# Description Language) code into an electronic scheme.
# Coming to show the components connected to each other what
# is usually called RTL network list which is associated with
# the level of registry transfer. Considering that what it allows
# is to model a synchronous digital circuit in terms of digital signal
# flow (this being data) relating it to the hardware registers and the
# logical operations that are carried out in each signal.


### 						SED				use $make	r#
# Replaces on the synthesized file the name module,
# because for making the stuctural decription we use the
# behavioral on yosys

#### 					 IVERILOG 		use $make v#
# It is defined as an HDL (Hardware Description Language),
#  this being a modeled hardware language, that is, it allows
#  describing a simulation of digital circuits. It can be seen
# as the tool that allows to provide the specifications to carry
# out a physical component which is being modeled.
# 	Example of command:
# iverilog -o ./vvp/TestBench_21_2.vvp ./TestBenchAUTONST/TestBench_21_2.v
# Its automatic, because each time you are asked for a vvp
# you need one with con.v

### 					GTKWAVE   		use $make gtkwave#
# We can define it as a visualization of simulation results
# where one of its advantages is that by means of a visualization
# of signal waves we can understand the problem when it is found by using the testbench.

#******************************************************************************
# Modify this part with your own folders paths.

DIAGRAMS_GENERATED = ./diagrams_generated/

LIB = ./lib/

LOG_TXT = ./log_txt/

SRC = ./src/
_M212 = mux21_2b.v
_M214 = mux21_4b.v
_M414 = mux41_4b.v

SYN = ./syn/
_SM212 = mux21_2b_syn.v
_SM214 = mux21_4b_syn.v
_SM414 = mux41_4b_syn.v

TESTBENCHES = ./testbenches/
_TBM212 = tb_mux21_2b.v
_TBM214 = tb_mux21_4b.v
_TBM414 = tb_mux41_4b.v

TESTERS = ./testers/
_TM212 = t_mux21_2b.v
_TM214 = t_mux21_4b.v
_TM414 = t_mux41_4b.v

_VCDM212 = mux21_2b.vcd
_VCDM214 = mux21_4b.vcd
_VCDM414 = mux41_4b.vcd

OVVP = ./vvp/
_VVPM212 = mux21_2b.vvp
_VVPM214 = mux21_4b.vvp
_VVPM414 = mux41_4b.vvp

YOSYS = ./yosys/
_YM212 = mux21_2b_y.ys
_YM214 = mux21_4b_y.ys
_YM414 = mux41_4b_y.ys
#******************************************************************************

# # IVERILOG
# %.vvp: %.v
# 	iverilog -o $@ $^

#******************************************************************************
#### 						MUX 2:1 2 BITS
#******************************************************************************

y0:
	yosys $(YOSYS)$(_YM212)

r0:
	sed -i 's/mux21_2b/mux21_2b_syn/g' $(SYN)$(_SM212)

v0:
	iverilog -o $(OVVP)$(_VVPM212) $(TESTBENCHES)$(_TBM212)
	vvp $(OVVP)$(_VVPM212) > $(LOG_TXT)$(_VVPM212)_log.txt

#target phony
.PHONY: gtkwave0
gtkwave0:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCDM212)


#******************************************************************************
#### 						MUX 2:1 4 BITS
#******************************************************************************

y1:
	yosys $(YOSYS)$(_YM214)

r1:
	sed -i 's/mux21_2b/mux21_2b_syn/g; s/mux21_4b/mux21_4b_syn/g' $(SYN)$(_SM214)

v1:
	iverilog -o $(OVVP)$(_VVPM214) $(TESTBENCHES)$(_TBM214)
	vvp $(OVVP)$(_VVPM214) > $(LOG_TXT)$(_VVPM214)_log.txt

#target phony
.PHONY: gtkwave1
gtkwave1:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCDM214)




#******************************************************************************
#### 						MUX 4:1 4 BITS
#******************************************************************************

y2:
	yosys $(YOSYS)$(_YM414)

r2:
	sed -i 's/mux21_2b/mux21_2b_syn/g; s/mux21_4b/mux21_4b_syn/g; s/mux41_4b/mux41_4b_syn/g' $(SYN)$(_SM414)

v2:
	iverilog -o $(OVVP)$(_VVPM414) $(TESTBENCHES)$(_TBM414)
	vvp $(OVVP)$(_VVPM414) > $(LOG_TXT)$(_VVPM414)_log.txt

#target phony
.PHONY: gtkwave2
gtkwave2:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCDM414)






#******************************************************************************
############ CLEAN FOR ALL
#******************************************************************************


.PHONY: clean
clean:
	rm -rf $(OVVP)*.vvp *.vcd $(LOG_TXT)*_log.txt $(SYN)*syn.v $(DIAGRAMS_GENERATED)*.dot $(DIAGRAMS_GENERATED)*.ps
