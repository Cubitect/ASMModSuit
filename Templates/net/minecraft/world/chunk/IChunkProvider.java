package net.minecraft.world.chunk;

public interface IChunkProvider
{
    Chunk getLoadedChunk(int x, int z);
}
