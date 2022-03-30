#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/eda/Xilinx/Vitis/2020.2/bin:/eda/Xilinx/Vivado/2020.2/bin
else
  PATH=/eda/Xilinx/Vitis/2020.2/bin:/eda/Xilinx/Vivado/2020.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/daniel/Documents/git/ctm-openday-2022/Vivado/matrix_mult/matrix_mult.runs/design_1_xbar_1_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log design_1_xbar_1.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source design_1_xbar_1.tcl
