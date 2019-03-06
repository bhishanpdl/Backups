# Author  : Bhishan Poudel
# Date    : Mar 18, 2016
# File    : bash profile
# source  : source ~/.bash_profile   # for mac


##==============================================================================
# Variables for paths
##==============================================================================
drp=~/Dropbox
dn=~/Downloads
rsh=~/Research
jedi=~/jedisim/jedisim
sim=~/jedisim/jedisim/simdatabase
tips=~/OneDrive/Bhishan/Tips/
mygal=~/Research/galfit_usage
pisces=132.235.24.92
simplici=132.235.24.63
nhome=bhishan@cori.nersc.gov:/global/homes/b/bhishan


##===============================================================
# Temporary Aliases
##===============================================================

##==============================================================================
# Research Aliases
# scp -r myfolder bhishan@cori.nersc.gov:~/
##==============================================================================
alias sshn='ssh -Y bhishan@cori.nersc.gov' # year
alias sshh='ssh poudel@helios.phy.ohiou.edu'
alias nersc='ssh -Y bhishan@cori.nersc.gov' # year
# hack day dec 2017
alias lsst='source activate lsst&&source eups-setups.sh&&setup lsst_distrib'
alias lsst2='source ~/bin/lsst_dm.sh'
alias opliu='open /Users/poudel/Zotero/storage/I7LTISBZ/liu.pdf'






##==============================================================================
# Mac Aliases
##==============================================================================
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias rmds='rm -rf .DS_Store */.DS_Store */*/.DS_Store'

# set screenshot location
defaults write com.apple.screencapture location ~/Dropbox/Screenshots
# killall SystemUIServer





##==============================================================================
# List
##==============================================================================
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
# Deep Learning 2018 Spring (jan,feb,mar,apr)
##==============================================================================
alias cddl='clear; cd /Users/poudel/OneDrive/DL_Spr_17_18; ls'
alias cdhw='cd ~/OneDrive/DL_Spr_17_18/HW/hwprac; ls'
alias cdex='cd ~/OneDrive/DL_Spr_17_18/HW/Extra; ls'
alias openhw='open ~/OneDrive/ML/myhw; ls'
alias lec='cd /Users/poudel/OneDrive/DL_Spr_17_18; open lectures.pdf; cd - '
alias hw='cd /Users/poudel/OneDrive/DL_Spr_17_18; open homeworks.pdf; cd - '
alias mlec='cd /Users/poudel/OneDrive/DL_Spr_17_18 && python lectures.py; open lectures.pdf; cd - '
alias mhw='cd /Users/poudel/OneDrive/DL_Spr_17_18 && python homeworks.py; open homeworks.pdf; cd - '



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
alias cdj='clear; cd ~/jedisim/jedisim; ls'
alias cdscr='cd ~/Dropbox/Screenshots; ls'
alias cdgal='cd ~/Research/galfit_usage; ls'
alias cdi='cd ~/Dropbox/Research_Diary; ls'
alias cdrd='cd ~/Dropbox/Research_Diary; ls'
alias cdtips='clear; cd ~/OneDrive/Tips; ls'
alias cdpy='cd ~/OneDrive/Programming/Python; ls'
alias cdpros='clear; cd /Users/poudel/Dropbox/Prospectus/prospectus/ ; ls'

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
alias cpb='cp -v ~/.bash_profile ~/Dropbox/Recent/bash/bash_profile_macpro.sh'
alias cpv='cp -v ~/.vimrc ~/Dropbox/Recent/vim/vimrc_macpro.txt'
alias cpconfa='cp -v ~/.Atom/snippets.cson ~/Dropbox/Recent/atom/atom_macpro_snippets.cson; cp -v ~/.Atom/init.coffee  ~/Dropbox/Recent/atom/atom_macpro_init.coffee; cp -v ~/.Atom/keymap.cson  ~/Dropbox/Recent/atom/atom_macpro_keymap.cson; cp -v ~/.Atom/custom_entries.json  ~/Dropbox/Recent/atom/atom_macpro_custom_entries.json;cp -v ~/.Atom/config.cson ~/Dropbox/Recent/atom/atom_macpro_config.cson'
alias cpj='cp -v ~/Research/a4_jedisim/jedisim/jedimaster.py ~/Dropbox/Recent/jedisim/jedimaster_macpro.py'
alias cpjedi='cp -v ~/jedisim/jedisim/jedimaster.py ~/Dropbox/Recent/jedisim/jedimaster_macpro.py'
alias cpr='cp -v ~/Research/a4_jedisim/jedisim/run_jedimaster.py ~/Dropbox/Recent/jedisim/run_jedimaster_macpro.py'
alias cprun='cp -v ~/jedisim/jedisim/run_jedimaster.py ~/Dropbox/Recent/jedisim/run_jedimaster_macpro.py'
alias cppath='echo $PWD | pbcopy '
alias cdpath='cd $(pbpaste)'
alias cpw='echo $PWD | pbcopy'
alias ppw='cd $(pbpaste)'
alias cpsp='clear; cp ~/Applications/custom.css ~/Dropbox/Recent/sphinx/custom_pro.css;
cp ~/Applications/edit_sphinx_conf.py ~/Dropbox/Recent/sphinx/edit_sphinx_conf_pro.py'



