#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date  : Mar 13, 2018
# Topic : Bash aliases
###########################################################
alias sb='source ~/.bash_profile'
export PS1='$(whoami)@${PWD/*\//}:' # change text color from terminal settings.
alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"
function del () { mv  $@ ~/.Trash/; }
function pyh () { python  $1 -h; }
function grepb() { clear; egrep $1 ~/.bash_profile;pwd;}

alias py='python'






##==============================================================================
# grep
##==============================================================================
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'




##==============================================================================
# DMstack
##==============================================================================
alias cpdm='clear; cp -v ~/Softwares/DMstack/*.py . && ls'
alias sbdm='source aa_dmstack_aliases.sh'
alias lsst='source activate lsst && source eups-setups.sh && setup lsst_distrib'
alias obs='cd ~/Softwares/obs_file && setup -k -r . && scons && cd -'

# cd example;  rm -rf input output && mkdir input output

alias map='mkdir -p input && echo "lsst.obs.file.FileMapper" > input/_mapper' # creates mapper
alias ingest='ingestImages.py input/ trial00.fits --mode link'  # input: registry.sqlite3 and raw/trial00.fits
alias crccd='echo "config.charImage.repair.cosmicray.nCrPixelMax=1000000" > processCcdConfig.py'
alias prccd='processCcd.py input/ --id filename=trial00.fits --config isr.noise=5 --configfile processCcdConfig.py --clobber-config --output output'
alias src='python read_src_fits.py && head src_fits.csv'




##==============================================================================
# List
##==============================================================================
export CLICOLOR=1 # enables coloring of your terminal
export LSCOLORS=dxcxexdxcxegedabagacad
# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"
alias ls='ls -GFS'
alias la='ls -Al'       # show hidden files
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
alias cdd='clear; cd ~/Dropbox; ls'
alias cdn='clear; cd ~/Downloads; ls'
alias cdr='clear; cd ~/Research; ls'
alias cdg='cd ~/github; ls'
alias cdgit='clear; cd ~/github; ls'
alias cdtmp='clear; cd ~/Temp; ls'
alias cdo='clear; cd ~/OneDrive; ls'
alias cdscr='cd ~/Dropbox/Screenshots; ls'
alias cdj='clear; cd ~/Research/a4_jedisim/jedisim; ls; pwd'
alias runjedi='clear; python run_jedisim -z 0.7 -c simplici -s 0 -e 0'

alias .2='cd ../; pwd'
alias .3='cd ../../; pwd'
alias .4='cd ../../../; pwd'
alias .5='cd ../../../../; pwd'
alias .6='cd ../../../../../; pwd'
alias ..='cd ../; pwd'
alias ...='cd ../../; pwd'
alias ....='cd ../../../; pwd'
alias .....='cd ../../../../; pwd'
alias ......='cd ../../../../../; pwd'






##==============================================================================
# Copy and Backup
##==============================================================================
alias cppath='echo $PWD | pbcopy '
alias cdpath='cd $(pbpaste)'
alias cpw='echo $PWD | pbcopy'
alias ppw='cd $(pbpaste)'

alias cpb='clear; cp -v ~/.bash_profile ~/Dropbox/Recent/bash/bash_profile_simplici.sh; ls; pwd'
alias cpv='clear; cp -v ~/.vimrc ~/Dropbox/Recent/vim/vimrc_simplici.txt; ls; pwd'
alias cpbp='clear; cp -v /usr/local/bin/bpp ~/Dropbox/Recent/bp/bpp_simplici.py; ls; pwd'

alias cpconfa='clear; cp -v ~/.Atom/snippets.cson ~/Dropbox/Recent/atom/atom_simplici_snippets.cson;'\
'cp -v ~/.Atom/init.coffee  ~/Dropbox/Recent//atom_simplici_init.coffee;'\
'cp -v ~/.Atom/keymap.cson  ~/Dropbox/Recent/atom/atom_simplici_keymap.cson;'\
'cp -v ~/.Atom/custom_entries_bhishan.json  ~/Dropbox/Recent/atom/atom_simplici_custom_entries_bhishan.json;'\
'cp -v ~/.Atom/custom_entries.json  ~/Dropbox/Recent/atom/atom_simplici_custom_entries.json;'\
'cp -v ~/.Atom/config.cson ~/Dropbox/Recent/atom/atom_simplici_config.cson; ls; pwd'
alias cpconfv='clear; cp -v ~/.vimrc ~/Dropbox/Recent/vim/vimrc_simplici.txt; ls; pwd'

alias cpj='clear; cp -v ~/Research/a4_jedisim/jedisim.py ~/Dropbox/Recent/jedisim/jedisim_simplici.py;'\
'cp -v ~/Research/a4_jedisim/run_jedisim.py ~/Dropbox/Recent/jedisim/run_jedisim_simplici.py; ls; pwd'









##==============================================================================
## Open Programs
##==============================================================================
alias oepn='open'
alias opena='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom ~/Temp/a.txt'
alias openb='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom ~/.bash_profile'

# alias catb='cat ~/.bash_profile'
alias catb='pygmentize ~/.bash_profile'
alias vib='vim ~/.bash_profile'
# alias opencron='open ~/bin/mycrontab.sh'

alias openmd='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom ~/Temp/a.md'
alias opentxt='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom ~/Temp/a.txt'
alias openpy='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom ~/Temp/a.py'
alias openc='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom ~/Temp/a.c'







##==============================================================================
# rsync
##==============================================================================
alias rsync='rsync -azvu --progress '







##==============================================================================
# pygmentize
##==============================================================================
alias pyg='pygmentize'
alias pcat="pygmentize -f terminal256 -O style=autumn -g" # native bad4 makefile







##==============================================================================
# Programs Short Names
##==============================================================================
alias gf='clear; gfortran'
alias xg='xgterm &'
alias xgterm='xgterm &'
alias bc='bc -l'









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
# pdf manipulation
# pdfjoin a.pdf b.pdf     gives merged.pdf
# pdfjoin in1.pdf in2.pdf; mv merged.pdf output.pdf
# gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf
# gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf
##==============================================================================
alias combine_pdf='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf'
alias pdfjoin='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf'






##==============================================================================
# Additional programs installed in MAC
##==============================================================================
alias atom='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom'
alias firefox="/Users/poudel/Applications/Firefox.app/Contents/MacOS/firefox"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias safari="/Applications/Safari.app/Contents/MacOS/Safari"
alias ds9='/Applications/SAOImage\ DS9.app/Contents/MacOS/ds9'
alias ds9m='ds9 -multiframe'



##==============================================================================
# Shortcuts and fucntions for  MAC
##==============================================================================
# set screenshot location
defaults write com.apple.screencapture location ~/Dropbox/Screenshots
alias which='type --all'
# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


# git add
alias gad='git add '
alias gau='git add --update'

# git branch
alias gbr='git branch'
alias gbra='git branch -a'

# git clone and commit
alias gcl='git clone'
alias gcm='git commit -m '               # gc is ghostscript command
alias gcmm='git commit -m "updated"'     # gc is ghostscript command
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

# git status
#alias gs='git status '  # gs is ghostscript command
alias gst='git status'

# gitx
alias gx='gitx --all'


# git merge
alias gmg="git merge"


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
function upall () {
    cp *.txt /Users/poudel/github/Everything/
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


##########
function mkcd () { mkdir -p $1; cd $1; }


# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}





# DO NOT WRITE BELOW THIS!!!
# added by Anaconda2 5.1.0 installer
export PATH="/anaconda2/bin:$PATH"
