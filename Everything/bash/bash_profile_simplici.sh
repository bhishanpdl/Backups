# Author  : Bhishan Poudel
# Date    : Mar 18, 2016
# File    : bash profile
# source  : source ~/.bash_profile   # for mac

# Refs: https://github.com/onekiloparsec/dotfiles/blob/master/.aliases#L60


##==============================================================================
# Variables for paths
##==============================================================================
drp=~/Dropbox
dn=~/Downloads
rsh=~/Research
jedi=~/Research/jedisim/jedisim
sim=~/Research/jedisim/jedisim/simdatabase
tips=~/OneDrive/Bhishan/Tips/
pisces=132.235.24.92
simplici=132.235.24.63
MYCOMP=simplici  # $MYCOMP



##==============================================================================
# Research related temporary aliases
##==============================================================================
alias cdsrc='clear; cd ~/Dropbox/Diary/jupyter/src'
alias cdnotes='clear; cd ~/Dropbox/Diary/jupyter/notes'
alias mydocker='docker run -itd --name lsst -v `pwd`:/home/lsst/mnt lsstsqre/centos:7-stack-lsst_distrib-v13_0'
alias dmout='/Applications/fv.app/Contents/MacOS/fv output/src/trial00/src.fits'
alias dstop='docker stop lsst && docker rm lsst'


##==============================================================================
# Python
##==============================================================================
alias my23='for f in *.py; do 2to3 -w $f; done'
alias my23d='for f in *.py; do 2to3 -w $f; done; rm -rf *.bak *.pyc'
alias py='python'




##==============================================================================
# List
##==============================================================================
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
alias ls='ls -GFS'
alias lsz='ls -lSr'     # sort by size
alias lu='ls -lur'	    # sort by access time
alias lr='ls -lR'       # recursive ls
alias lt='ls -ltr'      # sort by date
alias lm='ls -al |more' # pipe through 'more'
alias ll='ls -la'
alias l.='ls -d -G .*'
alias lshidden='ls -ap | grep -v / | egrep "^\." '






##==============================================================================
# Change Directory
##==============================================================================
alias cdd='clear; cd ~/Dropbox; ls; pwd'
alias cdk='clear; cd ~/Desktop; ls; pwd'
alias cdn='clear; cd ~/Downloads; ls; pwd'
alias cdr='clear; cd ~/Research; ls; pwd'
alias cdg='clear; cd ~/github; ls; pwd'
alias cdtmp='clear; cd ~/tmp; ls; pwd'
alias cdo='clear; cd ~/OneDrive; ls; pwd'
alias cdj='clear; cd ~/Research/a4_jedisim_v3.0/jedisim_v3; ls; pwd'
alias cdscr='clear; cd ~/Dropbox/Screenshots; ls; pwd'
alias cdgal='clear; cd ~/Research/galfit_usage; ls; pwd'
alias cdi='clear; cd ~/Dropbox/Diary/sphinx/; ls; pwd'
alias cdrd='clear; cd ~/Dropbox/Research; ls; pwd'
alias cdtips='clear; cd ~/OneDrive/Bhishan/Tips; ls; pwd'
alias cdgit='clear; cd ~/github; ls; pwd'

alias .2='cd ../; ls; pwd'
alias .3='cd ../../; ls; pwd'
alias .4='cd ../../../; ls; pwd'
alias .5='cd ../../../../; ls; pwd'
alias .6='cd ../../../../../; ls; pwd'
alias ..='cd ../; ls; pwd'
alias ...='cd ../../; ls; pwd'
alias ....='cd ../../../; ls; pwd'
alias .....='cd ../../../../; ls; pwd'
alias ......='cd ../../../../../; ls; pwd'



