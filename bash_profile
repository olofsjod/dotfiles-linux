# .bash_profile
# -------------
#
# Executed only during login. 

# Include personal bin folder
PATH=$PATH:~/bin
#cowsay `fortune`  
#uptime 
PS1="[\u@\h \W $] "
source ~/.aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
