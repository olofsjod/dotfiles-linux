dotfiles
========

This repo is a collection of my dotfiles that I want to share (actually no, I just backup it here).
Let it inspire you or fork it. Do not attempt to run this program as root (and you shouldn't do it either way).

Install
-------

You can install my dotfiles by running the following command:

```
./setup.sh install
```

The program will not overwrite your dotfiles, if you have existing dotfiles then it will backup it to {the-dotfile-in-question}.bak. 

Usage
-----
It's not that complicated to add a dotfile on your own. Put the file (without a dot) in the same folder as setup.sh and add the name of the file in the array dotfiles who is in the setup.sh script. You can see the pattern by looking for how I added my other dotfiles.
And lastly rerun ./setup.sh install.

###Example
```
mv ~/.foo bar/dotfiles/foo
sed -i -e 's%declare -a dotfiles=\(.*\)".*$%declare -a dotfiles=\1" "foo")%' bar/dotfiles/setup.sh
cd bar/dotfiles
./setup.sh install

```



Uninstall
---------

Uninstallation is easy, run the command 
```
./setup.sh uninstall
```
and it should remove all symlinks to the dotfiles.