##=============================================================================
# Copy and Backup (.bash_profile is .bashrc in ubuntu)
##==============================================================================
alias atomb='/Applications/Atom.app/Contents/MacOS/Atom ~/.bash_profile'
alias cpb='cp -v ~/.bash_profile ~/Dropbox/latest/bash_profile_$MYCOMP.sh'
alias cpv='cp -v ~/.vimrc ~/Dropbox/latest/vimrc_$MYCOMP.sh'
alias cpbp='cp -v /usr/local/bin/bpp ~/Dropbox/latest/bpp_$MYCOMP.py'
alias cpconfa='cp -v ~/.atom/snippets.cson ~/Dropbox/latest/atom_pisces_snippets.cson; cp -v ~/.atom/keymap.cson ~/Dropbox/latest/atom_pisces_keymap.cson; cp -v ~/.atom/init.coffee ~/Dropbox/latest/atom_pisces_init.coffee; cp -v ~/.atom/custom_entries.json ~/Dropbox/latest/atom_pisces_custom_entries.json;cp -v ~/.atom/custom_entries_bp.json ~/Dropbox/latest/atom_pisces_custom_entries_bp.json; apm list > ~/Dropbox/latest/apm_list_pisces.txt'
alias cpconfv='cp -v ~/.vimrc ~/Dropbox/latest/vimrc_$MYCOMP.sh'
alias cpconfg='cp -v ~/.config/geany/snippets.conf ~/Dropbox/latest/geany_snippets.conf_$MYCOMP.sh; echo "";cp -v ~/.config/geany/filedefs/filetypes.python  ~/Dropbox/latest/geany_filetypes.python_$MYCOMP.sh'
alias cppath='echo $PWD | pbcopy '
alias cdpath='cd $(pbpaste)'
alias cpw='echo $PWD | pbcopy'
alias ppw='cd $(pbpaste)'
alias cpj='cp -rv ~/Research/a4_jedisim_v3.0/jedisim/*.py ~/OneDrive/Jedisim_latest/ '






##==============================================================================
## Prospectus (copy prospectus to good prospectus and dropbox both)
##==============================================================================
alias openpros='open ~/Dropbox/Prospectus/prospectus/prospectus.tex'
alias cppros='cp -v ~/Dropbox/Prospectus/prospectus/prospectus.tex ~/Dropbox/latest/prospectus_$MYCOMP.tex; echo "";cp -v ~/Dropbox/Prospectus/prospectus/prospectus.tex ~/Dropbox/Prospectus/prospectus/good/prospectus_$MYCOMP.tex'
alias clnpros='cd ~/Dropbox/Prospectus/prospectus/; rm -rv *.synctex.gz *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc; cd -'






##==============================================================================
## Mixed
##==============================================================================
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias mute="osascript -e 'set volume output muted true'"
alias volumeup="osascript -e 'set volume output volume 100'"
alias cpn="tr -d '\n' | pbcopy" # trim \n and copy from terminal




##==============================================================================
## Empty trash
##==============================================================================
# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"




##==============================================================================
## Pdf
##==============================================================================
# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'





##==============================================================================
## IP Address
##==============================================================================
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"








##==============================================================================
## Open Programs (Ubuntu command is xdg-open)
##==============================================================================
alias oepn='open'
alias opena='geany ~/tmp/a.txt'
alias openb='open ~/.bash_profile'
alias catb='cat ~/.bash_profile'
alias vib='vim ~/.bash_profile'
alias vig='vim .gitignore'
alias opencron='open ~/bin/mycrontab.sh'
alias openb2='open ~/Dropbox/latest/bashrc_mac.txt; open ~/Dropbox/latest/bashrc_linux.txt &'
alias openmd='open ~/tmp/a.md'
alias opentxt='open ~/temp/a.txt'
alias openpy='open ~/tmp/a.py'
alias openc='open ~/tmp/a.c'
alias jnb='jupyter-notebook'
alias jnba='jupyter-notebook ~/tmp/a.ipynb'
alias jnbml='cd /Users/poudel/Google\ Drive/2017_Summer/Machine_Learning/ML_Udemy; jupyter-notebook machine_learning.ipynb'
alias openbp='geany /usr/local/bin/bpp'
alias openu='open ~/Google\ Drive/2017_Summer/Machine_Learning/'





