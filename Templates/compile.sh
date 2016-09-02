#!/bin/bash
javac ./ASMTick.java ./CommandTickrate.java
python2 ../Krakatau-master/disassemble.py ./ASMTick.class 
python2 ../Krakatau-master/disassemble.py ./CommandTickrate.class
