# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###################################  End of orignal ~/.bashrc ##################
source ~/.bash_dmstack.sh







##==============================================================================
#    Mac => Ubuntu
# 1) .bash_profile => .bashrc
# 2) open => xdg-open  or nautilus
# 3) pbcopy => xsel --clipboard --input
# 4) pbpaset => xsel --clipboard --output
##==============================================================================


# Source this file
alias sb='source ~/.bashrc; clear'
alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"
function del () { mv  $@ ~/.Trash/; }
function pyh () { python  $1 -h; }


alias open='nautilus'


# Show promt name
export PS1='$(whoami)@${PWD/*\//}:'






##==============================================================================
# List
##==============================================================================
# di = directory, ex=executable
export LS_COLORS=$LS_COLORS:"di=1;4;30":"fi=34":"ex=4;31":"*.c=01;35":"*.py=01;35"
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'






##==============================================================================
# Change Directory
##==============================================================================
alias .2='cd ../'
alias .3='cd ../../'
alias .4='cd ../../../'
alias .5='cd ../../../../'
alias .6='cd ../../../../../'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'


alias cdtmp='cd ~/Temp; ls'
alias cdd='cd ~/Dropbox'
alias cdn='cd ~/Downloads'



##==============================================================================
# Copy and Backup
##==============================================================================
alias cppath='echo $PWD | xsel --clipboard --input '
alias cdpath='cd $(xsel --clipboard --output)'
alias cpw='echo $PWD | xsel --clipboard --input'
alias ppw='cd $(xsel --clipboard --output)'

alias cpb='cp -v ~/.bashrc ~/Dropbox/Recent/bash/bashrc_ubuntu.sh;pwd'
alias cpv='cp -v ~/.vimrc ~/Dropbox/Recent/vim/vimrc_ubuntu.txt;pwd'

alias cpconfa='clear; cp -v ~/.atom/snippets.cson ~/Dropbox/Recent/atom/atom_ubuntu_snippets.cson;'\
'cp -v ~/.atom/init.coffee  ~/Dropbox/Recent//atom_ubuntu_init.coffee;'\
'cp -v ~/.atom/keymap.cson  ~/Dropbox/Recent/atom/atom_ubuntu_keymap.cson;'\
'cp -v ~/.atom/custom_entries_bhishan.json  ~/Dropbox/Recent/atom/atom_ubuntu_custom_entries_bhishan.json;'\
'cp -v ~/.atom/custom_entries.json  ~/Dropbox/Recent/atom/atom_ubuntu_custom_entries.json;'\
'cp -v ~/.atom/config.cson ~/Dropbox/Recent/atom/atom_ubuntu_config.cson; pwd'

alias cpj='clear; cp -v ~/Research/a4_jedisim/jedisim/jedisim.py ~/Dropbox/Recent/jedisim/jedisim_ubuntu.py;'\
'cp -v ~/Research/a4_jedisim/jedisim/run_jedisim.py ~/Dropbox/Recent/jedisim/run_jedisim_ubuntu.py; pwd'
alias cdj='clear; cd ~/Research/a4_jedisim/jedisim/; ls; pwd'






##==============================================================================
## open Programs
##==============================================================================
alias oepn='open'
alias opena='gedit ~/Temp/a.txt &'
alias openb='gedit ~/.bashrc &'
alias openv='gedit ~/.vimrc &'

# alias catb='cat ~/.bashrc'
alias catb='pygmentize ~/.bashrc'
alias vib='vim ~/.bashrc'
# alias opencron='open ~/bin/mycrontab.sh'

alias openmd='gedit ~/Temp/a.md &'
alias opentxt='gedit ~/Temp/a.txt &'
alias openpy='gedit ~/Temp/a.py &'
alias openc='gedit ~/Temp/a.c &'
alias ggl='xdg-open http://google.com &'






##==============================================================================
# Mac like copy paste
# Needs: sudo apt install xsel
##==============================================================================
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'





##==============================================================================
# Python
# Checking: python --version
##==============================================================================
alias py='/home/bhishan/anaconda2/envs/lsst/bin/python'
alias py2='/usr/bin/python'
alias py3='/usr/bin/python3'








##==============================================================================
# rsync
##==============================================================================
alias rsync='rsync -azvu --progress '







##==============================================================================
# pygmentize
##==============================================================================
alias pyg='pygmentize'
alias pcat="pygmentize -f terminal256 -O style=autumn -g" # native bad4 makefile
alias ccat="pygmentize -g -O style=colorful,linenos=1" # native bad4 makefile








##==============================================================================
# Personnal Aliases
##==============================================================================
alias mkdir='mkdir -p'
alias rmr='rm -rv'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'   # Assumes LPDEST is defined
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias background='xv -root -quit -max -rmode 5'    # Put a picture in bkg
alias path='echo -e ${PATH//:/\\n}'  # echo $(PATH) with new lines
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias vi='vim'
alias lprc='vim -me -c ":syntax on" -c ":hardcopy" -c ":q"'
alias c='clear'
alias cls='clear; ls -GFS'






##==============================================================================
# wget   r = recursive l1=level-1 nd=no-directories-all-in-one
##==============================================================================
# example: wpdf http://ciml.info
# -c resumes downloads from previous time.
alias wget='wget -c '
alias wpdf='wget -r l1 -nd -nc -A.pdf '





