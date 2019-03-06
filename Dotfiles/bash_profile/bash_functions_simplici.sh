#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date  : Mar 13, 2018
# Topic : .bash_functions.sh to be soured by .bash_profile
###########################################################






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
function topen () { touch "$1" && open "$1"; }
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








##==============================================================================
## Backup
##==============================================================================
function bk () {
    for file in "$@"; do
        local new=${file%%.*}_$(date '+%Y%m%d').${file#*.}
        while [[ -f $new ]]; do
            new+="~";
        done;
        printf "copying '%s' to '%s'\n" "$file" "$new";
        \cp -ip "$file" "$new";
    done
}

function bkp () {
    for file in "$@"; do
        local new=~/OneDrive/Bhishan/Backup/${file%%.*}_$(date '+%Y%m%d').${file#*.}
        while [[ -f $new ]]; do
            new+="~";
        done;
        printf "copying '%s' to '%s'\n" "$file" "$new";
        \cp -ip "$file" "$new";
    done
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
    open .;
  else
    open "$@";
  fi;
}









# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}







# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
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
