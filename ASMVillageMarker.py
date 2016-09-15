from asmutils import *

def create_mod(util):
    print 'Searching for mappings for ASMVillageMarker...'

    jMain = util.disasm(join('net','minecraft','client','main','Main'))
    with open(jMain,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['ldc','Player']])
        pos = findOps(lines,pos+1,[['invokestatic']])
        mapMinecraft = endw(lines[pos],3)
        print 'Minecraft -> ' + mapMinecraft

    jMinecraft = util.disasm(mapMinecraft)
    with open(jMinecraft,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.field','public','I'],['.field','public','I']])
        pos = findOps(lines,pos+1,[['.field',';']])
        pos = findOps(lines,pos+1,[['.field','public',';']])
        mapClientWorld = betweenr(lines[pos],'L',';')
        fieldTheWorld = endw(lines[pos],2)
        print 'ClientWorld -> ' + mapClientWorld
        pos = findOps(lines,pos+1,[['.field','public',';']])
        mapRenderGlobal = betweenr(lines[pos],'L',';')
        print 'RenderGlobal -> ' + mapRenderGlobal
        pos = findOps(lines,pos+1,[['.field','public',';']])
        mapEntityPlayerSP = betweenr(lines[pos],'L',';')
        fieldThePlayer = endw(lines[pos],2)
        print 'Minecraft.thePlayer -> ' + fieldThePlayer
        print 'EntityPlayerSP -> ' + mapEntityPlayerSP
        pos = findOps(lines,pos+1,[['.field',';']])
        mapEntity = betweenr(lines[pos],'L',';')
        print 'Entity -> ' + mapEntity
        pos = findOps(lines,0,[['.method','public','static','()L'+mapMinecraft]])
        mtdGetMinecraft = endw(lines[pos],3)
        print 'getMinecraft() -> ' + mtdGetMinecraft
        pos = findOps(lines,pos+1,[['.method','public','()Z']])
        mtdIsSnooperEnabled = endw(lines[pos],3)
        print 'isSnooperEnabled() -> ' + mtdIsSnooperEnabled
        pos = findOps(lines,pos+1,[['.method','public','()Z']])
        mtdIsIntegratedServerRunning = endw(lines[pos],3)
        print 'isIntegratedServerRunning() -> ' + mtdIsIntegratedServerRunning
        pos = findOps(lines,pos+1,[['.method','public','()Z']])
        mtdIsSingleplayer = endw(lines[pos],3)
        print 'isSingleplayer() -> ' + mtdIsSingleplayer
        pos = findOps(lines,pos+1,[['.method','public','()L']])
        mtdGetIntegratedServer = endw(lines[pos],3)
        mapIntegratedServer = betweenr(lines[pos],'()L',';')
        print 'getIntegratedServer() -> ' + mtdGetIntegratedServer
        print 'IntegratedServer -> ' + mapIntegratedServer

    jEntity = util.disasm(mapEntity)
    with open(jEntity,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.field','protected','Z'],['.field','protected','I'],['.field','public','I']])
        fieldDimension = endw(lines[pos],2)
        print 'Entity.dimension -> ' + fieldDimension

    jMinecraftServer = util.disasm(join('net','minecraft','server','MinecraftServer'))
    with open(jMinecraftServer,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.field','public','[L']])
        mapWorldServer = betweenr(lines[pos],'[L',';')
        print 'WorldServer -> ' + mapWorldServer
        pos = findOps(lines,0,[['.method','public','(I)L'+mapWorldServer]])
        mtdWorldServerForDimension = endw(lines[pos],3)
        print 'worldServerForDimension() -> ' + mtdWorldServerForDimension

    jWorldServer = util.disasm(mapWorldServer)
    with open(jWorldServer,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.super']])
        mapWorld = endw(lines[pos],1)
        print 'World -> ' + mapWorld

    jWorld = util.disasm(mapWorld)
    with open(jWorld,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.field','protected',';'],['.field','protected','Z'],['.field','protected',';'],['.field','protected',';']])
        mapVillageCollection = betweenr(lines[pos],'L',';')
        fieldVillageCollectionObj = endw(lines[pos],2)
        print 'VillageCollection -> ' + mapVillageCollection
        pos = findOps(lines,pos+1,[['.method','public','()L'+mapVillageCollection]])
        if pos is not None:
            mtdGetVillageCollection = endw(lines[pos],3)
            print 'getVillageCollection() -> ' + mtdGetVillageCollection
        else:
            mtdGetVillageCollection = None

    jVillageCollection = util.disasm(mapVillageCollection)
    with open(jVillageCollection,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.method','public','()Ljava/util/List']])
        mtdGetVillageList = endw(lines[pos],3)
        print 'getVillageList() -> ' + mtdGetVillageList
        pos = findOps(lines,pos+1,[['.method','public',')L']])
        mapVillage = betweenr(lines[pos],')L',';')
        print 'Village -> ' + mapVillage

    jVillage = util.disasm(mapVillage)
    with open(jVillage,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.method','public','()L']])
        mtdGetCenter = endw(lines[pos],3)
        mapBlockPos = betweenr(lines[pos],')L',';')
        print 'getCenter() -> ' + mtdGetCenter
        print 'BlockPos -> ' + mapBlockPos
        pos = findOps(lines,pos+1,[['.method','public','()I']])
        mtdGetVillageRadius = endw(lines[pos],3)
        print 'getVillageRadius() -> ' + mtdGetVillageRadius
        pos = findOps(lines,pos+1,[['.method','public','()Ljava/util/List']])
        mtdGetVillageDoorInfoList = endw(lines[pos],3)
        print 'getVillageDoorInfoList() -> ' + mtdGetVillageDoorInfoList
        pos = findOps(lines,pos+1,[['.method','public',')L']])
        mapVillageDoorInfo = betweenr(lines[pos],')L',';')
        print 'VillageDoorInfo -> ' + mapVillageDoorInfo

    jVillageDoorInfo = util.disasm(mapVillageDoorInfo)
    with open(jVillageDoorInfo,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.method','public','()L']])
        mtdGetDoorBlockPos = endw(lines[pos],3)
        print 'getDoorBlockPos() -> ' + mtdGetDoorBlockPos

    jBlockPos = util.disasm(mapBlockPos)
    with open(jBlockPos,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.super']])
        mapVec3i = endw(lines[pos],1)
        print 'Vec3i -> ' + mapVec3i

    jVec3i = util.disasm(mapVec3i)
    with open(jVec3i,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,    [['.method','public','()I'],['stack 1 locals 1']])
        mtdGetX = endw(lines[pos-1],3)
        print 'getX() -> ' + mtdGetX
        pos = findOps(lines,pos+1,[['.method','public','()I'],['stack 1 locals 1']])
        mtdGetY = endw(lines[pos-1],3)
        print 'getY() -> ' + mtdGetY
        pos = findOps(lines,pos+1,[['.method','public','()I'],['stack 1 locals 1']])
        mtdGetZ = endw(lines[pos-1],3)
        print 'getZ() -> ' + mtdGetZ

    jRenderGlobal = util.disasm(mapRenderGlobal)


    print 'Applying ASMVillageMarker patch...'

    if not isdir(join(util.modjdir,'villagemarker')):
        os.makedirs(join(util.modjdir,'villagemarker'))

    modClass = join('villagemarker','ASMVillageMarker')
    print 'Setting up '+modClass+'.class...'
    mModClass = join(util.modjdir,modClass+'.j')
    tModClass = join(util.temdir,modClass+'.j')
    with open(mModClass,'w') as fout:
        with open(tModClass,'r') as fin:
            for line in fin:
                line = line.replace('net/minecraft/server/integrated/IntegratedServer', mapIntegratedServer)
                line = line.replace('net/minecraft/client/entity/EntityPlayerSP', mapEntityPlayerSP)
                line = line.replace('net/minecraft/client/Minecraft', mapMinecraft)
                line = line.replace('net/minecraft/world/WorldServer', mapWorldServer)
                line = line.replace('net/minecraft/util/math/BlockPos', mapBlockPos)
                line = line.replace('net/minecraft/village/VillageCollection', mapVillageCollection)
                line = line.replace('net/minecraft/village/VillageDoorInfo', mapVillageDoorInfo)
                line = line.replace('net/minecraft/village/Village', mapVillage)
                line = line.replace('thePlayer', fieldThePlayer)
                line = line.replace('dimension', fieldDimension)
                line = line.replace('isSingleplayer', mtdIsSingleplayer)
                line = line.replace('worldServerForDimension', mtdWorldServerForDimension)
                line = line.replace('getVillageDoorInfoList', mtdGetVillageDoorInfoList)
                line = line.replace('getVillageCollection', mtdGetVillageCollection)
                line = line.replace('getVillageRadius', mtdGetVillageRadius)
                line = line.replace('getVillageList', mtdGetVillageList)
                line = line.replace('getDoorBlockPos', mtdGetDoorBlockPos)
                line = line.replace('getIntegratedServer', mtdGetIntegratedServer)
                line = line.replace('getMinecraft', mtdGetMinecraft)
                line = line.replace('getCenter', mtdGetCenter)
                line = line.replace('getX', mtdGetX)
                line = line.replace('getY', mtdGetY)
                line = line.replace('getZ', mtdGetZ)

                fout.write(line)

    renderShapes = join('villagemarker','RenderShapes')
    print 'Setting up '+renderShapes+'.class...'
    mRenderShapes = join(util.modjdir,renderShapes+'.j')
    tRenderShapes = join(util.temdir,renderShapes+'.j')
    with open(mRenderShapes,'w') as fout:
        with open(tRenderShapes,'r') as fin:
            lines = fin.readlines()
            fout.write(''.join(lines))

    print 'Injecting render call...'
    mRenderGlobal = join(util.modjdir,mapRenderGlobal+'.j')
    with open(mRenderGlobal,'w') as fout:
        with open(jRenderGlobal,'r') as fin:
            lines = fin.readlines()
            pos = findOps(lines,0,[['ldc','prepare']])
            posIns = pos+2
            pos = findOps(lines,pos-80,[['dstore']])
            playerX = endw(lines[pos],1)
            pos = findOps(lines,pos+1,[['dstore']])
            playerY = endw(lines[pos],1)
            pos = findOps(lines,pos+1,[['dstore']])
            playerZ = endw(lines[pos],1)
            lines.insert(posIns  ,'dload '+playerX+'\n')
            lines.insert(posIns+1,'dload '+playerY+'\n')
            lines.insert(posIns+2,'dload '+playerZ+'\n')
            lines.insert(posIns+3,'invokestatic Method '+modClass+' renderVillageMarker (DDD)V\n')
            fout.write(''.join(lines))
