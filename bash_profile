# .bash_login

# Visar kataloger först, sedan filer. Med färg. 
alias l="ls -lhF --group-directories-first --color"
alias lll="ls -lhF --group-directories-first | less"

# Visar endast gömda filer.
alias la="ls -lAhFd --group-directories-first --color .[^.]*"

alias df="df -hT"
