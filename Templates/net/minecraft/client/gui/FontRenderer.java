package net.minecraft.client.gui;

public class FontRenderer
{
    public int FONT_HEIGHT = 9;
    
    public int drawString(String text, int x, int y, int color)
    {
        return this.drawString(text, (float)x, (float)y, color, false);
    }

    public int drawString(String text, float x, float y, int color, boolean dropShadow)
    {
        return 0;
    }
    
	public int getStringWidth(String text)
    {
		return 0;
	}
}
