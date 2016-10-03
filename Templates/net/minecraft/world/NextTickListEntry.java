package net.minecraft.world;

import net.minecraft.block.Block;
import net.minecraft.util.math.BlockPos;

public class NextTickListEntry implements Comparable<NextTickListEntry>
{
    private static long nextTickEntryID;
    private final Block block;
    public final BlockPos position;
    public long scheduledTime;
    public int priority;
    private final long tickEntryID;
    
    public NextTickListEntry(BlockPos positionIn, Block blockIn)
    {
        this.tickEntryID = (long)(nextTickEntryID++);
        this.position = positionIn;
        this.block = blockIn;
    }

    public int compareTo(NextTickListEntry compareObj)
    {
        return 0;
    }
    
    public Block getBlock()
    {
        return null;
    }
}
