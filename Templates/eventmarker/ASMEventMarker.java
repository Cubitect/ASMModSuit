package eventmarker;

import java.awt.Color;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeSet;

import net.minecraft.block.BlockEventData;
import net.minecraft.world.NextTickListEntry;
import asmrender.ASMRender;

public class ASMEventMarker extends ASMRender
{
	public static final List<TickEntry> tickCurrent = new ArrayList<TickEntry>();
	public static final List<TickEntry> tickPending = new ArrayList<TickEntry>();
	public static final List<TickEntry> tickBUD = new ArrayList<TickEntry>();
	public static final ASMEventMarker INSTANCE = new ASMEventMarker();
	
	public static long worldTime;
	
	public static void update(TreeSet<NextTickListEntry> pendingTickListEntriesTreeSet, List<NextTickListEntry> pendingTickListEntriesThisTick, long time)
	{
		if(time != worldTime)
		{
			worldTime = time;
			tickCurrent.clear();
			tickPending.clear();
			tickBUD.clear();
		}
        for(NextTickListEntry e : pendingTickListEntriesTreeSet)
        	ASMEventMarker.tickPending.add(new TickEntry(e));
        for(NextTickListEntry e : pendingTickListEntriesThisTick)
        	ASMEventMarker.tickCurrent.add(new TickEntry(e));
	}
	
	public static void render(double playerX, double playerY, double playerZ)
	{
		try
		{
			if(minecraft.isSingleplayer()) 
			{
				setup(false);
				translate((float)playerX, (float)playerY, (float)playerZ);
				renderTicks(tickCurrent, Color.BLUE, "§4");
				renderTicks(tickPending, Color.BLUE, "§6");
				renderTicks(tickBUD, Color.GREEN, "§2");
				ASMRender.restore();
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public static void renderTicks(List<TickEntry> list, Color bcolor, String col)
	{
		HashMap<Long,TickEntry[]> map = new HashMap<Long,TickEntry[]>();
        
        for(int i = 0; i < list.size(); i++)
        {	
        	TickEntry entry = list.get(i);
        	entry.idx = i;
        	Long key = entry.getPosLong();
        	TickEntry entries[] = map.get(key);
        	
        	if(entries == null)
        	{
        		map.put(key, new TickEntry[]{entry});
        	}
        	else
        	{
        		TickEntry newEntries[] = new TickEntry[entries.length + 1];
	        	for(int j = 0; j < entries.length; j++)
	        		newEntries[j] = entries[j];
	        	newEntries[entries.length] = entry;
	        	map.put(entry.getPosLong(), newEntries);
        	}
        }
        
        for(TickEntry[] ticks : map.values())
        {
    		String[] text;
    		if(ticks[0].block == null)
    		{
    			text = new String[ticks.length * 3];
	        	for(int i = 0, ti = 0; i < ticks.length; i++)
	        	{
	        		text[ti++] = col +ticks[i].idx;
	        		text[ti++] = "§7"+ticks[i].time;
	        		text[ti++] = "§7"+ticks[i].p;
	        	}
    		}
    		else
    		{
	    		text = new String[ticks.length * 3];
	        	for(int i = 0, ti = 0; i < ticks.length; i++)
	        	{
	        		text[ti++] = col +ticks[i].idx;
	        		text[ti++] = "§7"+ticks[i].action;
	        		text[ti++] = "§7"+ticks[i].param;
	        	}
    		}
    		ASMRender.drawBoxWalls(
    				ticks[0].x, ticks[0].y, ticks[0].z, 
    				ticks[0].x+1f, ticks[0].y+1f, ticks[0].z+1f, 
    				bcolor, 0.12f);

			ASMRender.markBlock(
					text,
					ticks[0].x, ticks[0].y+1.0f, ticks[0].z, 
					bcolor, 0.8f);
        }
	}
	
	public static class TickEntry
	{
		public int idx;
		public int x, y, z;
		public int p;
		public long time;
		public String block;
		public String action;
		public String param;
		
		public TickEntry(NextTickListEntry e)
		{
			this.x = e.position.getX();
			this.y = e.position.getY();
			this.z = e.position.getZ();
			this.p = e.priority;
			this.time = e.scheduledTime;
		}

		public TickEntry(BlockEventData e)
		{
			this.x = e.getPosition().getX();
			this.y = e.getPosition().getY();
			this.z = e.getPosition().getZ();
			block = e.getBlock().getUnlocalizedName();
			if(block.startsWith("tile."))
				block = block.substring(5);
			
			action = "" + e.getEventID() + " ";
			param = "" + e.getEventParameter() + " ";
			
			if(block.contains("note_block") || block.contains("music")) 
			{
				switch(e.getEventID()) {
	            case 0: action += "Harp"; break;
	            case 1: action += "Double Bass"; break;
	            case 2: action += "Snare Drum"; break;
	            case 3: action += "Clicks/Sticks"; break;
	            case 4: action += "Bass Drum"; break;
	            default: action += "Unknown";
				}
				
				param += "[Pitch]";
			}
			
			else if(block.contains("piston")) 
			{
				switch(e.getEventID()) {
		            case 0: action += "Pushing"; break;
		            case 1: action += "Pulling"; break;
		            default: action += "Unknown";
				}
				
				switch(e.getEventParameter()) {
		            case 0: param += "Down"; break;
		            case 1: param += "Up"; break;
		            case 2: param += "South"; break;
		            case 3: param += "West"; break;
		            case 4: param += "North"; break;
		            case 5: param += "East"; break;
		            default: param += "Unknown";
				}
			}
			
	        else if(block.contains("chest") || block.contains("Chest"))
	        {
	        	param += "[Players]";
	        }
		}
		
		public Long getPosLong()
		{
			return Long.valueOf( 
					(((long)x & 0x3FFFFFF) << 38) | 
					(((long)y & 0xFFF)     << 26) | 
					 ((long)z & 0x3FFFFFF) );
		}
	}
}
