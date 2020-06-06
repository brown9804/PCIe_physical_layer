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


#******************************************************************************
#													MARKS
#******************************************************************************
# 1. For mux 2:1 ---------- mux21
# 2. For mux 4:1 ---------- mux41
# 3. For mux 4:2 ---------- mux42
# 4. For parallel to serial -------- ptos
# 5. For parallel to serial IDLE -------- ptosdile
# 6. For demux 1:2 -------- demux12
# 7. For demux 1:4 -------- demux14
# 8. For demux 2:4 -------- demux24
# 9. For serial to parallel ----- stop
# 10. For serial to parallel IDLE ----- stopidle
# 11. For recirculation idle -------- reciridle
# 12. For TX -------- tx
# 13. For RX -------- rx
# 14. For Phy - Physical PCIe --------- phy

all:

#******************************************************************************
#										TARGETS
#******************************************************************************
### 						YOSYS 		use $make	y<mark>
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


### 						SED				use $make	r<mark>
# Replaces on the synthesized file the name module,
# because for making the stuctural decription we use the
# behavioral on yosys

#### 					 IVERILOG 		use $make v<mark>
# It is defined as an HDL (Hardware Description Language),
#  this being a modeled hardware language, that is, it allows
#  describing a simulation of digital circuits. It can be seen
# as the tool that allows to provide the specifications to carry
# out a physical component which is being modeled.
# 	Example of command:
# iverilog -o ./vvp/TestBench_21_2.vvp ./TestBenchAUTONST/TestBench_21_2.v
# Its automatic, because each time you are asked for a vvp
# you need one with con.v

### 					GTKWAVE   		use $make gtkwave<mark>
# We can define it as a visualization of simulation results
# where one of its advantages is that by means of a visualization
# of signal waves we can understand the problem when it
# is found by using the testbench.

#******************************************************************************
# Modify this part with your own folders paths.

DIAGRAMS_GENERATED = ./diagrams_generated/

LIB = ./lib/

LOG_TXT = ./log_txt/

SRC = ./src/
_MUX21 = mux2x1_behav.v
_MUX41 = mux4x1_behav.v
_MUX42 = mux4x2_behav.v
_PTOS = paralelltoserial.v
_PTOSIDLE = paralelltoserial_IDLE.v
_STOP = serieparalelo.v
_STOPIDLE = serie_paralelo_idle.v
_DEMUX12 = demux1x2_behav.v
_DEMUX14 = demux1x4_behav.v
_DEMUX24 = demux2x4_behav.v
_RECIRIDLE = recir_idle.v
_PHY_TX = phy_tx.v
_PHY_RX = phy_rx.v
_PHY = phy.v


SYN = ./syn/
_SMUX21 = mux2x1_syn.v
_SMUX41 = mux4x1_syn.v
_SMUX42 = mux4x2_syn.v
_SPTOS = paralelltoserial_syn.v
_SPTOSIDLE = paralelltoserial_IDLE_syn.v
_SSTOP = serieparalelo_syn.v
_SSTOPIDLE = serie_paralelo_idle_syn.v
_SDEMUX12 = demux1x2_behav_syn.v
_SDEMUX14 = demux1x4_behav_syn.v
_SDEMUX24 = demux2x4_behav_syn.v
_SRECIRIDLE = recir_idle_syn.v
_SPHY_TX = phy_tx_syn.v
_SPHY_RX = phy_rx_syn.v
_SPHY = phy_syn.v


TESTBENCHES = ./testbenches/
_TB_MUX21 =  tb_mux21.v
_TB_MUX41 =  tb_mux41.v
_TB_MUX42 =  tb_mux42.v
_TB_PTOS = tb_ptos.v
_TB_PTOSIDLE = tb_ptos_IDLE.v
_TB_STOP = tb_stop.v
_TB_STOPIDLE = tb_stop_idle.v
_TB_DEMUX12 = tb_demux12.v
_TB_DEMUX14 = tb_demux14.v
_TB_DEMUX24 = tb_demux24.v
_TB_RECIRIDLE = tb_recir_idle.v
_TB_PHY_TX = tb_phy_tx.v
_TB_PHY_RX = tb_phy_rx.v
_TB_PHY = tb_phy.v


