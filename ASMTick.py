from asmutils import *

def create_mod(util):
    print '\nSearching for mappings for ASMTick...'

    doPacketHack = True

    # find ServerCommandManager mapping
    util.setmap('MinecraftServer','net/minecraft/server/MinecraftServer')
    lines = util.readj('MinecraftServer')
    pos = 1 + findOps(lines,0,[['.field','final','Ljava/util/List;']])
    while '.field' not in lines[pos]:
        pos += 1
    util.setmap('MinecraftServer.commandManager',endw(lines[pos],2))
    pos = findOps(lines,pos,[['invokevirtual','MinecraftServer '],['putfield',util.expand('MinecraftServer.commandManager')]])
    if pos is not None:
        util.setmap('ServerCommandManager',betweenr(lines[pos-1],')L',';'))
    else:
        pos = findOps(lines,0,[['invokespecial','<init>'],['putfield',util.expand('MinecraftServer.commandManager')]])
        util.setmap('ServerCommandManager',endw(lines[pos-1],3))
    pos = findOps(lines,0,[['ldc','jobs']])
    if pos is not None:
        pos = findOps(lines,pos-8,[['.method']])
        util.setmap('MinecraftServer.updateTimeLightAndEntities',endw(lines[pos],3))
    pos = findOps(lines,0,[['.field','public','[L']])
    util.setmap('WorldServer',betweenr(lines[pos],'[L',';'))
    if doPacketHack:
        pos = findOps(lines,pos+1,[['.field','L']])
        if pos is None:
            doPacketHack = False
        else:
            util.setmap('PlayerList',betweenr(lines[pos],'L',';'))
    if util.side == 'server':
        pos = findOps(lines,0,[['bonusChest']])
        pos = findOps(lines,pos+1,[['invokespecial','(Ljava/io/File;']])
        util.setmap('DedicatedServer',endw(lines[pos],3))

    # find CommandTime mapping
    lines = util.readj('ServerCommandManager')
    pos = findOps(lines,0,[['new']])
    util.setmap('CommandTime',endw(lines[pos],1))

    # find the methods and classes needed to create a new command
    lines = util.readj('CommandTime')
    pos = findOps(lines,0,[['.super']])
    util.setmap('CommandBase',endw(lines[pos],1))
    pos = findOps(lines,pos+1,[['.method','public','String']])
    util.setmap('CommandBase.getCommandName',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','I']])
    util.setmap('CommandBase.getRequiredPermissionLevel',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','String']])
    util.setmap('CommandBase.getCommandUsage',endw(lines[pos],3))
    util.setmap('ICommandSender',betweenr(lines[pos],'(L',';)'))
    pos = findOps(lines,pos+1,[['.method','public','V']])
    if 'MinecraftServer' in lines[pos]:
        util.setmap('CommandBase.execute',endw(lines[pos],3))
        util.setmap('CommandBase.processCommand','processCommand')
    else:
        util.setmap('CommandBase.execute','execute')
        util.setmap('CommandBase.processCommand',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['invokestatic','[','String']])
    util.setmap('CommandBase.notifyOperators',endw(lines[pos],2))
    util.setmap('ICommand',betweenr(lines[pos],';L',';Ljava/lang/String;'))

    # find where the chat-packets end up
    if doPacketHack:
        try:
            lines = util.readj('PlayerList')
            pos = findOps(lines,0,[['.method','public','(L',';Z)V']])
            util.setmap('ITextComponent',betweenr(lines[pos],'(L',';Z)V'))
            pos = findOps(lines,pos+1,[['new']])
            util.setmap('SPacketChat',endw(lines[pos],1))

            lines = util.readj('ITextComponent')
            pos = findOps(lines,0,[['.method','public','()Ljava/lang/String;']])
            util.setmap('ITextComponent.getUnformattedText',endw(lines[pos],3))

            lines = util.readj('SPacketChat')
            pos = findOps(lines,0,[['.field',util.getmap('ITextComponent')]])
            util.setmap('SPacketChat.chatComponent',endw(lines[pos],2))
        except:
            doPacketHack = False

    if(util.side == 'client'):
        util.setmap('Main','net/minecraft/client/main/Main')
        lines = util.readj('Main')
        pos = findOps(lines,0,[['ldc','Player']])
        pos = findOps(lines,pos+1,[['invokestatic']])
        util.setmap('Minecraft',endw(lines[pos],3))

        lines = util.readj('Minecraft')
        pos = findOps(lines,0,[['.field','public','I'],['.field','public','I']])
        pos = findOps(lines,pos+1,[['.field',';']])
        util.setmap('Timer',betweenr(lines[pos],'L',';'))
        util.setmap('Minecraft.timer',endw(lines[pos],2))
        pos = findOps(lines,pos+1,[['.field','public',';']])
        util.setmap('ClientWorld',betweenr(lines[pos],'L',';'))
        util.setmap('Minecraft.theWorld',endw(lines[pos],2))
        pos = findOps(lines,pos+1,[['.field','public',';']])
        pos = findOps(lines,pos+1,[['.field','public',';']])
        util.setmap('EntityPlayerSP',betweenr(lines[pos],'L',';'))
        util.setmap('Minecraft.thePlayer',endw(lines[pos],2))
        pos = findOps(lines,pos+1,[['.field',';']])
        util.setmap('Entity',betweenr(lines[pos],'L',';'))
        pos = findOps(lines,pos+1,[['ldc','\'tick\'']])
        pos = findOps(lines,pos+1,[['invokevirtual',util.getmap('Minecraft'),'()V']])
        util.setmap('Minecraft.runTick',endw(lines[pos],2))
        pos = findOps(lines,pos+1,[['ldc','\'/\'']])
        pos = findOps(lines,pos+1,[['invokespecial','<init>','String;)V']])
        util.setmap('GuiChat',endw(lines[pos],3))
        pos = findOps(lines,0,[['.method','public','static','()L'+util.getmap('Minecraft')]])
        util.setmap('Minecraft.getMinecraft',endw(lines[pos],3))

        lines = util.readj('Timer')
        pos = findOps(lines,0,[['.field','public','I']])
        util.setmap('Timer.elapsedTicks',endw(lines[pos],2))
        pos = findOps(lines,pos+1,[['.field','public','F']])
        util.setmap('Timer.renderPartialTicks',endw(lines[pos],2))
        pos = findOps(lines,pos+1,[['.field','public','F']])
        #util.setmap('Timer.timerSpeed',endw(lines[pos],2))
        tmp = findOps(lines,pos+1,[['.field','public','F']])
        if tmp is not None:
            pos = tmp
        util.setmap('Timer.elapsedPartialTicks',endw(lines[pos],2))


    print 'Applying ASMTick patch...'

    util.setmap('ASMTick','asmtick/ASMTick')
    lines = util.readt('ASMTick')
    if util.side == 'client':
        lines = '\1'.join(lines)
        lines = lines.replace('net/minecraft/client/Minecraft',util.getmap('Minecraft'))
        lines = lines.replace('net/minecraft/util/Timer',util.getmap('Timer'))
        lines = lines.replace('getMinecraft',util.getmap('Minecraft.getMinecraft'))
        lines = lines.replace('elapsedPartialTicks',util.getmap('Timer.elapsedPartialTicks'))
        lines = lines.replace('elapsedTicks',util.getmap('Timer.elapsedTicks'))
        lines = lines.replace('renderPartialTicks',util.getmap('Timer.renderPartialTicks'))
        lines = lines.replace('timer',util.getmap('Minecraft.timer'))
        lines = lines.split('\1')
    elif util.side == 'server':
        pos = -1 + findOps(lines,0,[['putstatic','isRemoteServer']])
        lines[pos] = lines[pos].replace('_0','_1')
    util.write2mod('ASMTick',lines)


    print 'Injecting Tickrate command...'

    util.setmap('CommandTickrate','asmtick/CommandTickrate')
    lines = util.readt('CommandTickrate')
    lines = '\1'.join(lines)
    lines = lines.replace('net/minecraft/command/ICommandSender',util.getmap('ICommandSender'))
    lines = lines.replace('net/minecraft/command/CommandBase',util.getmap('CommandBase'))
    lines = lines.replace('net/minecraft/command/ICommand',util.getmap('ICommand'))
    lines = lines.replace('getCommandUsage',util.getmap('CommandBase.getCommandUsage'))
    lines = lines.replace('getCommandName',util.getmap('CommandBase.getCommandName'))
    lines = lines.replace('getRequiredPermissionLevel',util.getmap('CommandBase.getRequiredPermissionLevel'))
    lines = lines.replace('notifyCommandListener',util.getmap('CommandBase.notifyOperators'))
    lines = lines.replace('execute',util.getmap('CommandBase.execute'))
    lines = lines.replace('processCommand',util.getmap('CommandBase.processCommand'))
    lines = lines.split('\1')
    util.write2mod('CommandTickrate',lines)


    lines = util.readj('ServerCommandManager')
    pos = findOps(lines,0,[['pop']])
    lines.insert(pos+1,'aload_0\n')
    lines.insert(pos+2,'new '+util.getmap('CommandTickrate')+'\n')
    lines.insert(pos+3,'dup\n')
    lines.insert(pos+4,'invokespecial Method '+util.getmap('CommandTickrate')+' <init> ()V\n')
    lines.insert(pos+5,'invokevirtual Method '+util.getmap('ServerCommandManager')+' a (L'+util.getmap('ICommand')+';)L'+util.getmap('ICommand')+';\n')
    lines.insert(pos+6,'pop\n')
    util.write2mod('ServerCommandManager',lines)

    print 'Patching MinecraftServer.class ...'

    lines = util.readj('MinecraftServer')
    pos = findOps(lines,0,[['ldc','2000L']])
    lines[pos] = lnum(lines[pos])+' getstatic Field '+util.getmap('ASMTick')+' serverOverloadWarnTicks J \n'
    pos = findOps(lines,pos+1,[['ldc','2000L']])
    lines[pos] = lnum(lines[pos])+' getstatic Field '+util.getmap('ASMTick')+' serverOverloadWarnTicks J \n'
    pos50 = findOps(lines,pos+1,[['ldc','50L']])
    while pos50 is not None:
        lines[pos50] = 'getstatic Field '+util.getmap('ASMTick')+' ms2Tick J \n'
        pos50 = findOps(lines,pos50+1,[['ldc','50L']])

    posinvk = findOps(lines,pos+1,[['invokestatic','Thread','sleep']])
    pos = findOps(lines,pos-8,[['lconst_1']])
    lines[pos] = lines[pos].split(' ',1)[0] + ' ' + lines[pos+2].split(' ',1)[1]
    del lines[pos+1:posinvk+1]

    if util.getmap('MinecraftServer.updateTimeLightAndEntities') is None or True:
        lines.insert(pos+1,'invokestatic Method '+util.getmap('ASMTick')+' serverSleep (J)J\n')
        lines.insert(pos+2,'pop2\n')
        lines.insert(pos+3,'iconst_0\n')
        lines.insert(pos+4,'putstatic Field '+util.getmap('ASMTick')+' interruptTick Z\n')
    else:
        lines[pos] = lines[pos].replace('lload_1','nop')
        lines.insert(pos+1,'L10002: lload_1\n')
        lines.insert(pos+2,'lload_1\n')
        lines.insert(pos+3,'invokestatic Method '+util.getmap('ASMTick')+' serverSleep (J)J\n')
        lines.insert(pos+4,'ladd\n')
        lines.insert(pos+5,'lstore_1\n')

        lines.insert(pos+6,'getstatic Field '+util.getmap('ASMTick')+' interruptTick Z\n')
        lines.insert(pos+7,'ifeq L10003\n')

        lines.insert(pos+8,'iconst_0\n')
        lines.insert(pos+9,'putstatic Field '+util.getmap('ASMTick')+' interruptTick Z\n')

        lines.insert(pos+10,'iconst_1\n')
        lines.insert(pos+11,'putstatic Field '+util.getmap('ASMTick')+' doOnlyQueue Z\n')
        lines.insert(pos+12,'aload_0\n')
        lines.insert(pos+13,'invokevirtual Method '+util.expand('MinecraftServer.updateTimeLightAndEntities')+'()V\n')
        lines.insert(pos+14,'iconst_0\n')
        lines.insert(pos+15,'putstatic Field '+util.getmap('ASMTick')+' doOnlyQueue Z\n')

        lines.insert(pos+16,'goto L10002\n')
        lines.insert(pos+17,'L10003: nop\n')

        # modify updateTimeLightAndEntities()
        pos = findOps(lines,pos+1,[['.method',util.getmap('MinecraftServer.updateTimeLightAndEntities')]])
        pos = findOps(lines,pos+1,[['ldc','levels']])
        lines.insert(pos+2,'getstatic Field '+util.getmap('ASMTick')+' doOnlyQueue Z\n')
        lines.insert(pos+3,'ifeq L10000\n')
        lines.insert(pos+4,'return\n')
        lines.insert(pos+5,'L10000: nop\n')
    util.write2mod('MinecraftServer',lines)


    if(util.side == 'client'):
        print 'Patching GuiChat.class ...'
        lines = util.readj('GuiChat')
        pos = findOps(lines,0,[['invokevirtual','String','trim']])
        pos = findOps(lines,pos+1,[['invokevirtual','String',util.getmap('GuiChat')]])
        lines.insert(pos+1,lines[pos-1].split(' ', 1)[1])
        lines.insert(pos+2,'invokestatic Method '+util.getmap('ASMTick')+' chatTrigger (Ljava/lang/String;)V\n')
        util.write2mod('GuiChat',lines)

        print 'Patching Minecraft.class ...'
        lines = util.readj('Minecraft')
        pos = findOps(lines,0,[['.field',util.getmap('Minecraft.timer')]])
        lines[pos] = lines[pos].replace('private','public').replace('final','')
        util.write2mod('Minecraft',lines)

    if doPacketHack:
        print 'Hacking chat packets...'
        lines = util.readj('SPacketChat')
        pos = findOps(lines,0,[['.method public','(L',';)V']])
        if pos is not None:
            pos = findOps(lines,pos+1,[['invokevirtual','()L'+util.getmap('ITextComponent')]])
        if pos is not None:
            pos = findOps(lines,pos+1,[['return']])
        if pos is not None:
            lines.insert(pos  ,'aload_0\n')
            lines.insert(pos+1,'getfield Field '+util.expand('SPacketChat.chatComponent')+'L'+util.getmap('ITextComponent')+';\n')
            lines.insert(pos+2,'invokeinterface InterfaceMethod '+util.expand('ITextComponent.getUnformattedText')+'()Ljava/lang/String;\n')
            lines.insert(pos+3,'invokestatic Method '+util.getmap('ASMTick')+' chatPacketRecieved (Ljava/lang/String;)V\n')
            util.write2mod('SPacketChat',lines)

    if util.side == 'server':
        lines = util.readj('DedicatedServer')
        pos = findOps(lines,0,[['max-tick-time']])
        pos = findOps(lines,pos+1,[['lreturn']])
        lines.insert(pos  ,'pop2\n')
        lines.insert(pos+1,'getstatic Field '+util.getmap('ASMTick')+' maxTickTime J\n')
        util.write2mod('DedicatedServer',lines)
