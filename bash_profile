#------------------------------------------------------------------------------------------
# THIS IS MY BASH PROFILE.
# THERE ARE MANY LIKE IT BUT THIS ONE IS MINE.
#------------------------------------------------------------------------------------------

export PATH=$HOME/bin:/bin:/opt/local/bin:/opt/local/sbin:/sbin:/usr/X11/bin:/usr/bin:/usr/local/MacGPG2/bin:/usr/local/bin:/usr/sbin:$PATH


#------------------------------------------------------------------------------------------
# ALIASES
#------------------------------------------------------------------------------------------


# GWHOIS: Use Gandi's whois
alias gwhois='whois -h whois.gandi.net'


# alias aliases='xterm -e vim ~/.bash_aliases;reload'
alias reload='. ~/.bash_profile'


# Don't do something you regret.
alias rm='rm -i' 
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -v'
# alias echo -e ${PATH//:/\\n}
# alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}' # I don't even...?




# Move up directories more easily
alias ..='cd ..' 
alias ...='cd ../..' 
alias ....='cd ../../..'
alias .....='cd ../../../..'



#------------------------------------------------------------------------------------------
# FUNCTIONS
#------------------------------------------------------------------------------------------

# Reverse DNS lookup without having to retype the IP
function rhost () {
	host $1|head -1|cut -d ' ' -f 4|xargs host
}

# host $(dig squirrel.li +short)


function extract() # Handy Extract Program. 
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2) tar xvjf $1 ;;
             *.tar.gz) tar xvzf $1 ;;
             *.bz2) bunzip2 $1 ;;
             *.rar) unrar x $1 ;;
             *.gz) gunzip $1 ;;
             *.tar) tar xvf $1 ;;
             *.tbz2) tar xvjf $1 ;;
             *.tgz) tar xvzf $1 ;;
             *.zip) unzip $1 ;;
             *.Z) uncompress $1 ;;
             *.7z) 7z x $1 ;;
             *) echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}



#------------------------------------------------------------------------------------------
#  LINE COLOR (a.k.a status_style)
#------------------------------------------------------------------------------------------

# 1 = line color
# .................................1111....
# status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color <== BACKUP
status_style=$reset_style'\[\033[0;35m\]' # purple color



#------------------------------------------------------------------------------------------
#  PROMPT COLOR (a.k.a. prompt_style)
#------------------------------------------------------------------------------------------

# prompt_style=$reset_style <== BACKUP
prompt_style=$reset_style'\[\033[0;32m\]'


#------------------------------------------------------------------------------------------
#  TYPING COLOR (a.k.a. command_style)
#------------------------------------------------------------------------------------------

# 1=typing color
# ..................................1111.............................................. 
# command_style=$reset_style'\[\033[1;29m\]' # bold black <== BACKUP
command_style=$reset_style'\[\033[1;33m\]' # whitish-yellow


#------------------------------------------------------------------------------------------
#  PROMPT (a.k.a. PS1)
#------------------------------------------------------------------------------------------

# Prompt variable: 
# 3=username; 4=hostname; 5=absolute path
# ..................................................................................3..4..5............................... 
# PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style " <=== BACKUP
PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style "


# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG


#------------------------------------------------------------------------------------------
#  SEPARATOR LINE
#------------------------------------------------------------------------------------------

# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):

fill="--- "
reset_style='\[\033[00m\]'

function prompt_command {
# create a $fill of all screen width minus the time string and a space:
	let fillsize=${COLUMNS}-9
	fill=""
	while [ "$fillsize" -gt "0" ]
	do
	fill="-${fill}" # fill with underscores/hyphens/tildes to work on
	let fillsize=${fillsize}-1
	done
}

PROMPT_COMMAND=prompt_command


#------------------------------------------------------------------------------------------
# INCREMENTAL HISTORY SEARCH (?)
# "Add this to your .bashrc and you will be very happy" by Jeet
#------------------------------------------------------------------------------------------

## Up Arrow: search and complete from previous history
# bind '"\eOA": history-search-backward'
## alternate, if the above does not work for you:
bind '"\e[A":history-search-backward'

## Down Arrow: search and complete from next history
# bind '"\eOB": history-search-forward'
## alternate, if the above does not work for you:
bind '"\e[B":history-search-forward'
# Hat tip to http://osxdaily.com/2011/10/03/add-a-separator-time-stamp-between-terminal-commands-to-increase-readability/

#------------------------------------------------------------------------------------------
#  OTHER STUFF
#------------------------------------------------------------------------------------------

# Tell ls to be colourful
export CLICOLOR=1
# export LSCOLORS=Exfxcxdxbxegedabagacad # Change the colors used by ls

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
# source "`port --prefix grc`/etc/grc.bashrc" #failed attempt at adding Generic Colouriser


# Carefully set the current working directory as a classpath
# SET CLASSPATH=%CLASSPATH%:.


if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi




#------------------------------------------------------------------------------------------
# COLOR REFERENCE
#------------------------------------------------------------------------------------------


# Define some colors first:
red='\e[0;31m' 
RED='\e[1;31m' 
blue='\e[0;34m' 
BLUE='\e[1;34m' 
cyan='\e[0;36m' 
CYAN='\e[1;36m'
NC='\e[0m'              # No Color


DARKGRAY='\e[1;30m' 
LIGHTRED='\e[1;31m' 
GREEN='\e[32m' 
YELLOW='\e[1;33m' 
LIGHTBLUE='\e[1;34m' 
# NC='\e[m'


# For example:
# PS1="\n$GREEN[\w] \n$DARKGRAY($PCT\t$DARKGRAY)-($PCT\u$DARKGRAY)-($PCT\!
# $DARKGRAY)$YELLOW-> $NC"

# Source: http://tldp.org/LDP/abs/html/sample-bashrc.html

#    Black       0;30     Dark Gray     1;30
#    Blue        0;34     Light Blue    1;34
#    Green       0;32     Light Green   1;32
#    Cyan        0;36     Light Cyan    1;36
#    Red         0;31     Light Red     1;31
#    Purple      0;35     Light Purple  1;35
#    Brown       0;33     Yellow        1;33
#    Light Gray  0;37     White         1;37
#
#    \u - Username. The original prompt also has \h, which prints the host name.
#    \w - Current absolute path. Use \W for current relative path.
#    \$ - The prompt character (eg. '#' for root, '$' for regular users). 
#    start coloring: \[\e[color\]
#    end coloring: \[\e[m\])
#
#    \[ - what follows are non-printing characters, so they aren't counted for line-wrap purposes
#    \e[ - the start of an escape sequence, to set the colors
#    33;1;41m - the actual color string, to create bold yellow text on a red background
#    \] - the end of the non-printing characters
#    [\u] \w \$ - the user name in brackets, followed by the directory and the # symbol
#    \[\e[0m\] - another non-printing sequence; this one sets the colors back to the defaults, so only the prompt is yellow-on-red
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


