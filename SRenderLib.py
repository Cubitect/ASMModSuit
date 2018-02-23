from asmutils import *

def setup_lib(util):
    if util.getmap('ASMRender') is not None:
        return

    print 'Setting up ASMRender...'

    util.setmap('Main','net/minecraft/client/main/Main')
    util.setmap('MinecraftServer','net/minecraft/server/MinecraftServer')

    lines = util.readj('Main')
    pos = findOps(lines,0,[['ldc','Player']])
    pos = findOps(lines,pos+1,[['invokestatic']])
    util.setmap('Minecraft',endw(lines[pos],3))

    lines = util.readj('Minecraft')
    pos = findOps(lines,0,[['.field','private',' Z']])
    pos = findOps(lines,pos+1,[['.field','public',';'],['.field','public',';']])
    util.setmap('ClientWorld',betweenr(lines[pos-1],'L',';'))
    util.setmap('Minecraft.theWorld',endw(lines[pos-1],2))
    util.setmap('RenderGlobal',betweenr(lines[pos],'L',';'))
    pos = findOps(lines,pos+1,[['.field','public',';']])
    util.setmap('EntityPlayerSP',betweenr(lines[pos],'L',';'))
    util.setmap('Minecraft.thePlayer',endw(lines[pos],2))
    pos = findOps(lines,pos+1,[['.field',';']])
    util.setmap('Entity',betweenr(lines[pos],'L',';'))
    pos = findOps(lines,pos+1,[['.field',' Z']]) #isGamePaused
    pos = findOps(lines,pos+1,[['.field',';']])
    util.setmap('FontRenderer',betweenr(lines[pos],'L',';'))
    util.setmap('Minecraft.fontRendererObj',endw(lines[pos],2))
    pos = findOps(lines,pos+1,[['.field',';']]) # standardGalacticFontRenderer
    pos = findOps(lines,pos+1,[['.field',';']]) # GuiScreen currentScreen;
    pos = findOps(lines,pos+1,[['.field',';']]) # [changes across versions]
    entrndrcheck = [betweenr(lines[pos],'L',';')]
    pos = findOps(lines,pos+1,[['.field',';']])
    entrndrcheck += [betweenr(lines[pos],'L',';')]
    pos = findOps(lines,0,[['.method','public','static','()L'+util.getmap('Minecraft')]])
    util.setmap('Minecraft.getMinecraft',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()Z']])
    util.setmap('Minecraft.isSnooperEnabled',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()Z']])
    util.setmap('Minecraft.isIntegratedServerRunning',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()Z']])
    util.setmap('Minecraft.isSingleplayer',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','()L']])
    util.setmap('Minecraft.getIntegratedServer',endw(lines[pos],3))
    util.setmap('IntegratedServer',betweenr(lines[pos],'()L',';'))
    print 'Looking for EntityRenderer...'
    for entrendr in entrndrcheck:
        print '  Checking ' + entrendr + '...\t',
        util.maps[entrendr] = entrendr # set the map quietly
        lines = util.readj(entrendr)
        if any('culling' in l for l in lines):
            print 'YES'
            util.setmap('EntityRenderer',entrendr)
            break
        else:
            print 'NO'

    lines = util.readj('Entity')
    pos = findOps(lines,0,[['.field','protected','Z'],['.field','protected','I'],['.field','public','I']])
    util.setmap('Entity.dimension',endw(lines[pos],2))

    lines = util.readj('MinecraftServer')
    pos = findOps(lines,0,[['.field','public','[L']])
    util.setmap('WorldServer',betweenr(lines[pos],'[L',';'))
    pos = findOps(lines,0,[['.method','public','(I)L'+util.getmap('WorldServer')]])
    util.setmap('MinecraftServer.worldServerForDimension',endw(lines[pos],3))

    lines = util.readj('WorldServer')
    pos = findOps(lines,0,[['.super']])
    util.setmap('World',endw(lines[pos],1))

    lines = util.readj('FontRenderer')
    pos = findOps(lines,0,[['.method','public','(Ljava/lang/String;III)I']])
    util.setmap('FontRenderer.drawStringI',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','(Ljava/lang/String;FFIZ)I']])
    util.setmap('FontRenderer.drawStringF',endw(lines[pos],3))
    pos = findOps(lines,pos+1,[['.method','public','(Ljava/lang/String;)I']])
    util.setmap('FontRenderer.getStringWidth',endw(lines[pos],3))

    util.setmap('ASMRender','asmrender/ASMRender')
    lines = util.readt('ASMRender')
    lines = '\1'.join(lines)
    lines = lines.replace('net/minecraft/client/Minecraft',util.getmap('Minecraft'))
    lines = lines.replace('net/minecraft/client/gui/FontRenderer',util.getmap('FontRenderer'))
    lines = lines.replace('drawString (Ljava/lang/String;III)I ',util.getmap('FontRenderer.drawStringI')+' (Ljava/lang/String;III)I')
    lines = lines.replace('drawString (Ljava/lang/String;FFIZ)I ',util.getmap('FontRenderer.drawStringF')+' (Ljava/lang/String;FFIZ)I')
    lines = lines.replace('getMinecraft',util.getmap('Minecraft.getMinecraft'))
    lines = lines.replace('getStringWidth',util.getmap('FontRenderer.getStringWidth'))
    lines = lines.replace('fontRendererObj',util.getmap('Minecraft.fontRendererObj'))
    lines = lines.split('\1')
    util.write2mod('ASMRender',lines)
