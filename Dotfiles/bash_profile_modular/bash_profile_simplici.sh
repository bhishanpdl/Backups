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

alias sb='source ~/.bash_profile'

source ~/.bash_aliases.sh
source ~/.bash_functions.sh
source ~/.bash_github.sh
source ~/.bash_macos.sh
source ~/.bash_docker.sh

# source ~/.bash_pdf_music_convert.sh
# source ~/.bash_grep.sh
# source ~/.bash_sphinx.sh

##==============================================================================
# Change Directory
##==============================================================================
alias cdd='clear; cd ~/Dropbox; ls'
alias cdn='clear; cd ~/Downloads; ls'
alias cdr='clear; cd ~/Research; ls'
alias cdg='cd ~/github; ls'
alias cdgit='clear; cd ~/github; ls'
alias cdo='clear; cd ~/OneDrive; ls'
alias cdtmp='clear; cd ~/Temp; ls'
alias cdscr='cd ~/Dropbox/Screenshots; ls'
alias cdtips='clear; cd ~/OneDrive/Tips; ls'
alias cdpros='clear; cd /Users/poudel/Dropbox/Prospectus/prospectus/ ; ls'
alias cdj='clear; cd /Users/poudel/Research/a4_jedisim_v3.0/jedisim_v3; ls'



alias pyj='clear; python run_jedimaster.py 0.7 simplici 0 0'



# BP: (in blue colors)
PS1='\[\e[0;34m\]${HOSTNAME%%.*}:'



##==============================================================================
# Copy and Backup
##==============================================================================
# Example: find and replace the computer name
alias cpb='cp -v ~/.bash_profile ~/Dropbox/latest/bash_profile_simplici.sh; cp -v ~/.bash_aliases.sh ~/Dropbox/latest/bash_aliases_simplici.sh; cp -v ~/.bash_functions.sh ~/Dropbox/latest/bash_functions_simplici.sh; cp -v ~/.bash_github.sh ~/Dropbox/latest/bash_github_simplici.sh; cp -v ~/.bash_docker.sh ~/Dropbox/latest/bash_docker_simplici.sh; cp -v ~/.bash_macos.sh ~/Dropbox/latest/bash_macos_simplici.sh\'
alias cpv='cp -v ~/.vimrc ~/Dropbox/latest/vimrc_simplici.txt'
alias cpbp='cp -v /usr/local/bin/bpp ~/Dropbox/latest/bpp_simplici.py'

alias cpconfa='cp -v ~/.Atom/snippets.cson ~/Dropbox/latest/atom_simplici_snippets.cson; cp -v ~/.Atom/init.coffee  ~/Dropbox/latest/atom_simplici_init.coffee; cp -v ~/.Atom/keymap.cson  ~/Dropbox/latest/atom_simplici_keymap.cson; cp -v ~/.Atom/custom_entries_bhishan.json  ~/Dropbox/latest/atom_simplici_custom_entries_bhishan.json; cp -v ~/.Atom/custom_entries.json  ~/Dropbox/latest/atom_simplici_custom_entries.json;cp -v ~/.Atom/config.cson ~/Dropbox/latest/atom_simplici_config.cson'
alias cpconfv='cp -v ~/.vimrc ~/Dropbox/latest/vimrc_simplici.txt'

alias cpj='cp -v ~/jedisim/jedisim/jedimaster.py ~/Dropbox/latest/jedimaster_simplici.py'
alias cpjedi='cp -v ~/jedisim/jedisim/jedimaster.py ~/Dropbox/latest/jedimaster_simplici.py'
alias cpr='cp -v ~/jedisim/jedisim/run_jedimaster.py ~/Dropbox/latest/run_jedimaster_simplici.py'
alias cprun='cp -v ~/jedisim/jedisim/run_jedimaster.py ~/Dropbox/latest/run_jedimaster_simplici.py'





##==============================================================================
## Prospectus (copy prospectus to good prospectus and dropbox both)
##==============================================================================
alias openpros='open ~/Dropbox/Prospectus/prospectus/prospectus.tex'
alias cppros='cp -v ~/Dropbox/Prospectus/prospectus/prospectus.tex ~/Dropbox/latest/prospectus_$MYCOMP.tex; echo "";cp -v ~/Dropbox/Prospectus/prospectus/prospectus.tex ~/Dropbox/Prospectus/prospectus/good/prospectus_$MYCOMP.tex'
alias clnpros='cd ~/Dropbox/Prospectus/prospectus/; rm -rv *.synctex.gz *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc; cd -'











##==============================================================================
# ssh and rsync
##==============================================================================
alias sshs='ssh poudel@simplici.phy.ohiou.edu'
alias sshp='ssh poudel@pisces.phy.ohiou.edu'
alias rsync='rsync -azvu --progress '
alias rsync2='rsync -azvu --progress '





##==============================================================================
# Additional programs installed in MAC
##==============================================================================
alias atom="~/Applications/Atom.app/Contents/MacOS/Atom"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias safari="/Applications/Safari.app/Contents/MacOS/Safari"
alias ds9='/Applications/ds9.app/Contents/MacOS/ds9'
alias ds9m='ds9 -multiframe'







##==============================================================================
## Syntax Highlight using pygments python module and terminal command
##==============================================================================
# Usage: bp all, bp all matlab, bp all tex,
function bp () { clear; bpp "$1" | pygmentize -l "${2:-python}" -f terminal256 -O style=autumn -g ;}



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




##==============================================================================
## Adding paths The last line is taken as default e.g. python --version
# Phosim needs python --version 2.7.5
# Sphinx needs python --version 3.6
# Module gzip needs pyton3.6 from standard python3
##==============================================================================
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
export PATH="~/Library/Enthought/Canopy/edm/envs/User/bin:${PATH}"
export PATH="/usr/bin:${PATH}"
