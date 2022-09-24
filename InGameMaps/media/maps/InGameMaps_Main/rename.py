from os import listdir
import os
from os.path import isfile, join
import pathlib
import re

mypath = pathlib.Path(__file__).parent.absolute()
onlyfiles = [f for f in listdir(mypath) if (isfile(join(mypath, f)) and ('.lotheader' in f or '.bin' in f or '.lotpack' in f))]
print(onlyfiles)

for i in onlyfiles:
    split=i.replace('.', '_').split('_')
    final=''
    if len(split) == 3:
        split[0]=str(int(split[0])+2)
        split[1]=str(int(split[1])+68)
        final=split[0]+'_'+split[1]+'.'+split[2]
    elif len(split) == 4:
        split[1]=str(int(split[1])+2)
        split[2]=str(int(split[2])+68)
        final=split[0]+'_'+split[1]+'_'+split[2]+'.'+split[3]
    os.rename(join(mypath, i), join(mypath, final))