##==============================================================================
## Websites
##==============================================================================
alias bpgit="open -a /Applications/Firefox.app/Contents/MacOS/firefox 'https://github.com/bhishanpdl'"
alias wkt="open -a /Applications/Firefox.app/Contents/MacOS/firefox 'https://wakatime.com/dashboard'"
alias ben="open -a /Applications/Firefox.app/Contents/MacOS/firefox 'https://www.benty-fields.com/'"
alias ovr="open -a /Applications/Firefox.app/Contents/MacOS/firefox 'https://www.overleaf.com/users/sign_in'"
alias catmail="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://cas.sso.ohio.edu/login?service=https%3A%2F%2Fshibboleth.ohio.edu%2Fsimplesaml%2Fmodule.php%2Fcas%2Flinkback.php%3FstateID%3D_a4f2da3fa9aa43d28eb551bb1ed504bc71aa5d1c9d%253Ahttps%253A%252F%252Fshibboleth.ohio.edu%252Fsimplesaml%252Fsaml2%252Fidp%252FSSOService.php%253Fspentityid%253Dhttp%25253A%25252F%25252Fsts.ohio.edu%25252Fadfs%25252Fservices%25252Ftrust%2526cookieTime%253D1520297466%2526RelayState%253D14baf998-54ef-4534-bc2e-f2d480419539'"
alias gio="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://github.com/bhishanpdl/bhishanpdl.github.io'"
alias mygit="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://github.com/bhishanpdl'"
alias jokes="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://xkcd.com/'"
alias mylatex="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://tohtml.com/TeX/'"
alias library="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://alice.library.ohiou.edu/patroninfo~S7/1493840/items'"
alias mactips="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://github.com/bhishanpdl/MacTips'"
alias nersc="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://my.nersc.gov/'"
alias ocr="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://www.onlineocr.net/'"
alias oucu="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://www.oucu.org/home/home'"
alias benty="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://www.benty-fields.com/'"
alias papers="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://www.benty-fields.com/'"
alias prg="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://bpprg.github.io/'"
alias regex="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'http://regviz.org/'"
alias regex="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'http://regviz.org/'"
alias slac="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://confluence.slac.stanford.edu/login.action?os_destination=%2Fpages%2Fviewpage.action%3FpageId%3D220431140%26src%3Dmail%26src.mail.timestamp%3D1500058440042%26src.mail.notification%3Dcom.atlassian.confluence.plugins.confluence-content-notifications-plugin%253Apage-edited-notification%26src.mail.recipient%3D06cf45475ab5ed20015b2032e7d2003c%26src.mail.action%3Dview&permissionViolation=true'"
alias stack="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://stackoverflow.com/users/5200329/bhishan-poudel?tab=questions'"
alias student="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://cas.sso.ohio.edu/login?service=https%3A%2F%2Fsis.ohio.edu%2Fpsp%2Fcsprd%2FEMPLOYEE%2FHRMS%2Fc%2FSA_LEARNER_SERVICES.SSS_STUDENT_CENTER.GBL'"
alias waka="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://wakatime.com/login'"
ggl(){
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    open -a open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  "http://www.google.com/search?q=$search"
}
yt(){
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  "http://www.youtube.com/search?q=$search"
}


##==============================================================================
## Open Programs
##==============================================================================
alias oepn='open'
alias opa='open ~/Temp/a.txt'
alias opb='open ~/.bash_profile'
# alias catb='cat ~/.bash_profile'
alias catb='pygmentize ~/.bash_profile'
alias vib='vim ~/.bash_profile'
# alias opencron='open ~/bin/mycrontab.sh'
alias opb2='open ~/Dropbox/Recent/bashrc_mac.txt; open ~/Dropbox/Recent/bashrc_linux.txt &'
alias opmd='open ~/Temp/a.md'
alias optxt='open ~/Temp/a.txt'
alias oppy='open ~/Temp/a.py'
alias opc='open ~/Temp/a.c'
alias opbp='atom /usr/local/bin/bpp'
alias opd='open ../docs/build/html/index.html'
alias opjs='open /Users/poudel/anaconda/share/jupyter/nbextensions/snippets/snippets.json'
alias .='open .'



