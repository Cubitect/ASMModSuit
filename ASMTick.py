from asmutils import *

def create_mod(util):
    print 'Searching for mappings for ASMTick...'

    doPacketHack = True

    # find ServerCommandManager mapping
    jMinecraftServer = util.disasm(join('net','minecraft','server','MinecraftServer'))
    with open(jMinecraftServer,'r') as f:
        lines = f.readlines()
        pos = 1 + findOps(lines,0,[['.field','final','Ljava/util/List;']])
        while '.field' not in lines[pos]:
            pos += 1
        fieldCommandManager = endw(lines[pos],2)
        pos = findOps(lines,pos,[['invokevirtual','MinecraftServer '],['putfield','MinecraftServer '+fieldCommandManager]])
        if pos is not None:
            mapServerCommandManager = betweenr(lines[pos-1],')L',';')
        else:
            pos = findOps(lines,0,[['invokespecial','<init>'],['putfield','MinecraftServer '+fieldCommandManager]])
            mapServerCommandManager = endw(lines[pos-1],3)
        print 'ServerCommandManager -> ' + mapServerCommandManager
        pos = findOps(lines,0,[['ldc','jobs']])
        if pos is not None:
            pos = findOps(lines,pos-8,[['.method']])
            mtdUpdateTimeLightAndEntities = endw(lines[pos],3)
            print 'updateTimeLightAndEntities() -> ' + mtdUpdateTimeLightAndEntities
        else:
            mtdUpdateTimeLightAndEntities = None
        pos = findOps(lines,0,[['.field','public','[L']])
        mapWorldServer = betweenr(lines[pos],'[L',';')
        print 'WorldServer -> ' + mapWorldServer
        if doPacketHack:
            pos = findOps(lines,pos+1,[['.field','L']])
            if pos is None:
                doPacketHack = False
            else:
                mapPlayerList = betweenr(lines[pos],'L',';')
                print 'PlayerList -> ' + mapPlayerList
        if util.side == 'server':
            pos = findOps(lines,0,[['bonusChest']])
            pos = findOps(lines,pos+1,[['invokespecial','(Ljava/io/File;']])
            mapDedicatedServer = endw(lines[pos],3)
            print 'DedicatedServer -> ' + mapDedicatedServer
            jDedicatedServer = util.disasm(mapDedicatedServer)

    # find CommandTime mapping
    jServerCommandManager = util.disasm(mapServerCommandManager)
    with open(jServerCommandManager,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['new']])
        mapCommandTime = endw(lines[pos],1)
        print 'CommandTime -> ' + mapCommandTime

    # find the methods and classes needed to create a new command
    jCommandTime = util.disasm(mapCommandTime)
    with open(jCommandTime,'r') as f:
        lines = f.readlines()
        pos = findOps(lines,0,[['.super']])
        mapCommandBase = endw(lines[pos],1)
        print 'CommandBase -> ' + mapCommandBase
        pos = findOps(lines,pos+1,[['.method','public','String']])
        mtdGetCommandName = endw(lines[pos],3)
        print 'getCommandName() -> ' + mtdGetCommandName
        pos = findOps(lines,pos+1,[['.method','public','I']])
        mtdGetRequiredPermissionLevel = endw(lines[pos],3)
        print 'getRequiredPermissionLevel() -> ' + mtdGetRequiredPermissionLevel
        pos = findOps(lines,pos+1,[['.method','public','String']])
        mtdGetCommandUsage = endw(lines[pos],3)
        print 'getCommandUsage() -> ' + mtdGetCommandUsage
        mapICommandSender = betweenr(lines[pos],'(L',';)')
        print 'ICommandSender -> ' + mapICommandSender
        pos = findOps(lines,pos+1,[['.method','public','V']])
        if 'MinecraftServer' in lines[pos]:
            mtdExecute = endw(lines[pos],3)
            mtdProcessCommand = None
            print 'execute() -> ' + mtdExecute
        else:
            mtdExecute = None
            mtdProcessCommand = endw(lines[pos],3)
            print 'processCommand() -> ' + mtdProcessCommand
        pos = findOps(lines,pos+1,[['invokestatic','[','String']])
        mtdNotifyOperators = endw(lines[pos],2)
        print 'notifyOperators() -> ' + mtdNotifyOperators
        mapICommand = betweenr(lines[pos],';L',';Ljava/lang/String;')
        print 'ICommand -> ' + mapICommand

    # find where the chat-packets end up
    if doPacketHack:
        try:
            jPlayerList = util.disasm(mapPlayerList)
            with open(jPlayerList,'r') as f:
                lines = f.readlines()
                pos = findOps(lines,0,[['.method','public','(L',';Z)V']])
                mapITextComponent = betweenr(lines[pos],'(L',';Z)V')
                print 'ITextComponent -> ' + mapITextComponent
                pos = findOps(lines,pos+1,[['new']])
                mapSPacketChat = endw(lines[pos],1)
                print 'SPacketChat -> ' + mapSPacketChat

            jITextComponent = util.disasm(mapITextComponent)
            with open(jITextComponent,'r') as f:
                lines = f.readlines()
                pos = findOps(lines,0,[['.method','public','()Ljava/lang/String;']])
                mtdGetUnformattedText = endw(lines[pos],3)
                print 'getUnformattedText() -> ' + mtdGetUnformattedText

            jSPacketChat = util.disasm(mapSPacketChat)
            with open(jSPacketChat,'r') as f:
                lines = f.readlines()
                pos = findOps(lines,0,[['.field',mapITextComponent]])
                fieldChatComponent = endw(lines[pos],2)
        except:
            doPacketHack = False

    if(util.side == 'client'):
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
            mapTimer = endw(lines[pos],1)[1:-1]
            fieldTimer = endw(lines[pos],2)
            print 'Timer -> ' + mapTimer
            pos = findOps(lines,pos+1,[['.field','public',';']])
            mapClientWorld = endw(lines[pos],1)[1:-1]
            fieldTheWorld = endw(lines[pos],2)
            print 'ClientWorld -> ' + mapClientWorld
            pos = findOps(lines,pos+1,[['.field','public',';']])
            pos = findOps(lines,pos+1,[['.field','public',';']])
            mapEntityPlayerSP = endw(lines[pos],1)[1:-1]
            fieldThePlayer = endw(lines[pos],2)
            print 'EntityPlayerSP -> ' + mapEntityPlayerSP
            pos = findOps(lines,pos+1,[['.field',';']])
            mapEntity = betweenr(lines[pos],'L',';')
            print 'Entity -> ' + mapEntity
            pos = findOps(lines,pos+1,[['ldc','\'tick\'']])
            pos = findOps(lines,pos+1,[['invokevirtual',mapMinecraft,'()V']])
            mtdRunTick = endw(lines[pos],2)
            print 'runTick() -> ' + mtdRunTick
            pos = findOps(lines,pos+1,[['ldc','\'/\'']])
            pos = findOps(lines,pos+1,[['invokespecial','<init>','String;)V']])
            mapGuiChat = endw(lines[pos],3)
            print 'GuiChat -> ' + mapGuiChat
            pos = findOps(lines,0,[['.method','public','static','()L'+mapMinecraft]])
            mtdGetMinecraft = endw(lines[pos],3)
            print 'getMinecraft() -> ' + mtdGetMinecraft

        jGuiChat = util.disasm(mapGuiChat)


    print 'Applying ASMTick patch...'

    if not isdir(join(util.modjdir,'asmtick')):
        os.makedirs(join(util.modjdir,'asmtick'))

    modClass = 'asmtick/ASMTick'
    print 'Setting up '+modClass+'.class...'
    mModClass = join(util.modjdir,modClass+'.j')
    tModClass = join(util.temdir,modClass+'.j')
    with open(mModClass,'w') as fout:
        with open(tModClass,'r') as fin:
            lines = fin.readlines()
            if util.side == 'client':
                pos = findOps(lines,0,[['.method','setTickClient']])
                pos = findOps(lines,pos+1,[['.code stack']])
                lines[pos] = ' .code stack 6 locals 2\n'
                pos = findOps(lines,pos+1,[['putstatic','tickrateClient']])
                lines.insert(pos+1,'invokestatic Method '+mapMinecraft+' '+mtdGetMinecraft+' ()L'+mapMinecraft+';\n')
                lines.insert(pos+2,'new '+mapTimer+'\n')
                lines.insert(pos+3,'dup\n')
                lines.insert(pos+4,'fload_0\n')
                lines.insert(pos+5,'invokespecial Method '+mapTimer+' <init> (F)V\n')
                lines.insert(pos+6,'putfield Field '+mapMinecraft+' '+fieldTimer+' L'+mapTimer+';\n')
            elif util.side == 'server':
                pos = -1 + findOps(lines,0,[['putstatic','isRemoteServer']])
                lines[pos] = lines[pos].replace('_0','_1')

            fout.write(''.join(lines))

    print 'Injecting Tickrate command...'
    cmdTickrate = 'asmtick/CommandTickrate'
    mCommandTickrate = join(util.modjdir,cmdTickrate+'.j')
    tCommandTickrate = join(util.temdir,cmdTickrate+'.j')
    with open(mCommandTickrate, 'w') as fout:
        with open(tCommandTickrate, 'r') as fin:
            for line in fin:
                line = line.replace('net/minecraft/command/CommandBase', mapCommandBase)
                line = line.replace('getCommandName', mtdGetCommandName)
                line = line.replace('getRequiredPermissionLevel', mtdGetRequiredPermissionLevel)
                line = line.replace('getCommandUsage', mtdGetCommandUsage)
                line = line.replace('net/minecraft/command/ICommandSender', mapICommandSender)
                if mtdExecute is not None:
                    line = line.replace('execute', mtdExecute)
                if mtdProcessCommand is not None:
                    line = line.replace('processCommand', mtdProcessCommand)
                line = line.replace('notifyCommandListener', mtdNotifyOperators)
                line = line.replace('net/minecraft/command/ICommand', mapICommand)
                fout.write(line)

    mServerCommandManager = join(util.modjdir,mapServerCommandManager+'.j')
    with open(mServerCommandManager,'w') as fout:
        with open(jServerCommandManager,'r') as fin:
            lines = fin.readlines()
            pos = findOps(lines,0,[['pop']])
            lines.insert(pos+1,'aload_0\n')
            lines.insert(pos+2,'new '+cmdTickrate+'\n')
            lines.insert(pos+3,'dup\n')
            lines.insert(pos+4,'invokespecial Method '+cmdTickrate+' <init> ()V\n')
            lines.insert(pos+5,'invokevirtual Method '+mapServerCommandManager+' a (L'+mapICommand+';)L'+mapICommand+';\n')
            lines.insert(pos+6,'pop\n')
            fout.write(''.join(lines))


    print 'Patching MinecraftServer.class ...'
    serverdir = join('net','minecraft','server')
    if not isdir(join(util.modjdir,serverdir)):
        os.makedirs(join(util.modjdir,serverdir))

    mMinecraftServer = join(util.modjdir,serverdir,'MinecraftServer.j')
    with open(mMinecraftServer,'w') as fout:
        with open(jMinecraftServer,'r') as fin:
            lines = fin.readlines()
            pos = findOps(lines,0,[['ldc','2000L']])
            lines[pos] = lnum(lines[pos])+' getstatic Field '+modClass+' serverOverloadWarnTicks J \n'
            pos = findOps(lines,pos+1,[['ldc','2000L']])
            lines[pos] = lnum(lines[pos])+' getstatic Field '+modClass+' serverOverloadWarnTicks J \n'
            pos50 = findOps(lines,pos+1,[['ldc','50L']])
            while pos50 is not None:
                lines[pos50] = 'getstatic Field '+modClass+' ms2Tick J \n'
                pos50 = findOps(lines,pos50+1,[['ldc','50L']])

            posinvk = findOps(lines,pos+1,[['invokestatic','Thread','sleep']])
            pos = findOps(lines,pos-8,[['lconst_1']])
            lines[pos  ] = lines[pos].split(' ',1)[0] + ' ' + lines[pos+2].split(' ',1)[1]
            del lines[pos+1:posinvk+1]

            if mtdUpdateTimeLightAndEntities is None:
                lines.insert(pos+1,'invokestatic Method '+modClass+' serverSleep (J)J\n')
                lines.insert(pos+2,'pop2\n')
                lines.insert(pos+3,'iconst_0\n')
                lines.insert(pos+4,'putstatic Field '+modClass+' interruptTick Z\n')
            else:
                lines[pos] = lines[pos].replace('lload_1','nop')
                lines.insert(pos+1,'L10002: lload_1\n')
                lines.insert(pos+2,'lload_1\n')
                lines.insert(pos+3,'invokestatic Method '+modClass+' serverSleep (J)J\n')
                lines.insert(pos+4,'ladd\n')
                lines.insert(pos+5,'lstore_1\n')

                lines.insert(pos+6,'getstatic Field '+modClass+' interruptTick Z\n')
                lines.insert(pos+7,'ifeq L10003\n')

                lines.insert(pos+8,'iconst_0\n')
                lines.insert(pos+9,'putstatic Field '+modClass+' interruptTick Z\n')

                lines.insert(pos+10,'iconst_1\n')
                lines.insert(pos+11,'putstatic Field '+modClass+' doOnlyQueue Z\n')
                lines.insert(pos+12,'aload_0\n')
                lines.insert(pos+13,'invokevirtual Method net/minecraft/server/MinecraftServer '+mtdUpdateTimeLightAndEntities+' ()V\n')
                lines.insert(pos+14,'iconst_0\n')
                lines.insert(pos+15,'putstatic Field '+modClass+' doOnlyQueue Z\n')

                lines.insert(pos+16,'goto L10002\n')
                lines.insert(pos+17,'L10003: nop\n')

                # modify updateTimeLightAndEntities()
                pos = findOps(lines,pos+1,[['.method',mtdUpdateTimeLightAndEntities]])
                pos = findOps(lines,pos+1,[['ldc','levels']])
                lines.insert(pos+2,'getstatic Field '+modClass+' doOnlyQueue Z\n')
                lines.insert(pos+3,'ifeq L10000\n')
                lines.insert(pos+4,'return\n')
                lines.insert(pos+5,'L10000: nop\n')

            fout.write(''.join(lines))

    if(util.side == 'client'):
        print 'Patching GuiChat.class ...'
        mGuiChat = join(util.modjdir,mapGuiChat+'.j')
        with open(mGuiChat,'w') as fout:
            with open(jGuiChat,'r') as fin:
                lines = fin.readlines()
                pos = findOps(lines,0,[['invokevirtual','String','trim']])
                pos = findOps(lines,pos+1,[['invokevirtual','String',mapGuiChat]])
                lines.insert(pos+1,lines[pos-1].split(' ', 1)[1])
                lines.insert(pos+2,'invokestatic Method '+modClass+' chatTrigger (Ljava/lang/String;)V\n')
                fout.write(''.join(lines))

        print 'Patching Minecraft.class ...'
        mMinecraft = join(util.modjdir,mapMinecraft+'.j')
        with open(mMinecraft,'w') as fout:
            with open(jMinecraft,'r') as fin:
                lines = fin.readlines()
                pos = findOps(lines,0,[['.field',fieldTimer]])
                lines[pos] = lines[pos].replace('private','public').replace('final','')
                fout.write(''.join(lines))

    if doPacketHack:
        with open(jSPacketChat,'r') as fin:
            lines = fin.readlines()
            pos = findOps(lines,0,[['.method public','(L',';)V']])
            if pos is not None:
                pos = findOps(lines,pos+1,[['invokevirtual','()L'+mapITextComponent]])
            if pos is not None:
                pos = findOps(lines,pos+1,[['return']])
            if pos is not None:
                lines.insert(pos  ,'aload_0\n')
                lines.insert(pos+1,'getfield Field '+mapSPacketChat+' '+fieldChatComponent+' L'+mapITextComponent+';\n')
                lines.insert(pos+2,'invokeinterface InterfaceMethod '+mapITextComponent+' '+mtdGetUnformattedText+' ()Ljava/lang/String;\n')
                lines.insert(pos+3,'invokestatic Method '+modClass+' chatPacketRecieved (Ljava/lang/String;)V\n')

                mSPacketChat = join(util.modjdir,mapSPacketChat+'.j')
                with open(mSPacketChat,'w') as fout:
                    fout.write(''.join(lines))

    if util.side == 'server':
        mDedicatedServer = join(util.modjdir,mapDedicatedServer+'.j')
        with open(mDedicatedServer,'w') as fout:
            with open(jDedicatedServer,'r') as fin:
                lines = fin.readlines()
                pos = findOps(lines,0,[['max-tick-time']])
                pos = findOps(lines,pos+1,[['lreturn']])
                lines.insert(pos  ,'pop2\n')
                lines.insert(pos+1,'getstatic Field '+modClass+' maxTickTime J\n')
                fout.write(''.join(lines))
