# dotfiles

## Why this is needed

This is a repository of my prefered configuration files. It is easy to
organize my dotfiles into categories. I don't need any fancy bootstrap script,
and it fits my needs.

### Features
* Easy organization of my dotfiles
* Automatically downloads and installs Vundle + other plugins to Vim
* It just works

## Installation
Install it by cloning this repo into your preferred folder (don't move around
the folder if you want this to work...)

After you cloned this repo. Please run `./bootstrap.sh` to install all dotfiles
kept in `confs/` and `/include`.  And that's it.

## Usage
There are two folders: `confs/` and `include/`. In `confs/` you can organize your
single textfiles that should be in $HOME. However, this script won't search for
folders in there. This is the reason why `include/` come in handy. Drop those 
folders into `include/`.

## Licence
[Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA
4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)


