#!/usr/bin/env bash

cur_path=`pwd`

echo "Initializing submodules"
git submodule init
git submodule update

# Prepare for cowbells
mkdir -p $cur_path/vim/{colors,autoload}

echo "Deleting the old symlinks"
rm -f {~/.bash_profile,~/.bashrc,~/.vimrc,~/.vim,~/.gvimrc,~/.gitconfig,\
~/.gitignore,~/.githelpers,~/.Xresources,~/.conkyrc,~/.aliases,~/.git-completion.bash}

echo "Symlinking files"
ln -s $cur_path/aliases ~/.aliases
ln -s $cur_path/bash_profile ~/.bash_profile
ln -s $cur_path/bashrc ~/.bashrc
ln -s $cur_path/vimrc ~/.vimrc
ln -s $cur_path/vim ~/.vim
ln -s $cur_path/gvimrc ~/.gvimrc
ln -s $cur_path/gitconfig ~/.gitconfig
ln -s $cur_path/gitignore ~/.gitignore
ln -s $cur_path/githelpers ~/.githelpers
ln -s $cur_path/conkyrc ~/.conkyrc
ln -s $cur_path/Xresources ~/.Xresources
ln -s $cur_path/git-completion.bash ~/.git-completion.bash

echo "Installing plugins to vim"
vim +PluginInstall +qall > /dev/null 2>&1

echo "All done."