##==============================================================================
## Jupyter
##==============================================================================
export PATH=$PATH:/Users/bishanpoudel/anaconda/bin/
function jnbs () { jupyter-notebook *$1*; }
alias jnb='jupyter-notebook'
alias jnba='jupyter-notebook ~/Temp/a.ipynb'
alias jnbd='jupyter-notebook ~/Dropbox/Diary/diary_17Fall/diary_17Fall.ipynb'
alias mynb='jupyter-notebook ~/Temp/a.ipynb'
alias nbc='/Users/bishanpoudel/anaconda/bin/jupyter nbconvert --to pdf '



##==============================================================================
# imagemagick command `convert` (NOTE: we can use img2pdf -o a.pdf a.png)
##==============================================================================
alias convert2='convert -quality 100 -density 50 '
alias convert='convert -quality 200 -density 150 '

alias mygif='convert -loop 0 -delay 100 ' # e.g. mygif hw01_*.png out.gif
function mygifs () {
  convert $1 -coalesce tempGIF_a-%04d.gif
  convert $2 -coalesce tempGIF_b-%04d.gif
  for f in tempGIF_a-*.gif; do convert $f ${f/a/b} +append $f; done
  convert -loop 0 -delay 20 tempGIF_a-*.gif result.gif
  rm tempGIF_a-*.gif tempGIF_b-*.gif
  echo "Creating result.gif from $1 and $2."
}



##==============================================================================
# Python Aliases
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
# rsync
##==============================================================================
alias rsync='rsync -azvu --progress '
alias rsync2='rsync -azvu --progress '


