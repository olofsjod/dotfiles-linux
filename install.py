import os
import sys
import shutil
import getpass

from subprocess import Popen, PIPE

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
            # Check whether file or directory exists
            if not os.path.isfile(dstname) and not os.path.isdir(dstname):
                if os.path.isdir(srcname):
                    shutil.copytree(srcname, dstname)
                else:
                    shutil.copy2(srcname, dstname)
            else:
                print("Skipping " + n)

            #shutil.copystat(src, dst)
        except:
            print("Unexpected error:", sys.exc_info()[0])


if __name__ == "__main__":
    print("Install configs")
    copy_config_files()
