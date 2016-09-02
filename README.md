#ASMTick
by [Cubitect](https://github.com/Cubitect)

ASMTick is a dynamic mod creation tool which assembles a custom tickrate jar-mod for (probably) any newer Minecraft version. It makes use of the assember and disassembler [Krakatau Bytecode Tools by Robert Grosse](https://github.com/Storyyeller/Krakatau).

###Installation
Run the script `install_mod.py` (requires python2.7) and specify the minecraft-jar for which you wish to install the mod, e.g.: 
`python2 install_mod.py ~/.minecraft/versions/1.10/1.10.jar`
The mod can also be installed on servers this way, however support for servers is still in development and based on several hacks.


###Commands
ASMTick provides a `tickrate` command which lets you change the speed at which the game runs.

`/tickrate [rate] [client|server]`
Specifying only `rate` will set the tickrate for both the client and the server.

On servers the mod loosens the sleep-lock between server-ticks in order to process commands sent to the server by players. This feature can be controlled by a more advanced argument:

`/tickrate --server-sleep-lock [ON|OFF|<msec>]`
Turning the server-sleep-lock ON will prevent the server from processing any packets until a tick has finished. Setting it to an integer value will loosen the sleep-lock such that the server checks for packets every `msec` milliseconds.
