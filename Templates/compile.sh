#!/bin/bash
find . -name "*.class" -type f -delete
jcmp='javac -cp .:../libs/lwjgl-2.9.3.jar'
dasm='python2 ../Krakatau-master/disassemble.py'
$jcmp asmtick/*.java villagemarker/*.java eventmarker/*.java structmarker/*.java
$dasm './asmrender/ASMRender.class'
$dasm './asmtick/ASMTick.class'
$dasm './asmtick/CommandTickrate.class'
$dasm './villagemarker/ASMVillageMarker.class'
$dasm './eventmarker/ASMEventMarker.class'
$dasm './eventmarker/ASMEventMarker$TickEntry.class'
$dasm './structmarker/ASMStructMarker.class'
$dasm './structmarker/ASMStructMarker$BB.class'
$dasm './structmarker/ASMStructMarker$StructFType.class'
