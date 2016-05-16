"""
cleaning my home folder from links to this folder
"""

import os
import os.path

def getSymlinksFromHome():
    home = os.environ['HOME']
    ret = []
    for f in os.scandir(home):
        if f.is_symlink():
            ret.append(f)
    return ret 

def filterSymlinks(onlyThisDir, symlinks):
    ret = []
    for sym in symlinks:
        realize = os.path.realpath(sym.path)
        realize = realize.split("/")
        otdArr = onlyThisDir.split("/")

        isTheChoosenOne = True
        for i in range(len(otdArr)):
            if not otdArr[i] == realize[i]:
                isTheChoosenOne = False
                break

        if isTheChoosenOne:
            ret.append(sym)
            searchForTheChoosenOne = False
    return ret

def removeSymlinks(symlinks):
    for f in symlinks:
        os.unlink(f.path)
            
def main():
    symlinks = getSymlinksFromHome()
    filteredSymlinks = filterSymlinks('/home/medik/dev/dotfiles', symlinks)
    removeSymlinks(filteredSymlinks)

main()
