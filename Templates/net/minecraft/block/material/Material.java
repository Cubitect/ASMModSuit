package net.minecraft.block.material;

public class Material
{
    public Material(MapColor color)
    {
    }

    public boolean isLiquid()
    {
        return false;
    }

    public boolean isSolid()
    {
        return true;
    }

    public boolean blocksLight()
    {
        return true;
    }

    public boolean blocksMovement()
    {
        return true;
    }

    public boolean getCanBurn()
    {
        return false;
    }

    public Material setReplaceable()
    {
        return this;
    }

    public boolean isReplaceable()
    {
        return false;
    }

    public boolean isOpaque()
    {
        return false;
    }

    public boolean isToolNotRequired()
    {
        return false;
    }

    public EnumPushReaction getMobilityFlag()
    {
        return null;
    }

    public MapColor getMaterialMapColor()
    {
        return null;
    }
}
