#ASM Mod Suit
ASM Mod Suit by [Cubitect](https://github.com/Cubitect) [[YouTube]](https://www.youtube.com/channel/UC1VmvHvATdD9ZkR1-rpoMeA) is a dynamic mod creation tool and installer. It assembles custom jar-mods for any newer Minecraft version, using the assembler and disassembler [Krakatau Bytecode Tools by Robert Grosse](https://github.com/Storyyeller/Krakatau). 

There are two installable mods currently:

| Mod              | MC versions | Description                                           |
| ---------------- | ----------- | ----------------------------------------------------- |
| ASMTick          | 1.7+        | Allows you to change the speed at which the game runs |
| ASMVillageMarker | 1.8+        | Highlights villages in the world                      |

###Requirements
Python 2.7

###Installation
To install the any of the mods, simply download (or clone) this repository and run the `install.py` script, i.e.:

`python2 install.py`. 

This will open a basic GUI interface, where you can browse for the minecraft version jar-file for which you want to install the mods. Then select the mods you want to install, and the name of the new modded copy. Finally press "install" and wait until you get the "Done" popup.


#ASMTick
ASMTick is a simple tickrate mod. The idea for this mod is based on the [Tickspeed mod](https://www.youtube.com/watch?v=OMYWfjgaaMM) by [Panda4994](https://www.youtube.com/channel/UCzVkOGiIFUY47sWqMy7A4tA).

This mod can also be installed on servers, however support for servers is still in development and based on several hacks.


###Commands
ASMTick provides a `tickrate` command which lets you change the speed at which the game runs.

`/tickrate [rate] [client|server]`

Specifying only `rate` will set the tickrate for both the client and the server.

On servers the mod loosens the sleep-lock between server-ticks in order to process commands sent to the server by the player. This feature can be controlled by a more advanced argument:

`/tickrate --server-sleep-lock [ON|OFF|<msec>]`

Turning the server-sleep-lock ON will prevent the server from processing any packets until a tick has finished. Setting it to an integer value will loosen the sleep-lock such that the server checks for packets every `msec` milliseconds.


#ASMVillageMarker
ASMVillageMarker is a client-only mod which highlights village radii and golem spawning areas. The idea of this mod is based on [KaboPC](https://www.youtube.com/user/KaboPC)'s [Village Marker Mod](http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/1288327-village-marker-mod).

###Config Options
A config file called `ASMVillageMarker.conf` will be created in your minecraft direcory when you start up the game and enter a world.


