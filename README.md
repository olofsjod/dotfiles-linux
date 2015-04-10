dotfiles
--------

This repo is a collection of my dotfiles that I want to share (actually no, I just backup it here).
Let it inspire you or fork it. Do not attempt to run this program as root (and you shouldn't do it either way).

Install
-------

You can install my dotfiles by running the following command:

```
./setup.sh install
```

The program will not overwrite your dotfiles, if you have existing dotfiles then it will backup it to {the-dotfile-in-question}.bak. 

Uninstall
---------

Uninstallation is easy, run the command 
```
./setup.sh uninstall
```
and it should remove all symlinks to the dotfiles.
