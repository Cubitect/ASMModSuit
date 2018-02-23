package net.minecraft.world.chunk;

import net.minecraft.block.state.IBlockState;

public class Chunk
{
    public int getHeightValue(int x, int z)
    {
        return 0;
    }

    public IBlockState getBlockState(final int x, final int y, final int z)
    {
        return null;
    }

    public boolean isEmpty()
    {
        return false;
    }

    public boolean isPopulated()
    {
        return false;
    }

    public boolean isChunkTicked()
    {
        return false;
    }

    public boolean isLoaded()
    {
        return false;
    }

    public int[] getHeightMap()
    {
        return null;
    }
    
    public boolean isTerrainPopulated()
    {
        return false;
    }

    public boolean isLightPopulated()
    {
        return false;
    }
}
