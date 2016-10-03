package net.minecraft.client;

import net.minecraft.server.integrated.IntegratedServer;
import net.minecraft.client.entity.EntityPlayerSP;
import net.minecraft.util.Timer;
import net.minecraft.client.gui.FontRenderer;

public class Minecraft 
{
    public EntityPlayerSP thePlayer;
    public Timer timer;
    public FontRenderer fontRendererObj;
    
    public static Minecraft getMinecraft()
    {
        return null;
    }
    
    public boolean isSingleplayer()
    {
        return true;
    }
    
    public IntegratedServer getIntegratedServer()
    {
        return null;
    }
}
