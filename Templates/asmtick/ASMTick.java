package asmtick;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ASMTick
{
    private static final String author      = "Cubitect";
    private static final String name        = "ASMTick";
    private static final String build       = "001";
    private static final String versionName = "0.1";
    private static final String versionType = "main";
    private static final String mcVersion   = "1.7+";
    private static final String mcType      = "Dynamic";
    
    // 'isRemoteServer' is set to true for servers during assembly 
    public static boolean isRemoteServer = false; 
    public static final long maxTickTime = Long.MAX_VALUE;
    public static boolean sleepLock = false;
    public static long maxSleep = (isRemoteServer) ? 50L : maxTickTime;
    
    public static float tickrateClient = 20F;
    public static float tickrateServer = 20F;
    public static long ms2Tick = 50L;
    public static long serverOverloadWarnTicks = 2000L;
    
    public static boolean interruptTick = false;
    
    /** Temporary Variables: Do not touch! **/
    public static boolean doOnlyQueue = false;

    public static void setTickServer(float tickspeed)
    {
        tickrateServer = tickspeed;
        serverOverloadWarnTicks = (long)(tickrateServer*200L);
        if(tickrateServer <= 0) {
            ms2Tick = maxTickTime;
        } else {
            ms2Tick = (long)(1000F / tickrateServer);
        }
    }
    
    
    public static void setTickClient(float tickspeed)
    {
        float f = 0;
        tickrateClient = tickspeed;
        // Minecraft set-timer bytecode is dynamically inserted here
    }
    
    public static long serverSleep(long ms) 
    {
        long j = 0;
        
        do {
            try {
                Thread.sleep(1L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            j++;
        } while (j < ms2Tick-ms && j <= maxSleep && !interruptTick);
        
        if(interruptTick)
            log("Server sleep interrupted.");
        
        else if(j >= maxSleep && !sleepLock)
            interruptTick = true;
        
        return j;
    }
    
    public static void chatTrigger(String rawCommand)
    {
        interruptTick = true;
    }
    
    public static void chatPacketRecieved(String chat)
    {
        if(isRemoteServer)
            return;
        if(chat.matches("§eServer tickrate = [.0-9]+\n§eClient tickrate = [.0-9]+"))
        {
            Pattern p = Pattern.compile("[.0-9]+");
            Matcher m = p.matcher(chat);
            m.find();
            float tickServer = CommandTickrate.parseFloat(m.group());
            if(tickServer >= 0) setTickServer(tickServer);
            m.find();
            float tickClient = CommandTickrate.parseFloat(m.group());
            if(tickClient >  0) setTickClient(tickClient);
        }
    }
    
    
    public static void log(String msg)
    {
        String formattedDate = new SimpleDateFormat("HH:mm:ss").format(new Date());
        System.out.println("[" + formattedDate + "] [" + name + "] " + msg);
    }
}


