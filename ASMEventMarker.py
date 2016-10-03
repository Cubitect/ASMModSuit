import SRenderLib
from asmutils import *

def create_mod(util):
    print '\nSearching for mappings for ASMEventMarker...'

    SRenderLib.setup_lib(util)

    util.setmap('ASMEventMarker','eventmarker/ASMEventMarker')

    lines = util.readj('WorldServer')
    pos = findOps(lines,0,[['.field','Ljava/util/TreeSet;']])
    util.setmap('WorldServer.pendingTickListEntriesTreeSet',betweenr(lines[pos],' ',' Ljava/util/TreeSet'))
    pos = findOps(lines,pos+1,[['.field','Ljava/util/List;']])
    pos2 = findOps(lines,pos+1,[['.field','Ljava/util/List;']])
    if pos2 is not None:
        pos = pos2
    util.setmap('WorldServer.pendingTickListEntriesThisTick',betweenr(lines[pos],' ',' Ljava/util/List'))
    pos = findOps(lines,0,[['invokevirtual Method java/util/TreeSet first ()Ljava/lang/Object;']])
    pos = findOps(lines,pos+1,[['checkcast']])
    util.setmap('NextTickListEntry',endw(lines[pos],1))
    pos = findOps(lines,pos+1,[['invokevirtual','()J']])
    getTotalWorldTimeOps = [rmlnum(lines[pos-2]),rmlnum(lines[pos-1]),rmlnum(lines[pos])]

    lines = util.readj('NextTickListEntry')
    pos = findOps(lines,0,[['.field','final',';']])
    util.setmap('Block',betweenr(lines[pos],'L',';'))
    util.setmap('NextTickListEntry.block',endw(lines[pos],2))
    pos = findOps(lines,pos+1,[['.field','final',';']])
    util.setmap('BlockPos',betweenr(lines[pos],'L',';'))
    util.setmap('NextTickListEntry.position',endw(lines[pos],2))
    pos = findOps(lines,pos+1,[['.field','J']])
    util.setmap('NextTickListEntry.scheduledTime',endw(lines[pos],2))
    pos = findOps(lines,pos+1,[['.field','I']])
    util.setmap('NextTickListEntry.priority',endw(lines[pos],2))

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

    lines = util.readj('WorldServer')
    pos = findOps(lines,0,[['ldc','4096.0']])
    pos = findOps(lines,pos+1,[['.method','public','(L'+util.getmap('BlockPos')+';L'+util.getmap('Block')+';II)V']])
    util.setmap('WorldServer.addBlockEvent',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['new']])
    util.setmap('BlockEventData',endw(lines[pos],1))

    lines = util.readj('BlockEventData')
    pos = findOps(lines,0,[['.method','public','()L'+util.getmap('BlockPos')]])
    util.setmap('BlockEventData.getPosition',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()I']])
    util.setmap('BlockEventData.getEventID',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()I']])
    util.setmap('BlockEventData.getEventParameter',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()L'+util.getmap('Block')]])
    util.setmap('BlockEventData.getBlock',endw(lines[pos],3))

    lines = util.readj('Block')
    pos = findOps(lines,0,[['tile.']])
    pos = goBackTo(lines,pos,['.method','public','()Ljava/lang/String;'])
    util.setmap('Block.getUnlocalizedName',endw(lines[pos],3))


    print 'Applying ASMEventMarker patch...'

    lines = util.readt('ASMEventMarker')
    lines = '\1'.join(lines)
    lines = lines.replace('net/minecraft/world/NextTickListEntry',util.getmap('NextTickListEntry'))
    lines = lines.replace('net/minecraft/client/Minecraft', util.getmap('Minecraft'))
    lines = lines.replace('isSingleplayer', util.getmap('Minecraft.isSingleplayer'))
    lines = lines.replace('getMinecraft', util.getmap('Minecraft.getMinecraft'))
    lines = lines.split('\1')
    util.write2mod('ASMEventMarker',lines)

    util.setmap('TickEntry','eventmarker/ASMEventMarker$TickEntry')
    lines = util.readt('TickEntry')
    lines = '\1'.join(lines)
    lines = lines.replace('net/minecraft/world/NextTickListEntry',util.getmap('NextTickListEntry'))
    lines = lines.replace('net/minecraft/util/math/BlockPos',util.getmap('BlockPos'))
    lines = lines.replace('net/minecraft/block/BlockEventData',util.getmap('BlockEventData'))
    lines = lines.replace('net/minecraft/block/Block',util.getmap('Block'))
    lines = lines.replace('getEventParameter',util.getmap('BlockEventData.getEventParameter'))
    lines = lines.replace('getEventID',util.getmap('BlockEventData.getEventID'))
    lines = lines.replace('getPosition',util.getmap('BlockEventData.getPosition'))
    lines = lines.replace('getBlock',util.getmap('BlockEventData.getBlock'))
    lines = lines.replace('getUnlocalizedName',util.getmap('Block.getUnlocalizedName'))
    lines = lines.replace('scheduledTime',util.getmap('NextTickListEntry.scheduledTime'))
    lines = lines.replace('position',util.getmap('NextTickListEntry.position'))
    lines = lines.replace('priority',util.getmap('NextTickListEntry.priority'))
    lines = lines.replace('getX', util.getmap('Vec3i.getX'))
    lines = lines.replace('getY', util.getmap('Vec3i.getY'))
    lines = lines.replace('getZ', util.getmap('Vec3i.getZ'))
    lines = lines.split('\1')
    util.write2mod('TickEntry',lines)

    print 'Setting up event-hooks...'

    lines = util.readj('WorldServer')
    pos = findOps(lines,0,[['invokevirtual Method java/util/TreeSet first ()Ljava/lang/Object;']])
    pos = findOps(lines,pos+1,[['invokeinterface InterfaceMethod java/util/List add (Ljava/lang/Object;)Z']])
    pos = findOps(lines,pos+1,[['iinc']])
    pos = findOps(lines,pos+1,[['aload_0']])
    lines.insert(pos+1,'getfield Field '+util.expand('WorldServer.pendingTickListEntriesTreeSet')+'Ljava/util/TreeSet;\n')
    lines.insert(pos+2,'aload_0\n')
    lines.insert(pos+3,'getfield Field '+util.expand('WorldServer.pendingTickListEntriesThisTick')+'Ljava/util/List;\n')
    lines[pos+4:pos+4] = getTotalWorldTimeOps
    pos = pos+4 + len(getTotalWorldTimeOps)
    lines.insert(pos,'invokestatic Method '+util.getmap('ASMEventMarker')+' update (Ljava/util/TreeSet;Ljava/util/List;J)V\n')
    lines.insert(pos+1,'aload_0\n')
    # Add block events to the 'tickBUD' list
    pos = findOps(lines,0,[['.method','public',' '+util.getmap('WorldServer.addBlockEvent')+' ','(L'+util.getmap('BlockPos')+';L'+util.getmap('Block')+';II)V']])
    pos = findOps(lines,pos+1,[['invokevirtual','add ']])
    blockEventData = endw(lines[pos-1],1)
    pos = findOps(lines,pos+1,[['return']])
    lines.insert(pos  ,'getstatic Field '+util.getmap('ASMEventMarker')+' tickBUD Ljava/util/List;\n')
    lines.insert(pos+1,'new '+util.getmap('TickEntry')+'\n')
    lines.insert(pos+2,'dup\n')
    lines.insert(pos+3,'aload '+blockEventData+'\n')
    lines.insert(pos+4,'invokespecial Method '+util.getmap('TickEntry')+' <init> (L'+util.getmap('BlockEventData')+';)V\n')
    lines.insert(pos+5,'invokeinterface InterfaceMethod java/util/List add (Ljava/lang/Object;)Z\n')
    lines.insert(pos+6,'pop\n')
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
        pos = findOps(lines,pos+1,[['ldc','hand']])
        lines.insert(pos+2,'dload '+playerX+'\n')
        lines.insert(pos+3,'dload '+playerY+'\n')
        lines.insert(pos+4,'dload '+playerZ+'\n')
        lines.insert(pos+5,'invokestatic Method '+util.getmap('ASMEventMarker')+' render (DDD)V\n')
    util.write2mod('EntityRenderer',lines)
