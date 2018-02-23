package net.minecraft.world;

import net.minecraft.village.VillageCollection;
import net.minecraft.world.chunk.IChunkProvider;

public abstract class World
{
    public VillageCollection getVillageCollection()
    {
        return null;
    }
    
    public IChunkProvider getChunkProvider()
    {
        return null;
    }
}
