# This file is sourced only for login shells (i.e. shells
# invoked with "-" as the first character of argv[0], and
# shells invoked with the -l flag.)
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#
# Check for updates
source $DOTFILES_HOME/updatecheck.sh
source /usr/local/bin/virtualenvwrapper.sh
cowthink -f bong `fortune`
