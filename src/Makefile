# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/tb.v $(PWD)/add1.v $(PWD)/alu.v $(PWD)/branch.v  $(PWD)/decoder.v $(PWD)/iSign.v $(PWD)/mccoy.v $(PWD)/mux2.v $(PWD)/mux3.v $(PWD)/pc.v $(PWD)/register.v $(PWD)/x8.v $(PWD)/mux4.v $(PWD)/notx8.v

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

