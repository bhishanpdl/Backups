#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date  : Mar 13, 2018
# Topic : Docker aliases and functions
###########################################################


##==============================================================================
# Docker aliases
##==============================================================================
alias mydocker='docker run -itd --name lsst -v `pwd`:/home/lsst/mnt lsstsqre/centos:7-stack-lsst_distrib-v13_0'
alias drun='docker run -itd --name lsst -v `pwd`:/home/lsst/mnt lsstsqre/centos:7-stack-lsst_distrib-v13_0; echo "Now do this: docker exec -it lsst bash and cd /home/lsst/mnt/ "'
alias dmout='/Applications/fv.app/Contents/MacOS/fv output/src/trial00/src.fits'
alias dstop='docker stop lsst && docker rm lsst'

# the syntax cat <<EOF is called a "here document".
function aliasd(){
  if [ ! -f myfile ]
then
   cat <<EOF > aliases.sh
alias c='clear'
alias cls='clear; ls'
alias ..='cd ..'

alias load='source /opt/lsst/software/stack/loadLSST.bash'
alias distrib='setup lsst_distrib'
alias obs='cd obs_file && setup -k -r . && scons && cd ..'
alias catal='cat aliases.sh'

# now cd to example and mkdir input; rm -rf output
alias ingest='ingestImages.py input/ trial00.fits --mode link'
alias crprocess='echo "config.charImage.repair.cosmicray.nCrPixelMax=1000000" > processCcdConfig.py'
alias process='processCcd.py input/ --id filename=trial00.fits --config isr.noise=5 --configfile processCcdConfig.py --clobber-config --output output'

# output
alias dwnsrc='curl https://github.com/bhishanpdl/DMstack_obsfile_example/raw/master/example/read_src_fits.py -L -o read_src_fits.py'
alias src='python read_src_fits.py && head src_fits.csv'

# cmt t (go to next tab), then open src.fits using fv-viewer app
alias out='/Applications/fv/fv.app/Contents/MacOS/fv output/src/trial00/src.fits'
EOF
fi
}
