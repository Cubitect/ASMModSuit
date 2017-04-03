import SRenderLib
from asmutils import *

def create_mod(util):
    print '\nSearching for mappings for ASMStructMarker...'
    SRenderLib.setup_lib(util)

    lines = util.readj('WorldServer')
    pos = findOps(lines,0,[['.method','public','<init>','MinecraftServer']])
    util.setmap('ISaveHandler',betweenl(lines[pos],';L',';L'))
    pos = findOps(lines,pos+1,[['.method','public','()V']])
    util.setmap('WorldServer.tick',endw(lines[pos],3))

    lines = util.readj('ISaveHandler')
    pos = findOps(lines,0,[['.method','public','abstract','()Ljava/io/File;']])
    util.setmap('ISaveHandler.getWorldDirectory',endw(lines[pos],3))


    print 'Applying ASMStructMarker patch...'
    util.setmap('ASMStructMarker','structmarker/ASMStructMarker')
    util.setmap('ASMStructMarker$BB','structmarker/ASMStructMarker$BB')
    util.setmap('ASMStructMarker$StructFType','structmarker/ASMStructMarker$StructFType')

    lines = util.readt('ASMStructMarker')
    util.write2mod('ASMStructMarker',lines)
    lines = util.readt('ASMStructMarker$BB')
    util.write2mod('ASMStructMarker$BB',lines)
    lines = util.readt('ASMStructMarker$StructFType')
    util.write2mod('ASMStructMarker$StructFType',lines)


    lines = util.readj('WorldServer')
    pos = findOps(lines,0,[['.method','public','<init>','MinecraftServer']])
    pos = findOps(lines,pos+1,[['return']])
    lines.insert(pos+0,'aload_2\n')
    lines.insert(pos+1,'invokeinterface InterfaceMethod '+util.expand('ISaveHandler.getWorldDirectory')+'()Ljava/io/File;\n')
    lines.insert(pos+2,'invokestatic Method '+util.getmap('ASMStructMarker')+' init (Ljava/io/File;)V\n')
    pos = findOps(lines,pos+1,[['.method',util.getmap('WorldServer.tick'),'()V']])
    pos = findOps(lines,pos+1,[['return']])
    lines.insert(pos+0,'invokestatic Method '+util.getmap('ASMStructMarker')+' updateAll ()V\n')
    util.write2mod('WorldServer',lines)


    print 'Injecting render call...'
    lines = util.readj('EntityRenderer')
    pos = 0
    while True:
        pos = findOps(lines,pos+1,[['ldc','culling']])
        if pos is None:
            break
        pos = findOps(lines,pos+1,[['dload'],['dload'],['dload']])
        playerX = endw(lines[pos-2],1)
        playerY = endw(lines[pos-1],1)
        playerZ = endw(lines[pos  ],1)
        pos = findOps(lines,pos+1,[['ldc','aboveClouds']])
        pos = goBackTo(lines,pos,['invokevirtual'])
        lines.insert(pos+1,'dload '+playerX+'\n')
        lines.insert(pos+2,'dload '+playerY+'\n')
        lines.insert(pos+3,'dload '+playerZ+'\n')
        lines.insert(pos+4,'invokestatic Method '+util.getmap('ASMStructMarker')+' render (DDD)V\n')
    util.write2mod('EntityRenderer',lines)
