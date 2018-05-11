WTFpga
======
2 hour crash course in FPGAs and Verilog

Purpose
=======
The purpose of this workshop is to jumpstart people new to FPGAs, getting them to the point where they can understand and make minor changes to Verilog designs, and see the results on hardware.

When delivered as a workshop, laptops have Vivado preinstalled and the project preloaded so that attendees can get straight to toggling switches and flashing LEDs.

The scope is intentionally limited to make sure it's doable in a couple hours time, so that attendees don't need to make a huge time commitment to get a hands-on understanding of FPGAs and Verilog

What's not covered
==================
To keep it simple, I skip over:
1. Toolchain Setup
2. Synchronous Logic
3. IP cores
4. Simulation
5. Testbenches

... and probably lots more things you'll want to be sure to learn more about once you get started.

Changes
=======
Version 1.0 targeted a generic Xilinx XC3S200A FPGA board using Xilinx ISE tools. Posted 2014
Version 2.0 is significantly updated, targeting a Digilent Basys 3 board and Xilinx Vivado. Posted 2018

DIY
===
If you'd like to do this workshop on your own, before you start, you'll need to:
1. Install Xilinx Vivado. The free WebPack version is sufficent: https://www.xilinx.com/products/design-tools/vivado.html
2. Aquire a Diglilent Basys 3 Board. Students qualify for an academic discount: http://digilent.com/basys3
3. Walk through the pdf manual included. `pdfbook --lettterpaper wtfpgamanual.pdf` should prepare it for printing as a booklet if you prefer.

Future Work
===========
I hope to port this workshop to the Icestorm toolchain. I haven't so far since I haven't seen the right board - one with switches, buttons, LEDs, and 7-segment displays.

Derivative use
==============
Please use and distribute this material! If you need a more permissive license let me know!
