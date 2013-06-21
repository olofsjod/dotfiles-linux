#!/usr/bin/env bash

cur_path=`pwd`

#echo "initializing submodules"
#git submodule init
#git submodule update

echo "Deleting the old files"
rm ~/.bash_profile
rm ~/.vimrc
rm ~/.vim
rm ~/.gvimrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.githelpers

echo "Symlinking files"
ln -s $cur_path/bash_profile ~/.bash_profile
ln -s $cur_path/vimrc ~/.vimrc
ln -s $cur_path/vim ~/.vim
ln -s $cur_path/gvimrc ~/.gvimrc
ln -s $cur_path/gitconfig ~/.gitconfig
ln -s $cur_path/gitignore ~/.gitignore
ln -s $cur_path/githelpers ~/.githelpers

#echo "Updating submodules"
#git submodule foreach git pull origin master --recurse-submodules

echo "All done."

