package villagemarker;
import java.awt.Color;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import net.minecraft.util.math.BlockPos;
import net.minecraft.village.Village;
import net.minecraft.village.VillageDoorInfo;
import asmrender.ASMRender;

public class ASMVillageMarker extends ASMRender
{
    public static final String author      = "Cubitect";
    public static final String name        = "ASMVillageMarker";
    public static final File configFile = new File(name+".conf");
    
    public static boolean doDepthCheck = true;
    public static boolean drawSphere = true;
    public static boolean drawDoorLines = true;
    public static boolean drawBoxEdge = true;
    public static boolean drawBoxWalls = true;
    public static int sphereSegments = 200;
    public static float doorLineWidth = 2.0f;
    public static float sphereDotSize = 3.0f;
    public static float boxEdgeWidth = 2.0f;
    public static float boxEdgeExpansion =  0.006f;
    public static float boxWallExpansion = -0.006f;
    public static float wallAlpha = 0.12f;
    public static Color cols[] = new Color[]{Color.CYAN, Color.MAGENTA, Color.YELLOW, Color.BLUE, Color.GREEN, Color.RED};
    
    public static final ASMVillageMarker INSTANCE = new ASMVillageMarker();
    
	public static void render(double playerX, double playerY, double playerZ)
	{
		try
		{
			if(minecraft.isSingleplayer()) 
			{
				setup(doDepthCheck);
				translate((float)playerX, (float)playerY, (float)playerZ);
				render();
				ASMRender.restore();
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
    public static void render()
    {
        ArrayList<Village> villageList = new ArrayList();
        villageList.addAll(
        		minecraft
        		.getIntegratedServer()
        		.worldServerForDimension(minecraft.thePlayer.dimension)
        		.getVillageCollection()
        		.getVillageList());
        
        int c = 0;
        for(Village village : villageList)
        {
            BlockPos center = village.getCenter();
            float centerX = center.getX();
            float centerY = center.getY();
            float centerZ = center.getZ();
            float radius = village.getVillageRadius();
            ArrayList<VillageDoorInfo> doors = new ArrayList();
            doors.addAll(village.getVillageDoorInfoList());
            
            Color vcol = cols[(c++) % cols.length];
            
            if(drawSphere)
            ASMRender.drawBufferedSphere(
            		centerX, centerY, centerZ, 
            		radius, vcol, sphereDotSize);
            
            if(drawDoorLines)
            for(VillageDoorInfo doorInfo : doors)
            {
            	BlockPos doorPos = doorInfo.getDoorBlockPos();
            	ASMRender.drawLine(
            			centerX, centerY, centerZ,
            			doorPos.getX(), doorPos.getY(), doorPos.getZ(), 
            			vcol, doorLineWidth);
            }
            
            if(drawBoxEdge)
            ASMRender.drawBox(
            		centerX-(8F+boxEdgeExpansion), centerY-(3F+boxEdgeExpansion), centerZ-(8F+boxEdgeExpansion),
            		centerX+(8F+boxEdgeExpansion), centerY+(3F+boxEdgeExpansion), centerZ+(8F+boxEdgeExpansion), 
            		vcol, boxEdgeWidth);
            
            if(drawBoxWalls)
            ASMRender.drawBoxWalls(
            		centerX-(8F+boxWallExpansion), centerY-(3F+boxWallExpansion), centerZ-(8F+boxWallExpansion),
            		centerX+(8F+boxWallExpansion), centerY+(3F+boxWallExpansion), centerZ+(8F+boxWallExpansion), 
            		vcol, wallAlpha);
        }
    }
    
    
    public static void log(String msg)
    {
        String formattedDate = new SimpleDateFormat("HH:mm:ss").format(new Date());
        System.out.println("[" + formattedDate + "] [" + name + "] " + msg);
    }
    
    public ASMVillageMarker()
    {
    	init();
    }
    
	public static void init()
    {
    	if(!configFile.exists())
    		writeOptions();
    	else
    		readOptions();
    	
    	ASMRender.updateSphereBuf(sphereSegments);
    }
    
	private static String col2hex(Color c)
	{
		return '#'+Integer.toHexString((c.getRGB() & 0xffffff) | 0x1000000).substring(1);
	}
	
	private static Color hex2col(String str)
	{
		if(str.startsWith("0x"))
			str = str.substring(2);
		if(!str.startsWith("#"))
			str = "#"+str;
		return Color.decode(str);
	}
	
	public static void writeOptions()
    {
		try 
		{
			PrintWriter writer = new PrintWriter(new FileWriter(configFile));
			writer.println("doDepthCheck="+doDepthCheck);
			writer.println("drawSphere="+drawSphere);
			writer.println("drawDoorLines="+drawDoorLines);
			writer.println("drawBoxEdge="+drawBoxEdge);
			writer.println("drawBoxWalls="+drawBoxWalls);
			writer.println("sphereSegments="+sphereSegments);
			writer.println("doorLineWidth="+doorLineWidth);
			writer.println("sphereDotSize="+sphereDotSize);
			writer.println("boxEdgeWidth="+boxEdgeWidth);
			writer.println("boxEdgeExpansion="+boxEdgeExpansion);
			writer.println("boxWallExpansion="+boxWallExpansion);
			writer.println("wallAlpha="+wallAlpha);
			
			writer.print("colors=["+col2hex(cols[0]));
			for(int i = 1; i < cols.length; i++)
				writer.print(","+col2hex(cols[i]));
			writer.print("]\n");
			
			writer.close();
		} 
		catch(Exception e) 
		{
			log("Couldn't create options file: " + e);
		}
    }
    
	public static void readOptions()
    {
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(configFile));
			String line = null;
            while((line = reader.readLine()) != null) 
            {
                try 
                {
                    String[] opt = line.split("=");
                    if(opt.length < 2 || opt[0].equals("")) {
                    	continue;
                    } 
                    else if(opt[0].equals("doDepthCheck")) {
                    	doDepthCheck = Boolean.parseBoolean(opt[1]);
                    } 
                    else if(opt[0].equals("drawSphere")) {
                    	drawSphere = Boolean.parseBoolean(opt[1]);
                    } 
                    else if(opt[0].equals("drawDoorLines")) {
                    	drawDoorLines = Boolean.parseBoolean(opt[1]);
                    } 
                    else if(opt[0].equals("drawBoxEdge")) {
                    	drawBoxEdge = Boolean.parseBoolean(opt[1]);
                    } 
                    else if(opt[0].equals("drawBoxWalls")) {
                    	drawBoxWalls = Boolean.parseBoolean(opt[1]);
                    } 
                    else if(opt[0].equals("sphereSegments")) {
                    	sphereSegments = Integer.parseInt(opt[1]);
                    } 
                    else if(opt[0].equals("doorLineWidth")) {
                    	doorLineWidth = Float.parseFloat(opt[1]);
                    } 
                    else if(opt[0].equals("sphereDotSize")) {
                    	sphereDotSize = Float.parseFloat(opt[1]);
                    } 
                    else if(opt[0].equals("boxEdgeWidth")) {
                    	boxEdgeWidth = Float.parseFloat(opt[1]);
                    } 
                    else if(opt[0].equals("boxEdgeExpansion")) {
                    	boxEdgeExpansion = Float.parseFloat(opt[1]);
                    } 
                    else if(opt[0].equals("boxWallExpansion")) {
                    	boxWallExpansion = Float.parseFloat(opt[1]);
                    } 
                    else if(opt[0].equals("wallAlpha")) {
                    	wallAlpha = Float.parseFloat(opt[1]);
                    }
                    else if(opt[0].equals("colors")) 
                    {
                    	String colStrList[] = opt[1]
                    			.replaceAll("\\[","")
                    			.replaceAll("\\]","").split(",");
                    	Color cl[] = new Color[colStrList.length];
                    	for(int i = 0; i < colStrList.length; i++)
                    		cl[i] = hex2col(colStrList[i]);
                    	cols = cl;
                    } 
                    else 
                    {
                    	log("Ignoring unrecognized option: "+opt[0]);
                    }
                } 
                catch(Exception e) 
                {
                	log("Skipping bad option value: "+line);
                }
            }
            reader.close();
		} 
		catch(Exception e) 
		{
			log("Couldn't read options file: "+e);
		}
    }
      	
}
