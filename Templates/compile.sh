#!/bin/bash
find . -name "*.class" -type f -delete
jcmp='javac -cp .:../libs/lwjgl-2.9.3.jar'
dasm='python2 ../Krakatau-master/disassemble.py'
$jcmp asmtick/*.java villagemarker/*.java
$dasm ./asmtick/ASMTick.class
$dasm ./asmtick/CommandTickrate.class
$dasm ./villagemarker/ASMVillageMarker.class
$dasm ./villagemarker/RenderShapes.class