TESTERS = ./testers/
_T_MUX21 = t_mux21.v
_T_MUX41 = t_mux41.v
_T_MUX42 = t_mux42.v
_T_PTOS = t_ptos.v
_T_PTOSIDLE = t_ptos_idle.v
_T_STOP = t_stop.v
_T_STOPIDLE = t_stop_idle.v
_T_DEMUX12 = t_demux12.v
_T_DEMUX14 = t_demux14.v
_T_DEMUX24 = t_demux24.v
_T_RECIRIDLE = t_recir_idle.v
_T_PHY_TX = t_phy_tx.v
_T_PHY_RX = t_phy_rx.v
_T_PHY = t_phy.v





_VCD_MUX21 = mux21.vcd
_VCD_MUX41 = mux41.vcd
_VCD_MUX42 = mux42.vcd
_VCD_PTOS = ptos.vcd
_VCD_PTOSIDLE = ptos_idle.vcd
_VCD_STOP = stop.vcd
_VCD_STOPIDLE = stopidle.vcd
_VCD_DEMUX12 = demux12.vcd
_VCD_DEMUX14 = demux14.vcd
_VCD_DEMUX24 = demux24.vcd
_VCD_RECIRIDLE = recir_idle.vcd
_VCD_PHY_TX = phy_tx.vcd
_VCD_PHY_RX = phy_rx.vcd
_VCD_PHY = phy.vcd


OVVP = ./vvp/
_VVP_MUX21 = mux21.vvp
_VVP_MUX41 = mux41.vvp
_VVP_MUX42 = mux42.vvp
_VVP_PTOS = ptos.vvp
_VVP_PTOSIDLE = ptos_idle.vvp
_VVP_STOP = stop.vvp
_VVP_STOPIDLE = stopdile.vvp
_VVP_DEMUX12 = demux12.vvp
_VVP_DEMUX14 = demux14.vvp
_VVP_DEMUX24 = demux24.vvp
_VVP_RECIRIDLE = recir_idle.vvp
_VVP_PHY_TX = phy_tx.vvp
_VVP_PHY_RX = phy_rx.vvp
_VVP_PHY = phy.vvp


YOSYS = ./yosys/
_Y_MUX21 = mux21_y.ys
_Y_MUX41 = mux41_y.ys
_Y_MUX42 = mux42_y.ys
_Y_PTOS = ptos_y.ys
_Y_PTOSIDLE = ptos_idle_y.ys
_Y_STOP = stop_y.ys
_Y_STOPIDLE = stop_idle_y.ys
_Y_DEMUX12 = demux12_y.ys
_Y_DEMUX14 = demux14_y.ys
_Y_DEMUX24 = demux24_y.ys
_Y_RECIRIDLE = recir_idle_y.ys
_Y_PHY_TX = phy_tx_y.ys
_Y_PHY_RX = phy_rx_y.ys
_Y_PHY = phy_y.ys

#******************************************************************************

# # IVERILOG
# %.vvp: %.v
# 	iverilog -o $@ $^


#******************************************************************************
#### 														MUX 		2:1
#******************************************************************************

ymux21:
	yosys $(YOSYS)$(_Y_MUX21)

rmux21:
	sed -i ' s/mux2x1_behav/mux2x1_struct/' $(SYN)$(_SMUX21)

vmux21:
	iverilog -o $(OVVP)$(_VVP_MUX21) $(TESTBENCHES)$(_TB_MUX21)
	vvp $(OVVP)$(_VVP_MUX21) > $(LOG_TXT)$(_VVP_MUX21)_log.txt

#target phony
.PHONY: gtkwavemux21
gtkwavemux21:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_MUX21)



#******************************************************************************
#### 														MUX 		4:1
#******************************************************************************

ymux41:
	yosys $(YOSYS)$(_Y_MUX41)

