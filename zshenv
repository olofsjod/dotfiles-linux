typeset -U path
path=(~/bin $path)
EDITOR=vim

DOTFILES_HOME=$HOME/dev/dotfiles
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
