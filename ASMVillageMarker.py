import SRenderLib
from asmutils import *

def create_mod(util):
    print '\nSearching for mappings for ASMVillageMarker...'

    SRenderLib.setup_lib(util)

    lines = util.readj('World')
    pos = findOps(lines,0,[['.field','protected',';'],['.field','protected','Z'],['.field','protected',';'],['.field','protected',';']])
    util.setmap('VillageCollection',betweenr(lines[pos],'L',';'))
    util.setmap('World.villageCollectionObj',endw(lines[pos],2))
    pos = findOps(lines,pos+1,[['.method','public','()L'+util.getmap('VillageCollection')]])
    if pos is not None:
        util.setmap('World.getVillageCollection',endw(lines[pos],3))

    lines = util.readj('VillageCollection')
    pos = findOps(lines,0,[['.method','public','()Ljava/util/List']])
    util.setmap('VillageCollection.getVillageList',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public',')L']])
    util.setmap('Village',betweenr(lines[pos],')L',';'))

    lines = util.readj('Village')
    pos = findOps(lines,0,[['.method','public','()L']])
    util.setmap('Village.getCenter',endw(lines[pos],3))
    util.setmap('BlockPos',betweenr(lines[pos],')L',';'))
    pos = findOps(lines,pos+1,[['.method','public','()I']])
    util.setmap('Village.getVillageRadius',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()Ljava/util/List']])
    util.setmap('Village.getVillageDoorInfoList',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public',')L']])
    util.setmap('VillageDoorInfo',betweenr(lines[pos],')L',';'))

    lines = util.readj('VillageDoorInfo')
    pos = findOps(lines,0,[['.method','public','()L']])
    util.setmap('VillageDoorInfo.getDoorBlockPos',endw(lines[pos],3))

    lines = util.readj('BlockPos')
    pos = findOps(lines,0,[['.super']])
    util.setmap('Vec3i',endw(lines[pos],1))

    lines = util.readj('Vec3i')
    pos = findOps(lines,0,    [['.method','public','()I'],['stack 1 locals 1']])
    util.setmap('Vec3i.getX',endw(lines[pos-1],3))
    pos = findOps(lines,pos+1,[['.method','public','()I'],['stack 1 locals 1']])
    util.setmap('Vec3i.getY',endw(lines[pos-1],3))
    pos = findOps(lines,pos+1,[['.method','public','()I'],['stack 1 locals 1']])
    util.setmap('Vec3i.getZ',endw(lines[pos-1],3))


    print 'Applying ASMVillageMarker patch...'

    util.setmap('ASMVillageMarker','villagemarker/ASMVillageMarker')
    lines = util.readt('ASMVillageMarker')
    lines = '\1'.join(lines)
    lines = lines.replace('net/minecraft/server/integrated/IntegratedServer', util.getmap('IntegratedServer'))
    lines = lines.replace('net/minecraft/client/entity/EntityPlayerSP', util.getmap('EntityPlayerSP'))
    lines = lines.replace('net/minecraft/client/Minecraft', util.getmap('Minecraft'))
    lines = lines.replace('net/minecraft/world/WorldServer', util.getmap('WorldServer'))
    lines = lines.replace('net/minecraft/util/math/BlockPos', util.getmap('BlockPos'))
    lines = lines.replace('net/minecraft/village/VillageCollection', util.getmap('VillageCollection'))
    lines = lines.replace('net/minecraft/village/VillageDoorInfo', util.getmap('VillageDoorInfo'))
    lines = lines.replace('net/minecraft/village/Village', util.getmap('Village'))
    lines = lines.replace('thePlayer', util.getmap('Minecraft.thePlayer'))
    lines = lines.replace('dimension', util.getmap('Entity.dimension'))
    lines = lines.replace('isSingleplayer', util.getmap('Minecraft.isSingleplayer'))
    lines = lines.replace('worldServerForDimension', util.getmap('MinecraftServer.worldServerForDimension'))
    lines = lines.replace('getVillageDoorInfoList', util.getmap('Village.getVillageDoorInfoList'))
    lines = lines.replace('getVillageCollection', util.getmap('World.getVillageCollection'))
    lines = lines.replace('getVillageRadius', util.getmap('Village.getVillageRadius'))
    lines = lines.replace('getVillageList', util.getmap('VillageCollection.getVillageList'))
    lines = lines.replace('getDoorBlockPos', util.getmap('VillageDoorInfo.getDoorBlockPos'))
    lines = lines.replace('getIntegratedServer', util.getmap('Minecraft.getIntegratedServer'))
    lines = lines.replace('getMinecraft', util.getmap('Minecraft.getMinecraft'))
    lines = lines.replace('getCenter', util.getmap('Village.getCenter'))
    lines = lines.replace('getX', util.getmap('Vec3i.getX'))
    lines = lines.replace('getY', util.getmap('Vec3i.getY'))
    lines = lines.replace('getZ', util.getmap('Vec3i.getZ'))
    lines = lines.split('\1')
    util.write2mod('ASMVillageMarker',lines)

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
        lines.insert(pos+4,'invokestatic Method '+util.getmap('ASMVillageMarker')+' render (DDD)V\n')
    util.write2mod('EntityRenderer',lines)
