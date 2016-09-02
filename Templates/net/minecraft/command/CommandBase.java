package net.minecraft.command;

public abstract class CommandBase implements ICommand
{
    public static void notifyCommandListener(ICommandSender sender, ICommand command, String translationKey, Object... translationArgs) {}
    
    public int compareTo(ICommand compareTo)
    {
        return 0;
    }
}