rmux41:
	sed -i 's/mux4x1_behav/mux4x1_struct/; s/mux4x2_behav/mux4x2_struct/; s/mux2x1_behav/mux2x1_struct/; s/ff1in1o/ff1in1o_struct/; s/ff2in2o/ff2in2o_struct/; s/ff4in4o/ff4in4o_struct/; s/ff4in4ovalid/ff4in4ovalid_struct/' $(SYN)$(_SMUX41)

vmux41:
	iverilog -o $(OVVP)$(_VVP_MUX41) $(TESTBENCHES)$(_TB_MUX41)
	vvp $(OVVP)$(_VVP_MUX41) > $(LOG_TXT)$(_VVP_MUX41)_log.txt

#target phony
.PHONY: gtkwavemux41
gtkwavemux41:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_MUX41)





#******************************************************************************
#### 														MUX 		4:2
#******************************************************************************

ymux42:
	yosys $(YOSYS)$(_Y_MUX42)

rmux42:
	sed -i 's/mux2x1_behav/mux2x1_struct/; s/mux4x2_behav/mux4x2_struct/' $(SYN)$(_SMUX42)

vmux42:
	iverilog -o $(OVVP)$(_VVP_MUX42) $(TESTBENCHES)$(_TB_MUX42)
	vvp $(OVVP)$(_VVP_MUX42) > $(LOG_TXT)$(_VVP_MUX42)_log.txt

#target phony
.PHONY: gtkwavemux42
gtkwavemux42:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_MUX42)


#******************************************************************************
#### 														PARALLEL TO SERIAL
#******************************************************************************

yptos:
	yosys $(YOSYS)$(_Y_PTOS)

rptos:
	sed -i 's/paralelo_a_serial/paralelo_a_serial_syn/' $(SYN)$(_SPTOS)

vptos:
	iverilog -o $(OVVP)$(_VVP_PTOS) $(TESTBENCHES)$(_TB_PTOS)
	vvp $(OVVP)$(_VVP_PTOS) > $(LOG_TXT)$(_VVP_PTOS)_log.txt

#target phony
.PHONY: gtkwaveptos
gtkwaveptos:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_PTOS)


#******************************************************************************
#### 														PARALLEL TO SERIAL    IDLE
#******************************************************************************

yptosidle:
	yosys $(YOSYS)$(_Y_PTOSIDLE)

rptosidle:
	sed -i 's/paralelo_a_serial_IDLE/paralelo_a_serial_IDLE_syn' $(SYN)$(_SPTOSIDLE)

vptosidle:
	iverilog -o $(OVVP)$(_VVP_PTOSIDLE) $(TESTBENCHES)$(_TB_PTOSIDLE)
	vvp $(OVVP)$(_VVP_PTOSIDLE) > $(LOG_TXT)$(_VVP_PTOSIDLE)_log.txt

#target phony
.PHONY: gtkwaveptosidle
gtkwaveptosidle:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_PTOSIDLE)


#******************************************************************************
#### 									 SERIAL TO PARALLEL
#******************************************************************************

ystop:
	yosys $(YOSYS)$(_Y_STOP)

rstop:
	sed -i 's/serieparalelo/serieparalelo_syn/' $(SYN)$(_SSTOP)

vstop:
	iverilog -o $(OVVP)$(_VVP_STOP) $(TESTBENCHES)$(_TB_STOP)
	vvp $(OVVP)$(_VVP_STOP) > $(LOG_TXT)$(_VVP_STOP)_log.txt

#target phony
.PHONY: gtkwavestop
gtkwavestop:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_STOP)

#******************************************************************************
#### 									 SERIAL TO PARALLEL		IDLE
#******************************************************************************

ystopidle:
	yosys $(YOSYS)$(_Y_STOPIDLE)

rstopidle:
	sed -i 's/serieparalelo_IDLE/serieparalelo_IDLE_syn/' $(SYN)$(_SSTOPIDLE)

vstopidle:
	iverilog -o $(OVVP)$(_VVP_STOPIDLE) $(TESTBENCHES)$(_TB_STOPIDLE)
	vvp $(OVVP)$(_VVP_STOPIDLE) > $(LOG_TXT)$(_VVP_STOPIDLE)_log.txt

#target phony
.PHONY: gtkwavestopidle
gtkwavestopidle:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_STOPIDLE)