##=============================================================================
# Python
##==============================================================================
function py() { 
    clear
    clear
    python $*
    rm -rf __pycache__
    rm -rf *.pyc
    rm -rf */__pycache__
    rm -rf */*.pyc
    }




##=============================================================================
# Programs Short Names
##==============================================================================
alias ipyn='ipython3 notebook'
alias r='R'
alias pya='clear; python3 a.py'
alias pyb='clear; python3 b.py'
alias pyo='clear; /usr/bin/python'
alias py2='clear; /Users/poudel/miniconda2/bin/python2.7'
alias py3='clear; /Users/poudel/miniconda3/bin/python3.6'
alias gf='clear; gfortran'
alias xg='xgterm &'
alias xgterm='xgterm &'
alias bc='bc -l'
alias pyg='pygmentize'
##=============================================================================






##==============================================================================
# DMstack Aliases
##==============================================================================
alias load='source /opt/lsst/software/stack/loadLSST.bash'
alias distrib='setup lsst_distrib'
alias obs='cd obs_file && setup -k -r . && scons && cd ..'
alias obs2='cd obs_file-u-wmwv-wiyn && setup -k -r . && scons && cd ..'
alias catal='cat aliases.sh'

# now cd to example and mkdir input; rm -rf output
alias ingest='ingestImages.py input/ trial00.fits --mode link'
alias crprocess='echo "config.charImage.repair.cosmicray.nCrPixelMax=1000000" > processCcdConfig.py'
alias process='processCcd.py input/ --id filename=trial00.fits --config isr.noise=5 --configfile processCcdConfig.py --clobber-config --output output'

alias dwnsrc='curl https://github.com/bhishanpdl/DMstack_obsfile_example/raw/master/example/read_src_fits.py -L -o read_src_fits.py'
alias src='python read_src_fits.py && head src_fits.csv'

# cmt t (go to next tab), then open src.fits using fv-viewer app
alias out='/Applications/fv/fv.app/Contents/MacOS/fv output/src/trial00/src.fits'

# clusters
alias cluster='clusters_data.py config.yaml --catalogs src'



##==============================================================================
# Personnal Aliases
##==============================================================================
alias sb='source ~/.bash_profile'
alias mkdir='mkdir -p'
alias rmr='rm -rv'
alias h='history'
alias j='jobs -l'
alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'   # Assumes LPDEST is defined
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias background='xv -root -quit -max -rmode 5'    # Put a picture in bkg
alias diary='open ~/Dropbox/Research_Diary/diary_2017.txt'
alias diary1='open ~/Dropbox/Research_Diary/diary_2016.txt'
alias path='echo -e ${PATH//:/\\n}'  # echo $(PATH) with new lines
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias vi='vim'
alias pcat="pygmentize -f terminal256 -O style=autumn -g" # native bad4 makefile
alias lprc='vim -me -c ":syntax on" -c ":hardcopy" -c ":q"'
alias c='clear'
alias cls='clear; ls -GFS'
alias rmt='rmtrash' # NEVER alias rm to rmtrash, it will bite someday!








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
# additional paths for MAC
##==============================================================================
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.5/bin
export PATH=$PATH:/Users/poudel/Applications/Atom.app/Contents/Resources/app/apm/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:~/imcat/bin/OSX
export PATH=$PATH:~/imcat/bin/scripts
export PATH=$PATH:~/phosim
export PATH=$PATH:~/Applications
export PATH=$PATH:/Applications/SAOImage\ DS9.app/Contents/MacOS/
export PATH=$PATH:~/bin/

# added after conda sklearn error Nov 19, 2017
export PATH=$PATH:/Users/poudel/anaconda/lib/python3.6/site-packages/scipy/sparse/linalg/isolve/




##==============================================================================
# Additional programs installed in MAC
##==============================================================================
alias atom='/Users/poudel/Applications/Atom.app/Contents/MacOS/Atom'
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias safari="/Applications/Safari.app/Contents/MacOS/Safari"
alias ds9='/Applications/SAOImage\ DS9.app/Contents/MacOS/ds9'
alias ds9m='ds9 -multiframe'
alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"









##==============================================================================
# Path and Library for pcre (required for swig )
# swig is needed for C/C++ to python,java etc conversion
##==============================================================================
LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
export LD_LIBRARY_PATH







##==============================================================================
# Sphinx documentation
# $SPQK   $SPAPI  $SPBLD
##==============================================================================
alias sprm='rm -rf  docs/build docs/html docs/Makefile docs/rst docs/source docs/pdf'
alias spo='open docs/html/index.html'

# eg. spq docs  or spq ../docs
# spq
# edit the docs/source/conf.py file (add napoleon, uncomment, theme classic)
# cd docs; make html; cd -
# sphinx-apidoc -o docs/source code/scipy   # rename module.rst to index.rst
# cd docs; sphinx-build -b html source build/html; cd -
# open docs/build/html/index.html
#
#
function spq () { sphinx-quickstart -q -p "Bhishan's" -a "Bhishan Poudel" -v 1 -r 1 \
     --ext-autodoc --ext-doctest --ext-viewcode --ext-imgmath \
     --no-batchfile --sep docs;}




# Documentation using sphinx
# spallf code/         (NOTE: keep last /)
# spallf code/scipy/   (NOTE: keep last /)
function sp1 () {

    #1. Quickstart
    # Outputs: docs
    # docs has three things: Makefile source build
    # NOTE: --ext-napoleon gives error, but runs fine if added in conf.py
    sphinx-quickstart -q -p "Bhishan's" -a "Bhishan Poudel" -v 1 -r 1 \
     --ext-autodoc --ext-doctest --ext-viewcode --ext-imgmath \
     --no-batchfile --sep docs

    #2. Copy edit_conf file
    cp ~/Applications/edit_sphinx_conf.py edit_sphinx_conf.py

    #3. Edit conf.py file.
    python3 edit_sphinx_conf.py; rm -rf edit_sphinx_conf.py

    #4. Create html folder (also creates doctrees).
    cd docs; make html; cd -

    #5. Copy custom.css file to rst/_static
    cp ~/Applications/custom.css docs/source/_static/


    #6. Auto create rst files.
    # sphinx-apidoc -o docs/source src/
    sphinx-apidoc -o docs/source "${1%?}"

    #7. Remove the string 'module' from all rst files
    for f in docs/source/*.rst; do sed -ie '1s/module//' $f; done
    for f in docs/source/*.rste; do rm $f; done


    #8. Delete source/index.rst and rename module to index
    # cat !$
    mv docs/source/modules.rst docs/source/index.rst

    #9. Add path to conf.py
    # path.append is relative to Makefile not conf.py
    # vi docs/source/conf.py  then, sys.path.append('../src/')
    awk -v n=23 -v s="sys.path.append('../${1%?}')" 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #10 b. Add napoleon extension to conf.py (it did not worked adding above)
    # 'sphinx.ext.napoleon',
    # cd docs; make clean; make html; open build/html/index.html
    awk -v n=38 -v s="    'sphinx.ext.napoleon'," 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #11. Add Table of Contents to index.rst
    awk -v n=1 -v s=".. contents:: Table of Contents\n   :depth: 3\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst

    #12. Add Sidebar to index.rst
    awk -v n=1 -v s=".. sidebar:: ${1%?}\n\n   :Author: Bhishan Poudel\n   :Date: date\n   :Update: |today|\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst


    #13. Get index.html (pdf is very very bad.)
    cd docs; sphinx-build -b html source build/html; cd -


    #14. Delete pycache
    rm -rf "${1%?}"/__pycache__

    #15. Open html
    # open docs/build/html/index.html
    }

# exactly same thing except open 
# spml will use this.
# spallf_no_open code/
function sp0 () {

    #1. Quickstart
    # Outputs: docs
    # docs has three things: Makefile source build
    # NOTE: --ext-napoleon gives error, but runs fine if added in conf.py
    sphinx-quickstart -q -p "Bhishan's" -a "Bhishan Poudel" -v 1 -r 1 \
     --ext-autodoc --ext-doctest --ext-viewcode --ext-imgmath \
     --no-batchfile --sep docs

    #2. Copy edit_conf file
    cp ~/Applications/edit_sphinx_conf.py edit_sphinx_conf.py

    #3. Edit conf.py file.
    python3 edit_sphinx_conf.py; rm -rf edit_sphinx_conf.py

    #4. Create html folder (also creates doctrees).
    cd docs; make html; cd -

    #5. Copy custom.css file to rst/_static
    cp ~/Applications/custom.css docs/source/_static/


    #6. Auto create rst files.
    # sphinx-apidoc -o docs/source src/
    sphinx-apidoc -o docs/source "${1%?}"

    #7. Remove the string 'module' from all rst files
    for f in docs/source/*.rst; do sed -ie '1s/module//' $f; done
    for f in docs/source/*.rste; do rm $f; done


    #8. Delete source/index.rst and rename module to index
    # cat !$
    mv docs/source/modules.rst docs/source/index.rst

    #9. Add path to conf.py
    # path.append is relative to Makefile not conf.py
    # vi docs/source/conf.py  then, sys.path.append('../src/')
    awk -v n=23 -v s="sys.path.append('../${1%?}')" 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #10 b. Add napoleon extension to conf.py (it did not worked adding above)
    # 'sphinx.ext.napoleon',
    # cd docs; make clean; make html; open build/html/index.html
    awk -v n=38 -v s="    'sphinx.ext.napoleon'," 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #11. Add Table of Contents to index.rst
    awk -v n=1 -v s=".. contents:: Table of Contents\n   :depth: 3\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst

    #12. Add Sidebar to index.rst
    awk -v n=1 -v s=".. sidebar:: ${1%?}\n\n   :Author: Bhishan Poudel\n   :Date: date\n   :Update: |today|\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst


    #13. Get index.html (pdf is very very bad.)
    cd docs; sphinx-build -b html source build/html; cd -


    #14. Delete pycache
    rm -rf "${1%?}"/__pycache__

    #15. Open html
    # open docs/build/html/index.html
    }
    




# Add another folder to previous scripts.
# Usage: spallf2 code/scikit/
function sp2 () {
  
    # create modules.rst and source_code.rst
    sphinx-apidoc -o docs/source "${1%?}"
    
    # add contents of modules to index and delete module
    echo "" >> docs/source/index.rst
    echo "" >> docs/source/index.rst
    cat docs/source/modules.rst >> docs/source/index.rst
    rm -rf docs/source/modules.rst
    
    # Remove the string 'module' from all rst files
    for f in docs/source/*.rst; do sed -ie '1s/module//' $f; done
    for f in docs/source/*.rste; do rm $f; done
    
    # add path to conf.py
    awk -v n=25 -v s="sys.path.append('../${1%?}')" 'NR == n {print s} {print}' docs/source/conf.py > docs/source/conf_new.py
    cp docs/source/conf_new.py docs/source/tmp.py
    rm -rf docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py
    
    # build again
    cd docs; make clean; cd -
    cd docs; sphinx-build -b html source build/html; cd -
    
    # remove temp folder
    rm -rf "${1%?}"/__pycache__
    
    # open html
    # open docs/build/html/index.html
     }

## Build from REPO
function spb(){
    cd docs; make clean; cd -
    cd docs; sphinx-build -b html source build/html; cd -
    open docs/build/html/index.html
}


## run spallf without opening final index.html
function spml(){
  rm -rf docs
  spallf_no_open code/;
  cp rst/*.rst docs/source/
  spb
}

## sphinx for machine learning with extra folder
function spmle(){
  rm -rf docs
  spallf_no_open code/;
  cp rst/*.rst docs/source/
  spallf2 ExtraWork/
}

# special case to add scipy folder
function sp5(){
  rm -r docs
  spallf_no_open code/scipy/
  folder2=$1
  mkdir docs/source/$folder2
  sphinx-apidoc -o docs/source/$folder2 code/$folder2
  
  awk -v n=25 -v s="sys.path.append('../code/$folder2')" 'NR == n {print s} {print}' docs/source/conf.py > docs/source/conf_new.py
  rm -rf docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py  
  
  # Remove the string 'module' from all rst files
  for f in docs/source/$folder2/*.rst; do sed -ie '1s/module//' $f; done
  for f in docs/source/$folder2/*.rste; do rm $f; done
  
  echo "" >> docs/source/index.rst
  echo "" >> docs/source/index.rst
  cat docs/source/$folder2/modules.rst >> docs/source/index.rst
  rm docs/source/$folder2/modules.rst
  rm -rf "$1"/__pycache__
  open docs/source/scikit/softmaxExercise.rst
  
  
  # open docs/build/html/index.html
}

## sprstq  copies updated rst files and builds again
function sp4(){
    # copy rst files  (not index.rest file)
    cp rst/*.rst docs/source
    cd docs; make clean; cd -
    cd docs; sphinx-build -b html source build/html; cd -
    open docs/build/html/index.html
}


# sp_dir2 code/pytorch/
function sp3(){
  rm -rf docs
  spallf_no_open code/numpy/
  folder2=$(basename $1)  # basename of full path without /.
  mkdir docs/source/$folder2
  sphinx-apidoc -o docs/source/$folder2 code/$folder2
  
  awk -v n=24 -v s="sys.path.append('../code')" 'NR == n {print s} {print}' docs/source/conf.py > docs/source/conf_new.py
  awk -v n=25 -v s="sys.path.append('../code/$folder2')" 'NR == n {print s} {print}' docs/source/conf_new.py > docs/source/conf_new2.py
  rm -rf docs/source/conf.py docs/source/conf_new.py; mv docs/source/conf_new2.py docs/source/conf.py  
  
  # Remove the string 'module' from all rst files
  for f in docs/source/$folder2/*.rst; do sed -ie '1s/module//' $f; done
  for f in docs/source/$folder2/*.rste; do rm $f; done
  
  echo "" >> docs/source/index.rst
  echo "" >> docs/source/index.rst
  cat docs/source/$folder2/modules.rst >> docs/source/index.rst
  rm docs/source/$folder2/modules.rst
  
  rm -rf "$folder2"/__pycache__
  
  cp rst/*.rst docs/source    # copy rst files except index.rest
  cp rst/*.rest docs/source   # copy index.rest
  
  mv docs/source/index.rst docs/source/index2.rst
  mv docs/source/index.rest docs/source/index.rst
  cat docs/source/index2.rst >> docs/source/index.rst
  rm docs/source/index2.rst
  
  
  open docs/source/index.rst  # add $folder2/  prefix to added folder
  
  open docs/source/$folder2/*.rst # .. automodule:: scikit.softmaxExercise
  echo ""
  echo ""
  echo "NOTE: Edit all rst files inside added directory docs/source/$folder2"
  echo "Example of edit."
  echo "pytorch.softmaxExercise"
  echo "=========================="
  echo ".. automodule:: pytorch.softmaxExercise"
  
  
  # Then build again:  spb_rstq

}




##=============================================================================
## Aliases for git
# Ref: http://gitimmersion.com/lab_11.html
##==============================================================================
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

# Run fortran files with Accelerate compiler
# Example: gff hello.f90
#
function gff () {
    clear
    gfortran -Wall  $1 -L/System/Library/Frameworks/vecLib.framework  -framework Accelerate
    ./a.out
    rm -rf a.out
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


function mybash() {
  echo "cut -d ',' -f 2-3,5 employees.txt | column -s\",\" -t"
}


##==============================================================================
## Always run these commands at startup
##==============================================================================
crontab ~/mac_crontab/mycrontab.sh  # to check crontab -l
printf '\033c'
unset MAILCHECK


##==============================================================================
# mac special
# mac finder is not working good
##==============================================================================
alias kf='killall Finder'




##******************************************************************************
##******************************************************************************
##==============================================================================
# Terminal Prompt color
##==============================================================================
# attributes: 00=none, 01=bold, 04=underscore, 05=blink, 07=reverse, 08=concealed.
# foreground: 30=black, 31=red, 32=green, 33=yellow, 34=blue, 35=magenta, 36=cyan, 37=white.
# background: 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan

# foreground colors: 30-37 or 90-97 or  38;5;0 to 38;5;255
# background colors: 49=default, 40-47 or 100-107 or 48;5;0 to 48;5;255

# Color	Foreground	Background
# Black	    30	               40
# Red	    31	               41
# Green	    32	               42
# Yellow	33	               43
# Blue	    34	               44
# Magenta	35	               45
# Cyan	    36	               46
# White	    37	               47

#\d – Current date
#\t – Current time
#\h – Host name
#\# – Command number
#\u – User name
#\W – Current working directory (i.e: Desktop/)
#\w – Current working directory, full path (i.e: /Users/Admin/Desktop)
# \e[m  - reset colors

# yellow  blue
#PS1='\[\e[0;33m\]\u@\[\e[0;34m\]\W\[\e[0m\]\$ '
# poudel@two_component_fit$
#PS1='\[\e[0;34m\]\W\[\e[0m\]\$ '
#two_component_fit$
PS1='\[\e[0;34m\]${HOSTNAME%%.*}:'
# BP: (in blue colors)
# In macpro hostname is BpMacpro.local 
# To remvove .* we do %%.*


#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
#export PS1="\[\033[01;33m\][$USER@$HOSTNAME]\[\033[0;00m\] \[\033[01;32m\]\w\\$\[\033[0;00m\] "
#PS1='\n\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;34m\]\w\[\e[0m\]\$ '
#PS1='\n\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;34m\]\w\[\e[0m\]\$ '
#PS1='\n\[\e[0;35m\]\t::\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;34m\]\w\[\e[0m\]\$ '
#11:28:55::poudel@~/Research/galfit_usage/two_component_fit$


##==============================================================================
## Files and directories colors
##==============================================================================


## colored terminal example 2
#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced  # best
#export LSCOLORS=ExFxBxDxCxegedabagacad


#The default is “exfxcxdxbxegedabagacad”, i.e. blue fore-
#ground and default background for regular directories,
#black foreground and red background for setuid executa-
#bles, etc.


## Aug 10, 2016
## For terminal colors
## Ref: http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# default colors:
# 0  ex  : directory  dx=yellow cx = green
# 1  fx  # symbolic link
# 2  cx  # socket
# 3  dx  # pipe
# 4  bx  # executables  # bx = brown
# 5  eg  # block special
# 6  ed  # character special
# 7  ab  # executable with setuid bit set
# 8  ag  # executable with setgid bit set
# 9  ac  # directory writable to others, with sticky bit
# 10 ad  # directory wirtable to others, without sticky bit
#

# a black  ax = black or brown
# b red
# c green
# d brown  dx = yellow
# e blue
# f magenta
# g cyan
# h light grey
# A bold black, usually shows up as dark grey
# B bold red
# C bold green
# D bold brown, usually shows up as yellow
# E bold blue
# F bold magenta
# G bold cyan
# H bold light grey; looks like bright white
# x default foreground or background
# dx = yellow cx = green ex = black
export CLICOLOR=1
export LSCOLORS=dxcxexdxcxegedabagacad
#               0 1 2 3 4 5 6 7 8 9 10




##==============================================================================
## grep colors
## example: echo hello there | blue_grep ll | yellow_grep ere
## example: echo hello there | mgrep ll | cgrep ere
##==============================================================================
alias grep='grep --color=always'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;35'
alias grey_grep="GREP_COLOR='1;30' grep --color=always"
alias red_grep="GREP_COLOR='1;31' grep --color=always"
alias green_grep="GREP_COLOR='1;32' grep --color=always"
alias yellow_grep="GREP_COLOR='1;33' grep --color=always"
alias blue_grep="GREP_COLOR='1;34' grep --color=always"
alias magenta_grep="GREP_COLOR='1;35' grep --color=always"
alias cyan_grep="GREP_COLOR='1;36' grep --color=always"
alias white_grep="GREP_COLOR='1;37' grep --color=always"
alias ygrep="GREP_COLOR='1;33' grep --color=always"
alias mgrep="GREP_COLOR='1;35' grep --color=always"
alias cygrep="GREP_COLOR='1;36' grep --color=always"
alias egrep='egrep -G'
alias fgrep='fgrep -G'


#===============================================================================
# For imcat command lc (e.g. to create mask.fits)
##==============================================================================
# added Aug 19, 2016
# imcat environmental variables
export DYLD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/usr/local/lib/pgplot:/usr/local/opt/readline/lib:$DYLD_LIBRARY_PATH"
export PGPLOT_DEV=/xs
export PGPLOT_DIR=/usr/local/lib/pgplot
export IMCATDIR=/Users/poudel/imcat
export CC=gcc
export ARCH=OSX
export IMCATCONVERTNANS=
export IMCATSWAPFITSBYTES=



##=======================================================================
## For imagemagick
##=======================================================================
export MAGICK_HOME="$HOME/Applications/ImageMagick-7.0.1"
export PATH="$MAGICK_HOME/bin:$PATH"


##==============================================================================
## for python
##==============================================================================
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

##==============================================================================
## for python module tables needed by another module pyne (need to install hdf5)
##==============================================================================
export HDF5_DIR=/usr/bin/hdf5



##==============================================================================
##==============================================================================
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



##=======================================================================
## Syntax Highlight using pygments python module and terminal command
##=======================================================================
# from pygments.styles import get_all_styles
# styles = list(get_all_styles())
# print(styles)
#
# ['default',      'emacs',    'friendly', 'colorful', 'autumn', 'murphy',
#  'manni',        'monokai',  'perldoc',  'pastie',   'borland',  'trac',
#  'native',       'fruity',   'bw',       'vim',      'vs',       'tango',
#  'rrt',          'xcode',    'igor',     'paraiso-light',    'paraiso-dark',
#  'lovelace',     'algol',    'algol_nu', 'arduino',   'rainbow_dash', 'abap']
# autumn is best. colorful makes some words yellow bold and unreadable.
# example bp all, bp all matlab, bp all tex,
# languges are c, fortran, matlab, python, bash, r, julia, perl, awk etc.
function bp () { clear; bpp "$1" | pygmentize -l "${2:-python}" -f terminal256 -O style=autumn -g ;}







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




# Convert all ptyhon scripts from py2 to py3
# Usage: my2to3 hello.py
function my2to3() { for f in *.py; do 2to3 -w $f && rm -rf $f.bak ; done;}
    
    
# Print docstrig of a python script
# Usage: pyd hello.py
function pyd() {
    python -c """import ${1%%.*};print(${1%%.*}.__doc__)""" ;
    }


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




# uptime
function myuptime () {
  uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
  return;
}


##==============================================================================
## For pdf
##==============================================================================

# extract pdf pages
# usage: pdfextr input.pdf input_pages_2_4 2 4  # creates input_pages_2_4.pdf
#                $1        $2              $3 $4
function pdfextr() {
  echo "Chapter $2"
  pdftk A=$1 cat A$3-$4 output $2.pdf
  echo "Splitting pdf file $1 from page $3 to page $4 to create $2.pdf"
}

##==============================================================================
## For Music
##==============================================================================

# download best video quality using youtube-dl
# usage: myvid https://youtu.be/450p7goxZqg?t=4
function myvid() {
  youtube-dl -f bestvideo+bestaudio "$1"
  rm -r youtube_video_time.txt
}

# usage: mymp3 youtube_video_url
# cwix = --continue --no-overwrites --ignore-errors --extract-audio
# https://askubuntu.com/questions/673442/downloading-youtube-playlist-with-youtube-dl-skipping-existing-files/709258
mymp3() {
    youtube-dl --download-archive downloaded.txt --no-post-overwrites -ciwx --audio-format mp3 -o "%(title)s.%(ext)s" $1
}

# usage: mysongs youtube_video_url
mysongs() {
    youtube-dl -ciwx --audio-format mp3  $1
}

# usage: songs_file songs.txt
songs_file() {
    youtube-dl -ciwx --audio-format mp3  --batch-file $1
}

# initial x seconds trimmed mp3 song
# mytrim 5 https://www.youtube.com/watch?v=iLQxbEkN85o
mytrim() {
    local downloaded_file
    youtube-dl --extract-audio --embed-thumbnail --audio-format mp3 -o "%(title)s.%(ext)s" $2
    downloaded_file=$(youtube-dl --get-filename --extract-audio --embed-thumbnail --audio-format mp3 -o "%(title)s.%(ext)s" $2)
    ffmpeg -ss $1 -i "${downloaded_file}" -acodec copy -y temp.mp3
    mv temp.mp3 "${downloaded_file}"
    clear
    echo "${downloaded_file}"
    # Now replace whitespace by underscore
    find . -type f -name "* *.mp3" -exec bash -c 'mv "$0" "${0// /_}"' {} \;
    # Lowercase the file name
    for i in $(find . -name '*[A-Z]*.mp3' -type f); do mv "$i" "$(echo $i|tr A-Z a-z)"; done
}

##=======================================================================
## Adding paths The last line is taken as default e.g. python --version
# Phosim needs python --version 2.7.5
# Sphinx needs python --version 3.6
# Module gzip needs pyton3.6 from standard python3
##=======================================================================
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
# alias py3='/Library/Frameworks/Python.framework/Versions/3.6/bin/python'
# export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
# export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

function setpy2(){
    clear;
    echo 'export PATH="/Users/poudel/miniconda2/bin:${PATH}"' >> ~/.bash_profile;
    source ~/.bash_profile
    echo "Setting PATH to pyton2.7"
    python --version
}

function setpy3(){
    echo 'export PATH="/Users/poudel/miniconda3/bin:$PATH"' >> ~/.bash_profile;
    source ~/.bash_profile;
    echo "Setting PATH to python3.6 from Miniconda"
    python --version
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


##=======================================================================
## Bash Examples
##======================================================================
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




##=======================================================================
## paths for texlive
##=======================================================================
######### Path to update tlmgr for texlive
# kpsewhich --var-value=SELFAUTOPARENT
PATH="/opt/local/libexec:${PATH}"
export PATH
PATH="/usr/local/texlive/2017/bin/x86_64-darwin/tlmgr:${PATH}"
export PATH


##=======================================================================
## Hack Sprint 2017 Dec 3-8
##=======================================================================
# PATH="/Users/poudel/anaconda/envs/lsst/opt/lsst/scons/bin/:${PATH}"
# export PATH
# export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"


# added by Miniconda2 installer
export PATH="/Users/poudel/miniconda2/bin:$PATH"

# added by Miniconda2 installer
export PATH="/Users/poudel/miniconda2/bin:$PATH"

# added by Miniconda3 installer
export PATH="/Users/poudel/miniconda3/bin:$PATH"

# The lines below this are added by function setpy2 and setpy3
