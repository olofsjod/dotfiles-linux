# .bash_profile
# -------------
#
# Executed only during login. 

# Makes xterm transparent
[ -n "$XTERM_VERSION" ] && transset 0.8 -a >/dev/null

cowsay `fortune`  

uptime 
source ~/.aliases