#******************************************************************************
#### 									 DEMUX 				1:2
#******************************************************************************

ydemux12:
	yosys $(YOSYS)$(_Y_DEMUX12)

rdemux12:
	sed -i 's/demux1x2_behav/demux1x2_behav_syn/' $(SYN)$(_SDEMUX12)

vdemux12:
	iverilog -o $(OVVP)$(_VVP_DEMUX12) $(TESTBENCHES)$(_TB_DEMUX12)
	vvp $(OVVP)$(_VVP_DEMUX12) > $(LOG_TXT)$(_VVP_DEMUX12)_log.txt

#target phony
.PHONY: gtkwavedemux12
gtkwavedemux12:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_DEMUX12)


	`include "./src/ff2in2o.v"
	`include "./src/ff4in4o.v"
	`include "./src/ff4in4ovalid.v"


#******************************************************************************
#### 									 DEMUX 				1:4
#******************************************************************************

ydemux14:
	yosys $(YOSYS)$(_Y_DEMUX14)

rdemux14:
	sed -i 's/demux1x2_behav/demux1x2_behav_syn/g; s/demux1x4_behav/demux1x4_behav_syn/g' $(SYN)$(_SDEMUX14)
	sed -i 's/ff2in2o/ff2in2o_syn/g; s/ff4in4o/ff2in2o_syn/g; s/ff4in4ovalid/ff4in4ovalid_syn/g' $(SYN)$(_SDEMUX14)

vdemux14:
	iverilog -o $(OVVP)$(_VVP_DEMUX14) $(TESTBENCHES)$(_TB_DEMUX14)
	vvp $(OVVP)$(_VVP_DEMUX14) > $(LOG_TXT)$(_VVP_DEMUX12)_log.txt

#target phony
.PHONY: gtkwavedemux14
gtkwavedemux14:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_DEMUX14)


#******************************************************************************
#### 									 DEMUX 				2:4
#******************************************************************************

ydemux24:
	yosys $(YOSYS)$(_Y_DEMUX14)

rdemux24:
	sed -i 's/demux1x2_behav/demux1x2_behav_syn/g; s/demux2x4_behav/demux2x4_behav_syn/g ' $(SYN)$(_SDEMUX24)

vdemux24:
	iverilog -o $(OVVP)$(_VVP_DEMUX24) $(TESTBENCHES)$(_TB_DEMUX24)
	vvp $(OVVP)$(_VVP_DEMUX24) > $(LOG_TXT)$(_VVP_DEMUX24)_log.txt

#target phony
.PHONY: gtkwavedemux24
gtkwavedemux24:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_DEMUX24)



#******************************************************************************
#### 									 RECIRCULATION IDLE
#******************************************************************************

yreciridle:
	yosys $(YOSYS)$(_Y_RECIRIDLE)

rreciridle:
	sed -i 's/recir_idle/recir_idle_syn/' $(SYN)$(_SRECIRIDLE)

vreciridle:
	iverilog -o $(OVVP)$(_VVP_RECIRIDLE) $(TESTBENCHES)$(_TB_RECIRIDLE)
	vvp $(OVVP)$(_VVP_RECIRIDLE) > $(LOG_TXT)$(_VVP_RECIRIDLE)_log.txt

#target phony
.PHONY: gtkwavereciridle
gtkwavereciridle:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_RECIRIDLE)






#******************************************************************************
#### 					PHY TX
#******************************************************************************

ytx:
	yosys $(YOSYS)$(_Y_PHY_TX)

rtx:
	sed -i 's/ff1in1o/ff1in1o_syn/g; s/ff2in2o/ff2in2o_syn/g; s/ff4in4o/ff4in4o_syn/g' $(SYN)$(_SPHY_TX)
	sed -i 's/mux2x1_behav/mux2x1_behav_syn/g; s/mux4x1_behav/mux4x1_behav_syn/g; s/mux4x2_behav/mux4x2_behav_syn/g' $(SYN)$(_SPHY_TX)
	sed -i 's/paralelo_a_serial/paralelo_a_serial_syn/g; s/phy_tx_b/phy_tx_b_syn/g' $(SYN)$(_SPHY_TX)
	sed -i 's/serieparalelo_IDLE/serieparalelo_IDLE_syn/g; s/recir_idle/recir_idle_syn/g' $(SYN)$(_SPHY_TX)
vtx:
	iverilog -o $(OVVP)$(_VVP_PHY_TX) $(TESTBENCHES)$(_TB_PHY_TX)
	vvp $(OVVP)$(_VVP_PHY_TX) > $(LOG_TXT)$(_VVP_PHY_TX)_log.txt

#target phony
.PHONY: gtkwavetx
gtkwavetx:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_PHY_TX)





#******************************************************************************
#### 					PHY RX
#******************************************************************************

yrx:
	yosys $(YOSYS)$(_Y_PHY_RX)

rrx:
	sed -i 's/ff2in2o/ff2in2o_syn/g; s/ff4in4o/ff4in4o_syn/g; s/ff4in4ovalid/ff4in4ovalid_syn/g ' $(SYN)$(_SPHY_RX)
	sed -i 's/demux1x2_behav/demux1x2_behav_syn/g; s/demux1x4_behav/demux1x4_behav_syn/g; s/demux2x4_behav/demux2x4_behav_syn/g' $(SYN)$(_SPHY_RX)
	sed -i 's/paralelo_a_serial_IDLE/paralelo_a_serial_IDLE_syn/g; s/serieparalelo/serieparalelo_syn/g; s/phy_rx/phy_rx_syn/g' $(SYN)$(_SPHY_RX)

vrx:
	iverilog -o $(OVVP)$(_VVP_PHY_RX) $(TESTBENCHES)$(_TB_PHY_RX)
	vvp $(OVVP)$(_VVP_PHY_RX) > $(LOG_TXT)$(_VVP_PHY_RX)_log.txt

#target phony
.PHONY: gtkwaverx
gtkwavetrx:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_PHY_RX)



#******************************************************************************
#### 					PHY
#******************************************************************************

yphy:
	yosys $(YOSYS)$(_Y_PHY)

rphy:
	sed -i 's/ff1in1o/ff1in1o_syn/g; s/ff2in2o/ff2in2o_syn/g; s/ff4in4o/ff4in4o_syn/g' $(SYN)$(_SPHY)
	sed -i 's/mux2x1_behav/mux2x1_behav_syn/g; s/mux4x1_behav/mux4x1_behav_syn/g; s/mux4x2_behav/mux4x2_behav_syn/g' $(SYN)$(_SPHY)
	sed -i 's/paralelo_a_serial/paralelo_a_serial_syn/g; s/phy_tx_b/phy_tx_b_syn/g' $(SYN)$(_SPHY)
	sed -i 's/serieparalelo_IDLE/serieparalelo_IDLE_syn/g; s/recir_idle/recir_idle_syn/g' $(SYN)$(_SPHY)
	sed -i 's/demux1x2_behav/demux1x2_behav_syn/g; s/demux1x4_behav/demux1x4_behav_syn/g; s/demux2x4_behav/demux2x4_behav_syn/g' $(SYN)$(_SPHY)
	sed -i 's/paralelo_a_serial_IDLE/paralelo_a_serial_IDLE_syn/g; s/serieparalelo/serieparalelo_syn/g; s/phy_rx/phy_rx_syn/g' $(SYN)$(_SPHY)
	sed -i 's/phy/phy_syn/g' $(SYN)$(_SPHY)

vphy:
	iverilog -o $(OVVP)$(_VVP_PHY) $(TESTBENCHES)$(_TB_PHY)
	vvp $(OVVP)$(_VVP_PHY) > $(LOG_TXT)$(_VVP_PHY)_log.txt

#target phony
.PHONY: gtkwavephy
gtkwavephy:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_PHY)



#******************************************************************************
############ CLEAN FOR ALL
#******************************************************************************


.PHONY: clean
clean:
	rm -rf $(OVVP)*.vvp *.vcd $(LOG_TXT)*_log.txt $(SYN)*syn.v $(DIAGRAMS_GENERATED)*.dot $(DIAGRAMS_GENERATED)*.ps
