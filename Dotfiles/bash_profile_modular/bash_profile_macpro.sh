# Author  : Bhishan Poudel
# Date    : Mar 18, 2016
# File    : bash profile
# source  : source ~/.bash_profile   # for mac
alias sb='source ~/.bash_profile'




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



##==============================================================================
## Pdf
##==============================================================================
# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'






##==============================================================================
## python3
##==============================================================================
alias py2='clear; /Users/poudel/miniconda2/bin/python2.7'
alias py3='clear; /Users/poudel/miniconda3/bin/python3.6'






##==============================================================================
# Research Aliases
# scp -r myfolder bhishan@cori.nersc.gov:~/
##==============================================================================
alias sshn='ssh -Y bhishan@cori.nersc.gov' # year
alias nersc='ssh -Y bhishan@cori.nersc.gov' # year
# hack day dec 2017
alias lsst='source activate lsst&&source eups-setups.sh&&setup lsst_distrib'
alias lsst2='source ~/bin/lsst_dm.sh'





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
# Path and Library for pcre (required for swig )
# swig is needed for C/C++ to python,java etc conversion
##==============================================================================
LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
export LD_LIBRARY_PATH



# Run fortran files with Accelerate compiler
# Example: gff hello.f90
#
function gff () {
    clear
    gfortran -Wall  $1 -L/System/Library/Frameworks/vecLib.framework  -framework Accelerate
    ./a.out
    rm -rf a.out
}




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




##==============================================================================
## Always run these commands at startup
##==============================================================================
crontab ~/mac_crontab/mycrontab.sh  # to check crontab -l
printf '\033c'
unset MAILCHECK








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
