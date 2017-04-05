package structmarker;

import java.awt.Color;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.zip.GZIPInputStream;

import asmrender.ASMRender;

public class ASMStructMarker extends ASMRender
{	
	public static File structDir;
	public static File levelFile;
	public static HashMap<String, StructFType> structMap = new HashMap<String, StructFType>();
	public static long levelModify;
	public static int playerDim;
    
    public static double maxRenderSqDist = 512.0*512.0;
	
	static
	{
		structMap.put("EndCity.dat",    new StructFType(1, Color.MAGENTA));
		structMap.put("Fortress.dat",   new StructFType(-1, Color.RED));
		structMap.put("Mineshaft.dat",  new StructFType(0, Color.GREEN));
		structMap.put("Monument.dat",   new StructFType(0, Color.BLUE));
		structMap.put("Stronghold.dat", new StructFType(0, Color.GRAY));
		structMap.put("Temple.dat",     new StructFType(0, Color.CYAN));
		structMap.put("Village.dat",    new StructFType(0, Color.YELLOW));
	}
	
	public static void init(File worldDir)
	{
		structDir = new File(worldDir.getAbsolutePath() + "/data/");
		levelFile = new File(worldDir.getAbsolutePath() + "/level.dat");
		
		levelModify = 0;
		playerDim = 0;
		
		for(StructFType st : structMap.values())
		{
			st.bbs.clear();
			st.lastModify = 0;
		}
	}
	
	private static int readInt(byte bytes[], int offset) 
	{
		int ret = 0;
		for(int i = 0; i < 4 && i+offset < bytes.length; i++) {
			ret <<= 8;
			ret |= (int)bytes[i+offset] & 0xff;
		}
		return ret;
	}
	
	// read an entire gzipped file to a byte array
	public static byte[] readFile(File file)
	{
		RandomAccessFile raf;
		try 
		{
			raf = new RandomAccessFile(file, "r");
			raf.seek(raf.length() - 4);
			int b4 = raf.read();
			int b3 = raf.read();
			int b2 = raf.read();
			int b1 = raf.read();
			int len = (b1 << 24) | (b2 << 16) | (b3 << 8) | b4;
			raf.close();
			
			byte buf[] = new byte[len];
			
			GZIPInputStream gzis = new GZIPInputStream(new FileInputStream(file));
			
			int r = 0, i;
			while((i = gzis.read(buf, r, buf.length - r)) > 0)
			{
				r += i;
			}
			
			if(r < buf.length)
			{
				System.out.println("File: '" + file.getName() + "' was not fully read!");
			}
			
			gzis.close();
			
			return buf;
		} 
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void updateAll()
	{	
		// find the player dimension
		if(levelFile.exists() && levelFile.lastModified() != levelModify)
		{
			levelModify = levelFile.lastModified();
			byte buf[] = readFile(levelFile);
			byte tag[] = "Dimension".getBytes();
			
			if(buf != null)
			for(int j, i = 0; i < buf.length-tag.length-4; i++) {
				if(buf[i] != 9)
					continue;
				for(j = 0; j < tag.length; j++) {
					if(buf[(++i)] != tag[j])
						break;
				}
				if(j >= tag.length) {
					playerDim = readInt(buf, ++i);
					break;
				}
			}
		}
		
		// read the structure bounding boxes
		for(File file : structDir.listFiles())
		{
            if(!file.isFile())
                continue;
            
			String fnam = file.getName();
			StructFType st = structMap.get(fnam);
			
			if(st == null)
			{
				st = new StructFType(0, Color.LIGHT_GRAY);
				structMap.put(fnam, st);
			}
				
			if(st.lastModify == file.lastModified())
				continue;
			
			st.lastModify = file.lastModified();
			st.bbs.clear();
			
			
			byte buf[] = readFile(file);
			byte tag[] = "\2BB".getBytes();
			
			if(buf == null)
				continue;
			
			for(int j, i = 0; i < buf.length - (4 + 6*4);) {
				if(buf[i++] != 0)
					continue;
				for(j = 0; j < tag.length; j++, i++) {
					if(buf[i] != tag[j])
						break;
				}
				if(j >= tag.length) {
					BB bb = new BB();
					bb.x1 = readInt(buf, i+=4);
					bb.y1 = readInt(buf, i+=4);
					bb.z1 = readInt(buf, i+=4);
					bb.x2 = readInt(buf, i+=4);
					bb.y2 = readInt(buf, i+=4);
					bb.z2 = readInt(buf, i+=4);
					
					st.bbs.add(bb);
				}
			}
		}
	}
	
	

	
	public static void render(double playerX, double playerY, double playerZ)
	{
		try
		{
        	setup(true);
	    	translate((float)playerX, (float)playerY, (float)playerZ);
	    	
	    	for(StructFType st : structMap.values())
	    	{
                if(st.dim != playerDim)
                    continue;
                
                List<BB> bbscpy = new ArrayList(st.bbs);
	    		
		    	for(BB bb : bbscpy)
		    	{
                    double delx = 0.5*(bb.x1 + bb.x2) - playerX;
                    double dely = 0.5*(bb.y1 + bb.y2) - playerY;
                    if(delx*delx + dely*dely > maxRenderSqDist)
                        continue;
                    
		    		final float d = 0.005f;
		    		drawBox(bb.x1-d, bb.y1-d, bb.z1-d, bb.x2+1+d, bb.y2+1+d, bb.z2+1+d, st.col, d/2);
		    	}
	    	}
	    	
	    	ASMRender.restore();
        }
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public static class StructFType
	{
		List<BB> bbs;
		Color col;
		long lastModify;
		int dim;
		
		public StructFType(int dimension, Color color)
		{
			bbs = new ArrayList<BB>();
			col = color;
			dim = dimension;
			lastModify = 0;
		}
	}
	
	public static class BB
	{
		public int x1, y1, z1;
		public int x2, y2, z2;
	}
}