##==============================================================================
## Lock the screen (when going AFK)
##==============================================================================
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"




##==============================================================================
## Show/Hide Files in Mac
##==============================================================================
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'





##==============================================================================
# ssh and rsync
##==============================================================================
alias sshs='ssh poudel@simplici.phy.ohiou.edu'
alias sshp='ssh poudel@pisces.phy.ohiou.edu'
alias rsync='rsync -azvu --progress '
alias rsync2='rsync -azvu --progress '







##==============================================================================
# Programs Short Names
##==============================================================================
alias gf='clear; gfortran'
alias gff='clear; gfortran -Wall'
alias xg='xgterm &'
alias xgterm='xgterm &'
alias bc='bc -l'
alias pyg='pygmentize'
alias which='type --all'
##=============================================================================






##==============================================================================
# Personnal Aliases
##==============================================================================
alias sb='source ~/.bash_profile'
alias mkdir='mkdir -p'
alias rmr='rm -rv'
alias h='history'
alias j='jobs -l'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'   # Assumes LPDEST is defined
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias path='echo -e ${PATH//:/\\n}'  # echo $(PATH) with new lines
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias vi='vim'
alias pcat="pygmentize -f terminal256 -O style=native -g"
alias lprc='vim -me -c ":syntax on" -c ":hardcopy" -c ":q"'
alias c='clear; pwd'
alias cls='clear; ls -GFS; pwd'



##==============================================================================
# wget   r = recursive l1=level-1 nd=no-directories-all-in-one
##==============================================================================
# example: wpdf http://ciml.info
# -c resumes downloads from previous time.
alias wpdf='wget -r l1 -nd --no-clobber -A.pdf '



##==============================================================================
# Additional programs installed in MAC
##==============================================================================
alias atom="~/Applications/Atom.app/Contents/MacOS/Atom"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias safari="/Applications/Safari.app/Contents/MacOS/Safari"
alias ds9='/Applications/ds9.app/Contents/MacOS/ds9'
alias ds9m='ds9 -multiframe'


##=============================================================================
## Aliases for git
# Ref: http://gitimmersion.com/lab_11.html
##==============================================================================
# log in to github bpresearch
alias gitbp='git remote set-url origin https://bpresearch@github.com/bpresearch/Research.git'

# git add
alias gad='git add '
alias gadd='git add --all'
alias gau='git add --update'

# git branch
alias gbr='git branch'
alias gbra='git branch -a'

# git clone and commit
alias gcl='git clone'
alias gcm='git commit -am '
alias gcmm='git commit -am "updated"'
alias gcmva='git commit -v -a'

# git checkout
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias gco='git checkout '

# git diff
alias gdf='git diff'
alias gdm='git diff | /Applications/Geany.app/Contents/MacOS/geany'

#gitk
alias gtk='gitk --all&'

# git log
alias glog='git log --oneline --decorate'
alias glogp='git log --pretty=format:"%h %s" --graph'

# git pull
alias gpl='git pull'

# git push
alias gps='git push origin master'
alias gpss='git push origin master'

# git status
#alias gs='git status '  # gs is ghostscript command
alias gst='git status'

# gitx
alias gx='gitx --all'


# git merge
alias gmg="git merge"

# set user names for different accounts
alias gitMain='git config user.email bhishantryphysics@gmail.com'
alias gitPrg='git config user.email bhishanpdl2@gmail.com'
alias gitJedi='git config user.email bhishanpdl3@gmail.com'
alias gitRsh='git config user.email bhishanpdl@outlook.com'

# github add,commit,push fuction (type without quotes)
# Usage: gallf Changed the file Readme.
function gall () {
    echo "Example: gall uploaded galfit files oct26-2017."
    git add --all
    git commit -m "$*"
    git push origin master
}

