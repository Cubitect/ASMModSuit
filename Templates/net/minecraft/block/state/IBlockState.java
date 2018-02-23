package net.minecraft.block.state;

import net.minecraft.block.Block;
import net.minecraft.block.state.IBlockProperties;

public interface IBlockState extends IBlockProperties
{
    Block getBlock();
}
