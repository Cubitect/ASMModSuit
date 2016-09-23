import sys
import glob
import shutil
import os
from os.path import *
import Tkinter
import tkFileDialog
import tkMessageBox

from asmutils import *
import ASMTick
import ASMVillageMarker
import ASMEventMarker

util = None

top = Tkinter.Tk()
top.wm_title("ASM Installer")

installTick = IntVar()
installVM = IntVar()
installEM = IntVar()
jarpath = StringVar()
instver = StringVar()

installTick.set(1)
installVM.set(1)
installEM.set(1)

def getJarpath():
    global jarpath
    appdata = os.getenv('APPDATA')
    homedir = expanduser("~")
    initdir = None
    if appdata is not None:
        initdir = join(appdata,'.minecraft','versions')
        if not isdir(initdir):
            initdir = None
    if homedir is not None and initdir is None:
        initdir = join(homedir,'.minecraft','versions')
        if not isdir(initdir):
            initdir = join(homedir,'Library','Application Support','minecraft','versions')
            if not isdir(initdir):
                initdir = None
    if initdir is None:
        initdir = curdir
    jarpath.set(tkFileDialog.askopenfilename(
        filetypes=[('jar files','.jar'),('all files', '*')],
        initialdir=initdir,
        title='Installer'))

    if jarpath.get():
        util = Util(jarpath.get())
        instver.set(util.vernam+'-ASM')

def startInstall():
    if not jarpath.get():
        tkMessageBox.showinfo("Info", "Please specify a Minecraft version.")
        return
    if not isfile(jarpath.get()):
        tkMessageBox.showwarning("Warning", "File '"+jarpath.get()+"' does not exist.")
        return

    try:
        util = Util(jarpath.get())
        util.setup()
    except Exception as e:
        tkMessageBox.showerror("Error", "Something went wrong while setting up the directory tree:\n" + str(e))
        return

    if installTick.get() == 1:
        try:
            ASMTick.create_mod(util)
        except Exception as e:
            tkMessageBox.showerror("Error", "Mod 'ASMTick' could not be created.\nView stdout for more information.\n\n" + str(e))
            return

    if installVM.get() == 1:
        try:
            ASMVillageMarker.create_mod(util)
        except Exception as e:
            tkMessageBox.showerror("Error", "Mod 'ASMVillageMarker' could not be created.\nView stdout for more information.\n\n" + str(e))
            return

    if installEM.get() == 1:
        try:
            ASMEventMarker.create_mod(util)
        except Exception as e:
            tkMessageBox.showerror("Error", "Mod 'ASMEventMarker' could not be created.\nView stdout for more information.\n\n" + str(e))
            return

    try:
        util.install(instver.get())
    except Exception as e:
        tkMessageBox.showerror("Error", "Something went wrong while creating the modded version:\n" + str(e))
        return
    tkMessageBox.showinfo("Done!", "Mods installed.")


L1 = Label(top,text="Minecraft version-jar:")\
        .grid(row=0, column=0, pady=4, padx=8, sticky=Tkinter.N+Tkinter.W)
E1 = Entry(top,bd=4,textvariable=jarpath,width=42)\
        .grid(row=1, column=0, pady=4, padx=8, sticky=Tkinter.N)
B1 = Button(top,text="Browse",command=getJarpath)\
        .grid(row=1, column=1, pady=4, padx=8, sticky=Tkinter.E)

L2 = Label(top,text="Mods to install:")\
        .grid(row=2, column=0, pady=4, padx=8, sticky=Tkinter.N+Tkinter.W)
C1 = Checkbutton(top,text="ASM Tick",variable=installTick,onvalue=1,offvalue=0)\
        .grid(row=3, column=0, pady=4, padx=8, sticky=Tkinter.N+Tkinter.W)
C2 = Checkbutton(top,text="ASM Village Marker",variable=installVM,onvalue=1,offvalue=0)\
        .grid(row=4, column=0, pady=4, padx=8, sticky=Tkinter.N+Tkinter.W)
C3 = Checkbutton(top,text="ASM Event Marker",variable=installEM,onvalue=1,offvalue=0)\
        .grid(row=5, column=0, pady=4, padx=8, sticky=Tkinter.N+Tkinter.W)

L3 = Label(top,text="Name of modded version:")\
        .grid(row=6, column=0, pady=4, padx=8, sticky=Tkinter.N+Tkinter.W)
E2 = Entry(top,bd=4,textvariable=instver,width=20)\
        .grid(row=7, column=0, pady=4, padx=8, sticky=Tkinter.N+Tkinter.W)

B2 = Button(top,text="Install",command=startInstall)\
        .grid(row=7, column=1, pady=4, padx=8, sticky=Tkinter.N+Tkinter.E)

top.mainloop()
