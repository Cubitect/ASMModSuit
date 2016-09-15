import zipfile
import subprocess
import shutil
import os
from os.path import *
from Tkinter import *

class Util:
    def __init__(self,jarpath):
        self.jarpath = jarpath
        self.jardir, self.jarfile = split(self.jarpath)
        self.vernam = splitext(self.jarfile)[0]
        if 'server' in self.vernam:
            self.side = 'server'
        else:
            self.side = 'client'

        self.curdir = abspath(curdir)
        self.asmdir = join(self.curdir, 'cache', self.vernam, 'jarasm')
        self.modjdir = join(self.curdir, 'cache', self.vernam, 'modasm')
        self.modcdir = join(self.curdir, 'cache', self.vernam, 'mod')
        self.classdir = join(self.curdir, 'cache', self.vernam, 'classes')
        self.temdir = join(self.curdir, 'Templates')

        try:
            fdevnull = open(os.devnull)
            subprocess.Popen(['python2','--version'], stdout=fdevnull, stderr=fdevnull).communicate()
            self.python2 = 'python2'
        except OSError as e:
            if e.errno == os.errno.ENOENT:
                self.python2 = 'python'

        self.disasmpy = self.python2+' '+join(self.curdir,'Krakatau-master','disassemble.py')
        self.asmpy = self.python2+' '+join(self.curdir,'Krakatau-master','assemble.py')

    def setup(self):
        print 'Preparing directory tree for '+self.side+'...'

        if isdir(self.modjdir):
            shutil.rmtree(self.modjdir)
        os.makedirs(self.modjdir)
        if isdir(self.modcdir):
            shutil.rmtree(self.modcdir)
        os.makedirs(self.modcdir)
        if not isdir(self.classdir):
            os.makedirs(self.classdir)
        zipref = zipfile.ZipFile(self.jarpath,'r')
        zipref.extractall(self.classdir)
        zipref.close()
        metadir = join(self.classdir,'META-INF')
        if self.side == 'client' and isdir(metadir):
            shutil.rmtree(metadir)

    def disasm(self,className):
        outf = join(self.modjdir,className)+'.j'
        if isfile(outf):
            return outf
        outf = join(self.asmdir,className)+'.j'
        if isfile(outf):
            return outf
        print 'Disassembling ' + className + '...'
        os.system(self.disasmpy+' -out '+self.asmdir+' '+join(self.classdir,className)+'.class > '+os.devnull)
        return outf

    def install(self,instver):
        # create the mod
        print 'Reassembling the modded classes...'
        os.system(self.asmpy+' -out '+self.modcdir+' -r -q '+self.modjdir)

        # install the mod
        copytree(self.modcdir,self.classdir)
        instdir = self.jardir.replace(self.vernam,instver)
        instjar = join(instdir,instver+'.jar')
        print 'Installing mod to: '+instdir
        if not isdir(instdir):
            os.makedirs(instdir)
        instzip = shutil.make_archive(instjar,format="zip",root_dir=self.classdir)
        if isfile(instjar):
			os.remove(instjar)
        os.rename(instzip,instjar)

        oldjson = join(self.jardir,self.vernam+'.json')
        if(isfile(oldjson) and self.side == 'client'):
            newjson = join(instdir,instver+'.json')
            with open(newjson,'w') as fout:
                with open(oldjson,'r') as fin:
                    for line in fin:
                        if '"id":' in line:
                            line = line.replace(self.vernam,instver)
                        if '"assets":' in line:
                            fout.write(line)
                            line = next(fin)
                            fout.write(line)
                            bracketCnt = 1
                            while bracketCnt > 0:
                                line = next(fin)
                                if line is None:
                                    break
                                if '{' in line:
                                    bracketCnt += 1
                                if '}' in line:
                                    bracketCnt -= 1
                        if '"type": "snapshot"' in line:
                            line = line.replace('snapshot','release')
                        fout.write(line)

def copytree(root_src_dir, root_dst_dir):
    for src_dir, dirs, files in os.walk(root_src_dir):
        dst_dir = src_dir.replace(root_src_dir, root_dst_dir, 1)
        if not os.path.exists(dst_dir):
            os.makedirs(dst_dir)
        for file_ in files:
            src_file = os.path.join(src_dir, file_)
            dst_file = os.path.join(dst_dir, file_)
            if os.path.exists(dst_file):
                os.remove(dst_file)
            shutil.copy(src_file, dst_file)

def findOps(lines,start,oplist):
    for n, l in enumerate(lines[start:]):
        if all(x in l for x in oplist[0]):
            for j in range(0,len(oplist)):
                l = lines[start+n+j]
                if any(x not in l for x in oplist[j]):
                    break
                if j >= len(oplist)-1:
                    return start+n+j

def goBackTo(lines,start,opline):
    for n, l in enumerate(reversed(lines[:start])):
        if all(x in l for x in opline):
            return start-n-1

def endw(line,fromEnd):
    return line.rsplit(' ',fromEnd+1)[-fromEnd-1]

def lnum(line):
    return line.split(' ',1)[0]

def betweenr(s,pre,post):
    try:
        end = s.rindex(post)
        start = s[:end].rindex(pre) + len(pre)
        return s[start:end]
    except ValueError:
        print 'Warning: "' + s[:-1] + '" does not contain the bounds ["' + pre + '","' + post + '"]'
        return None

def betweenl(s,pre,post):
    try:
        start = s.index(pre) + len(pre)
        end = s.index(post,start)
        return s[start:end]
    except ValueError:
        print 'Warning: "' + s[:-1] + '" does not contain the bounds ["' + pre + '","' + post + '"]'
        return None
