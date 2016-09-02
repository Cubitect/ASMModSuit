import java.util.List;

import net.minecraft.command.CommandBase;
import net.minecraft.command.ICommandSender;
import net.minecraft.command.ICommand;
import net.minecraft.server.MinecraftServer;

public class CommandTickrate extends CommandBase
{
    public String getCommandName()
    {
        return "tickrate";
    }

    public int getRequiredPermissionLevel()
    {
        return 2;
    }

    public String getCommandUsage(ICommandSender sender)
    {
        return "/tickrate [rate] [client|server]";
    }
    
    public void execute(MinecraftServer server, ICommandSender sender, String[] args)
    {
        processCommand(sender, args);
    }

    public void processCommand(ICommandSender sender, String[] args)
    {
        if(args.length < 1) {
            notify(sender, "\u00A7eServer tickrate = " + ASMTick.tickrateServer + "\n" + 
                           "\u00A7eClient tickrate = " + ASMTick.tickrateClient);
            return;
        } else {
            if(args[0].equals("--server-sleep-lock") || args[0].equals("-l")) {
                if(args.length >= 2) {
                    if(args[1].equals("ON") || args[1].equals("on")) {
                        ASMTick.sleepLock = true;
                    } else if(args[1].equals("OFF") || args[1].equals("off")) {
                        ASMTick.sleepLock = false;
                        ASMTick.maxSleep = 50L;
                    } else try {
                        long maxSleep = Long.parseLong(args[1]);
                        ASMTick.maxSleep = maxSleep;
                        ASMTick.sleepLock = false;
                    } catch (NumberFormatException e) {
                        notify(sender, "\u00A7cSleep lock must be ON, OFF or an integer value");
                        return;
                    }
                }
                
                if(ASMTick.sleepLock) {
                    notify(sender, "Sleep lock: \u00A7aON\u00A77 (Pocessing no packets between ticks)");
                } else {
                    notify(sender, "Sleep lock: \u00A7cOFF\u00A77 (Processing packets every "+ASMTick.maxSleep+" ms)");
                }
                return;
            }
            
            float tickrate = parseFloat(args[0]);
            if(tickrate < 0F) {
                notify(sender, "\u00A7cTickrate should be a non-negative floating point number");
                return;
            }
            
            if(args.length < 2) {
                ASMTick.setTickServer(tickrate);
                ASMTick.setTickClient(tickrate);
                notify(sender, "Tickrate set to " + tickrate);
            } else if(args[1].equals("client") || args[1].equals("CLIENT") || args[1].equals("c") || args[1].equals("C")) {
                ASMTick.setTickClient(tickrate);
                notify(sender, "Client tickrate set to " + tickrate);       
            } else if(args[1].equals("server") || args[1].equals("SERVER") || args[1].equals("s") || args[1].equals("S")) {
                ASMTick.setTickServer(tickrate);
                notify(sender, "Server tickrate set to " + tickrate);
            } else {
                notify(sender, "Invalid argument: " + args[1]);
            }
            
            if(ASMTick.isRemoteServer) {
                notify(sender, "\u00A7eServer tickrate = " + ASMTick.tickrateServer + "\n" + 
                               "\u00A7eClient tickrate = " + ASMTick.tickrateClient);
            }
        }
    }
    
    public void notify(ICommandSender sender, String msg)
    {
        if(sender != null)
            notifyCommandListener(sender, this, msg);
    }
    
    public static float parseFloat(String input)
    {
        try {
            return (float)Double.parseDouble(input);
        } catch (NumberFormatException e) {
            return -1F;
        }
    }
}

