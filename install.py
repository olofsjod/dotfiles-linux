import os
import sys
import shutil

def copy_config_files():
    # Copy all config files inside config_files to ~

    confdir = "config_files"
    names = os.listdir(confdir)

    src = os.path.join(os.getcwd(), confdir)
    dst = os.getenv("HOME")
    
    for n in names:
        srcname = os.path.join(src, n)
        dstname = os.path.join(dst, "." + n)

        try:
            if os.path.isdir(srcname):
                shutil.copytree(srcname, dstname)
            else:
                shutil.copy2(srcname, dstname)

            #shutil.copystat(src, dst)
        except:
            print("Unexpected error:", sys.exc_info()[0])

if __name__ == "__main__":
    print("medik's install script as of 2018-04-14 for Fedora Linux")
    copy_config_files()
    
