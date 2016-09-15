package net.minecraft.client;

import net.minecraft.server.integrated.IntegratedServer;
import net.minecraft.client.entity.EntityPlayerSP;

public class Minecraft 
{
	public EntityPlayerSP thePlayer;
	
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
