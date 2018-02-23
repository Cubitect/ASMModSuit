package net.minecraft.block.state;

import net.minecraft.block.material.EnumPushReaction;
import net.minecraft.block.material.MapColor;
import net.minecraft.block.material.Material;
import net.minecraft.util.EnumBlockRenderType;

public interface IBlockProperties
{
    Material getMaterial();

    boolean isFullBlock();

    int getLightOpacity();

    int getLightValue();

    boolean isTranslucent();

    boolean useNeighborBrightness();

    MapColor getMapColor();

    boolean isFullCube();

    EnumBlockRenderType getRenderType();

    float getAmbientOcclusionLightValue();

    boolean isBlockNormalCube();

    boolean isNormalCube();

    boolean canProvidePower();

    boolean hasComparatorInputOverride();

    EnumPushReaction getMobilityFlag();

    boolean isOpaqueCube();

    boolean isFullyOpaque();
}