# Usage gall1 hello.py changed number of galaxies.
function gall1 () {
    echo "Example: gall1 edited hello.py oct26-2017"
    git add $1
    git commit -m "$*"
    git push origin master
}

# Upload all the files to github
# command: upall
# Result: upload all the files in the folder with message today's date
function upall () {
    cp *.txt /Users/poudel/github/Everything/
    cp *.rst /Users/poudel/github/Everything/
    cp *.py /Users/poudel/github/Everything/
    cp *.sh /Users/poudel/github/Everything/
    cp *.c /Users/poudel/github/Everything/
    cd /Users/poudel/github/Everything/
    git add --all
    git commit -m "`date +%Y-%b-%d`"
    git push origin master
    cd -
}

# Upload a given file to github
# Usage: upl hello.py
function upl () {
    cp $1 /Users/poudel/github/Everything/
    cd /Users/poudel/github/Everything/
    git add $1
    git commit -m "`date +%Y-%b-%d`"
    git push origin master
    cd -
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

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
	if [ -t 0 ]; then # argument
		python -mjson.tool <<< "$*" | pygmentize -l javascript;
	else # pipe
		python -mjson.tool | pygmentize -l javascript;
	fi;
}

# UTF-8-encode a string of Unicode symbols
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# `a` with no arguments opens the current directory in Atom Editor, otherwise
# opens the given location
function a() {
	if [ $# -eq 0 ]; then
		atom .;
	else
		atom "$@";
	fi;
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
	if [ $# -eq 0 ]; then
		vim .;
	else
		vim "$@";
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

# hostname
PS1='\[\e[0;34m\]simplici:'

##=======================================================================
## Adding paths The last line is taken as default e.g. python --version
# Phosim needs python --version 2.7.5
# Sphinx needs python --version 3.6
# Module gzip needs pyton3.6 from standard python3
##=======================================================================
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#
function setpy2(){
    clear;
    echo 'export PATH="/usr/bin:${PATH}"' >> ~/.bash_profile;
    source ~/.bash_profile
    echo "Setting PATH to python 2.7.10"
    python --version
}

function setpy3(){
    echo 'export PATH="~/Library/Enthought/Canopy/edm/envs/User/bin:$PATH"' >> ~/.bash_profile;
    source ~/.bash_profile;
    echo "Setting PATH to Enthought Canopy python3"
    python --version
}



##==============================================================================
# additional paths for MAC
##==============================================================================
export PATH=$PATH:~/imcat/bin/OSX
export PATH=$PATH:~/imcat/bin/scripts
export PATH=$PATH:~/phosim
export PATH=$PATH:/Applications/ds9.app/Contents/MacOS
export PATH=$PATH:~/bin

# path for pgplot
export DYLD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/usr/local/lib/pgplot:/usr/local/opt/readline/lib:$DYLD_LIBRARY_PATH"
export PATH=/usr/local/pgplot:$PATH
export PGPLOT_DEV=/xs
export PGPLOT_DIR=/Users/poudel/Applications/mypgplot/pgplot



##=======================================================================
## Adding paths The last line is taken as default e.g. python --version
# Phosim needs python --version 2.7.5
# Sphinx needs python --version 3.6
# Module gzip needs pyton3.6 from standard python3
##=======================================================================
function setpy2(){
    clear;
    echo 'export PATH="~/Library/Enthought/Canopy/edm/envs/User/bin:${PATH}"' >> ~/.bash_profile;
    source ~/.bash_profile
    echo "Setting PATH to pyton2.7.14"
    python --version
}

function setpy3(){
    echo 'export PATH="~/Library/Enthought/Canopy/edm/envs/User/bin:$PATH"' >> ~/.bash_profile;
    source ~/.bash_profile;
    echo "Setting PATH to python3"
    python --version
}

# set path for python2 and python3
export PATH="~/Library/Enthought/Canopy/edm/envs/User/bin:$PATH"
export PATH="~/Library/Enthought/Canopy/edm/envs/User/bin:${PATH}"
