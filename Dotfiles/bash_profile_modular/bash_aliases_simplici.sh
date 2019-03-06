#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date  : Mar 13, 2018
# Topic : Bash aliases
###########################################################
# File: ~/.bash_aliases.sh  (source from ~/.bash_profile)





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






##==============================================================================
# Copy and Backup
##==============================================================================
alias cppath='echo $PWD | pbcopy '
alias cdpath='cd $(pbpaste)'
alias cpw='echo $PWD | pbcopy'
alias ppw='cd $(pbpaste)'

alias cpb='cp -v ~/.bash_profile ~/Dropbox/latest/bash_profile_macpro.sh'
alias cpv='cp -v ~/.vimrc ~/Dropbox/latest/vimrc_macpro.txt'
alias cpbp='cp -v /usr/local/bin/bpp ~/Dropbox/latest/bpp_macpro.py'

alias cpconfa='cp -v ~/.Atom/snippets.cson ~/Dropbox/latest/atom_macpro_snippets.cson; cp -v ~/.Atom/init.coffee  ~/Dropbox/latest/atom_macpro_init.coffee; cp -v ~/.Atom/keymap.cson  ~/Dropbox/latest/atom_macpro_keymap.cson; cp -v ~/.Atom/custom_entries_bhishan.json  ~/Dropbox/latest/atom_macpro_custom_entries_bhishan.json; cp -v ~/.Atom/custom_entries.json  ~/Dropbox/latest/atom_macpro_custom_entries.json;cp -v ~/.Atom/config.cson ~/Dropbox/latest/atom_macpro_config.cson'
alias cpconfv='cp -v ~/.vimrc ~/Dropbox/latest/vimrc_macpro.txt'

alias cpj='cp -v ~/jedisim/jedisim/jedimaster.py ~/Dropbox/latest/jedimaster_macpro.py'
alias cpjedi='cp -v ~/jedisim/jedisim/jedimaster.py ~/Dropbox/latest/jedimaster_macpro.py'
alias cpr='cp -v ~/jedisim/jedisim/run_jedimaster.py ~/Dropbox/latest/run_jedimaster_macpro.py'
alias cprun='cp -v ~/jedisim/jedisim/run_jedimaster.py ~/Dropbox/latest/run_jedimaster_macpro.py'

alias cpsp='clear; cp ~/Applications/custom.css ~/Dropbox/latest/custom_pro.css;
cp ~/Applications/edit_sphinx_conf.py ~/Dropbox/latest/edit_sphinx_conf_pro.py'
alias cppros='clear; cp -r ~/Dropbox/Prospectus/prospectus ~/OneDrive/Backups/'








##==============================================================================
## Open Programs
##==============================================================================
alias oepn='open'
alias opena='open ~/Temp/a.txt'
alias openb='open ~/.bash_profile'

# alias catb='cat ~/.bash_profile'
alias catb='pygmentize ~/.bash_profile'
alias vib='vim ~/.bash_profile'
# alias opencron='open ~/bin/mycrontab.sh'

alias openmd='open ~/Temp/a.md'
alias opentxt='open ~/Temp/a.txt'
alias openpy='open ~/Temp/a.py'
alias openc='open ~/Temp/a.c'
alias openbp='atom /usr/local/bin/bpp'







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
# Programs Short Names
##==============================================================================
alias gf='clear; gfortran'
alias xg='xgterm &'
alias xgterm='xgterm &'
alias bc='bc -l'






##==============================================================================
# rmtrash program
##==============================================================================
alias rmt='rmtrash' # NEVER alias rm to rmtrash, it will bite someday!








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
## IP Address
##==============================================================================
# IP addresses
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias localip="ipconfig getifaddr en0"
# alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
