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

#******************************************************************************
#										TARGETS
#******************************************************************************
### 						YOSYS 		use $make	y
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


### 						SED				use $make	r
# Replaces on the synthesized file the name module,
# because for making the stuctural decription we use the
# behavioral on yosys

#### 					 IVERILOG 		use $make v
# It is defined as an HDL (Hardware Description Language),
#  this being a modeled hardware language, that is, it allows
#  describing a simulation of digital circuits. It can be seen
# as the tool that allows to provide the specifications to carry
# out a physical component which is being modeled.
# 	Example of command:
# iverilog -o ./vvp/TestBench_21_2.vvp ./TestBenchAUTONST/TestBench_21_2.v
# Its automatic, because each time you are asked for a vvp
# you need one with con.v

### 					GTKWAVE   		use $make gtkwave
# We can define it as a visualization of simulation results
# where one of its advantages is that by means of a visualization
# of signal waves we can understand the problem when it is found by using the testbench.

#******************************************************************************
# Modify this part with your own folders paths.

DIAGRAMS_GENERATED = ./diagrams_generated/

LIB = ./lib/

LOG_TXT = ./log_txt/

SRC = ./src/
_PHY_RX = phy_rx.v


SYN = ./syn/
_SPHY_RX = phy_rx_syn.v


TESTBENCHES = ./testbenches/
_TB_PHY_RX = tb_phy_rx.v


TESTERS = ./testers/
_T_PHY_RX = t_phy_rx.v


_VCD_PHY_RX = phy_rx.vcd

OVVP = ./vvp/
_VVP_PHY_RX = phy_rx.vvp


YOSYS = ./yosys/
_Y_PHY_RX = phy_rx_y.ys

#******************************************************************************

# # IVERILOG
# %.vvp: %.v
# 	iverilog -o $@ $^

#******************************************************************************
#### 					PHY TX
#******************************************************************************

y:
	yosys $(YOSYS)$(_Y_PHY_RX)

r:
	sed -i 's/ff2in2o/ff2in2o_syn/g; s/ff4in4o/ff4in4o_syn/g; s/ff4in4ovalid/ff4in4ovalid_syn/g ' $(SYN)$(_SPHY_RX)
	sed -i 's/demux1x2_behav/demux1x2_behav_syn/g; s/demux1x4_behav/demux1x4_behav_syn/g; s/demux2x4_behav/demux2x4_behav_syn/g' $(SYN)$(_SPHY_RX)
	sed -i 's/paralelo_a_serial_IDLE/paralelo_a_serial_IDLE_syn/g; s/serieparalelo/serieparalelo_syn/g; s/phy_rx/phy_rx_syn/g' $(SYN)$(_SPHY_RX)

v:
	iverilog -o $(OVVP)$(_VVP_PHY_RX) $(TESTBENCHES)$(_TB_PHY_RX)
	vvp $(OVVP)$(_VVP_PHY_RX) > $(LOG_TXT)$(_VVP_PHY_RX)_log.txt

#target phony
.PHONY: gtkwave
gtkwave:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_PHY_RX)


#******************************************************************************
############ CLEAN FOR ALL
#******************************************************************************


.PHONY: clean
clean:
	rm -rf $(OVVP)*.vvp *.vcd $(LOG_TXT)*_log.txt $(SYN)*syn.v $(DIAGRAMS_GENERATED)*.dot $(DIAGRAMS_GENERATED)*.ps
