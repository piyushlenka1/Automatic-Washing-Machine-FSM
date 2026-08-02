# Automatic Washing Machine Controller (Verilog)

## Overview
This project implements an Automatic Washing Machine Controller using a Finite State Machine (FSM) in Verilog HDL. The controller simulates the complete washing process, including door checking, water filling, detergent addition, washing, draining, spinning, and completion.

## Features
- Door Lock Control
- Water Filling
- Detergent Addition
- Washing Cycle
- Water Draining
- Spin Cycle
- Completion Indicator
- Finite State Machine (FSM) Design

## State Flow

CHECK_DOOR
→ FILL_WATER
→ ADD_DETERGENT
→ WASH
→ DRAIN_WATER
→ SPIN
→ FINISH

## Files

- automatic_washing_machine.v – Main FSM design
- automatic_washing_machine_tb.v – Testbench
- Simulation waveform - washing machine.png – Simulation waveform

## Tools Used

- Verilog HDL
- Xilinx Vivado 2023.2

## Simulation

The design was verified using Vivado Behavioral Simulation.

![Simulation Waveform](Simulation%20waveform%20-%20washing%20machine.png)
