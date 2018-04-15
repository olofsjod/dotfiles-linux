import os
import sys
import shutil
import getpass

from optparse import OptionParser
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
            if os.path.isdir(srcname):
                shutil.copytree(srcname, dstname)
            else:
                shutil.copy2(srcname, dstname)

            #shutil.copystat(src, dst)
        except:
            print("Unexpected error:", sys.exc_info()[0])


def create_dnf_install_str():
    prg = ["openafs-client",
           "heimdal-workstation",
           "i3",
           "i3blocks",
           "i3lock",
           "i3status",
           "rofi",
           "conky",
           "redshift",
           "mpd",
           "dunst",
           "pasystray",
           "ncmpcpp",
           "feh",
           "texlive-scheme-full",
           "fwupd",
           "emacs"]

    cmd = "dnf install -y "
    for p in prg:
        cmd += p + " "

    return cmd

if __name__ == "__main__":
    print("medik's install script as of 2018-04-14 for Fedora Linux\n")
    parser = OptionParser()
    parser.add_option("-s", "--install-sw", action="store_true", default=False,
                      help="Install software with dnf", dest="software_install")
    parser.add_option("-c", "--install-configs",
                      action="store_true", default=False,
                      help="Install configs", dest="configs_install")

    (options, args) = parser.parse_args()

    if options.software_install:
        print("Installing default software")
        print("Please enter your sudo password")
        sudo_pw = getpass.getpass()
        
        cmd = create_dnf_install_str()
        command = cmd.split(" ")
        
        p = Popen(['sudo', '-S'] + command, stdin=PIPE, stderr=PIPE,
          universal_newlines=True)
        sudo_prompt = p.communicate(sudo_pw + '\n')[1]
        print(sudo_prompt)
        

    if options.configs_install:
        print("Install configs")        
        copy_config_files()

    
