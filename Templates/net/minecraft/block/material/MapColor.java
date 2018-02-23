package net.minecraft.block.material;

public class MapColor
{
    public static final MapColor AIR = new MapColor(0, 0);
    public final int colorValue;
    
    private MapColor(int index, int color)
    {
        colorValue = color;
    }
}