#===================================================
# vim
#==================================================
alias viv='vim ~/.vimrc'








##==============================================================================
## Bash Examples
##=============================================================================
function abc {
pygmentize <<EOF
#example of if else in bash:
#===========================
function abc() { if [ $1 = "code" ];
  then echo $1;
else
  echo "You did not type code.";
  echo "Please try again.";
fi
}
EOF
}
function bashtips {
cat <<EOF
DIRECTORIES
-----------
~-      Previous working directory
pushd tmp   Push tmp && cd tmp
popd        Pop && cd

GLOBBING AND OUTPUT SUBSTITUTION
--------------------------------
ls a[b-dx]e Globs abe, ace, ade, axe
ls a{c,bl}e Globs ace, able
\$(ls)      \`ls\` (but nestable!)

HISTORY MANIPULATION
--------------------
!!      Last command
!?foo       Last command containing \`foo'
^foo^bar^   Last command containing \`foo', but substitute \`bar'
!!:0        Last command word
!!:^        Last command's first argument
!\$     Last command's last argument
!!:*        Last command's arguments
!!:x-y      Arguments x to y of last command
C-s     search forwards in history
C-r     search backwards in history

LINE EDITING
------------
M-d     kill to end of word
C-w     kill to beginning of word
C-k     kill to end of line
C-u     kill to beginning of line
M-r     revert all modifications to current line
C-]     search forwards in line
M-C-]       search backwards in line
C-t     transpose characters
M-t     transpose words
M-u     uppercase word
M-l     lowercase word
M-c     capitalize word

COMPLETION
----------
M-/     complete filename
M-~     complete user name
M-@     complete host name
M-\$        complete variable name
M-!     complete command name
M-^     complete history
EOF
}








##==============================================================================
# Python
##==============================================================================
function py() {
    clear
    python $*
    rm -rf __pycache__
    rm -rf *.pyc
    rm -rf */__pycache__
    rm -rf */*.pyc
    }








# Convert all ptyhon scripts from py2 to py3
# Usage: my2to3 hello.py
function my2to3() { for f in *.py; do 2to3 -w $f && rm -rf $f.bak ; done;}








# Print docstrig of a python script
# Usage: pyd hello.py
function pyd() {
    python -c """import ${1%%.*};print(${1%%.*}.__doc__)""" ;
    }









##==============================================================================
## Custom functions
##==============================================================================
# pyc "exp(5) + exp(6)"
function pyc() { python -c """from math import *; print($*)"""  ;}
function bcl() { bc -l <<< "$*"  ;}
function cds () { cd *$1*; pwd; ls; }
function mkcd () { mkdir -p $1; cd $1; }
function topen () { touch "$1" && xdg-open "$1"; }
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
function makezip() { zip -r "${1%%/}.zip" "$1" ; }









# extract files
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}










# uptime
function myuptime () {
  uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
  return;
}










# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* ./*;
  fi;
}








# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
# Usage: cat a.json | json
function json() {
  if [ -t 0 ]; then # argument
    python -mjson.tool <<< "$*" | pygmentize -l javascript;
  else # pipe
    python -mjson.tool | pygmentize -l javascript;
  fi;
}









# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    xdg-open .
  else
    xdg-open "$@"
  fi;
}









# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}







##==============================================================================
## IP Address
##==============================================================================
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"










##==============================================================================
# ssh
##==============================================================================
function sshp(){
echo "_______ _________ _______  _______  _______  _______ "
echo "(  ____ )\__   __/(  ____ \(  ____ \(  ____ \(  ____ \\"
echo "| (    )|   ) (   | (    \/| (    \/| (    \/| (    \/"
echo "| (____)|   | |   | (_____ | |      | (__    | (_____ "
echo "|  _____)   | |   (_____  )| |      |  __)   (_____  )"
echo "| (         | |         ) || |      | (            ) |"
echo "| )      ___) (___/\____) || (____/\| (____/\/\____) |"
echo "|/       \_______/\_______)(_______/(_______/\_______)"
ssh poudel@pisces.phy.ohiou.edu
}









function sshs {
cat <<EOF
    _______.  __   __    __ . .___ .    __       __       __   __
   /       | |  | |   \/   | |   _  \  |  |     |  |  /      ||  |
  |   (----| |  | |  \  /  | |  |_)  | |  |     |  | |  ,----'|  |
   \   \     |  | |  |\/|  | |   ___/  |  |     |  | |  |     |  |
.----)   |   |  | |  |  |  | |  |      |   ----.|  | |   ----.|  |
|_______/    |__| |__|  |__| | _|      |_______||__|  \______||__|
EOF
ssh poudel@simplici.phy.ohiou.edu
}











function sshn {
cat <<EOF
_
(_)
___ ___  _ __ _
/ __/ _ \| '__| |
| (_| (_) | |  | |
\___\___/|_|  |_|
EOF
ssh -Y bhishan@cori.nersc.gov
}

##==============================================================================
# Put this paths always in the end!!
##==============================================================================

# added by Anaconda2 installer
export PATH="/home/bhishan/anaconda2/bin:$PATH"
