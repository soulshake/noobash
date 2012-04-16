# export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
# export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
PATH=/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/MacGPG2/bin

# source ~/.bash_profile

# Make the command prompt GREEN
# PS1='\h:\W \u\$ '
 
# Carefully set the current working directory as a classpath
# SET CLASSPATH=%CLASSPATH%:.

############################################
# Obtained from http://osxdaily.com/2011/10/03/add-a-separator-time-stamp-between-terminal-commands-to-increase-readability/
# Modified from emilis bash prompt script
# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
# Modified for Mac OS X by
# @corndogcomputer
# Modified for ME by ME
###########################################


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ REFERENCE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
# Fill with minuses

# (this is recalculated every time the prompt is shown in function prompt_command):

fill="--- "
reset_style='\[\033[00m\]'


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ LINE COLOR (a.k.a status_style) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1 = line color
# .................................1111....
# status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color <== BACKUP
status_style=$reset_style'\[\033[0;35m\]' # purple color




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PROMPT COLOR (a.k.a. prompt_style) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt_style=$reset_style <== BACKUP
prompt_style=$reset_style'\[\033[0;32m\]'





# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TYPING COLOR (a.k.a. command_style) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1=typing color
# ..................................1111.............................................. 
# command_style=$reset_style'\[\033[1;29m\]' # bold black <== BACKUP
command_style=$reset_style'\[\033[1;33m\]' # whitish-yellow




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PROMPT (a.k.a. PS1) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Prompt variable: 
# 3=username; 4=hostname; 5=absolute path
# ..................................................................................3..4..5............................... 
# PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style " <=== BACKUP
PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style "


# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG


# @@@@ TEST @@@@
# CURRENTUSER=`whoami`
# if [ "$CURRENTUSER" = "root" ]; then
#   PS1='\[\033[1;31m\]\u@myhost:\w #\[\033[0m\] '
# else
#   PS1='\u@myhost:\w> '
# fi
# @@@@ endTEST @@@@


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SEPARATOR LINE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function prompt_command {

# create a $fill of all screen width minus the time string and a space:
 
let fillsize=${COLUMNS}-9
fill=""
while [ "$fillsize" -gt "0" ]
do
fill="-${fill}" # fill with underscores/hyphens/tildes to work on
let fillsize=${fillsize}-1
done

# If this is an xterm set the title to user@host:dir

# case "$TERM" in
# xterm*|rxvt*)
# bname=`basename "${PWD/$HOME/~}"`
# echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
# ;;
# *)
# ;;
# esac
}

PROMPT_COMMAND=prompt_command

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ OTHER STUFF ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# export SUDO_PS1="\[\e[33;1;41m\][\u] \w \$\[\e[0m\] " # Trying to make root prompt red



# Tell ls to be colourful
export CLICOLOR=1
# export LSCOLORS=Exfxcxdxbxegedabagacad # Change the colors used by ls

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
# source "`port --prefix grc`/etc/grc.bashrc" #failed attempt at adding Generic Colouriser



# Jeet's thing
## Up Arrow: search and complete from previous history
# bind '"\eOA": history-search-backward'
## alternate, if the above does not work for you:
bind '"\e[A":history-search-backward'

## Down Arrow: search and complete from next history
# bind '"\eOB": history-search-forward'
## alternate, if the above does not work for you:
bind '"\e[B":history-search-forward'
