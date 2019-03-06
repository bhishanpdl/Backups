# @(#)Cshrc 1.6 91/09/05 SMI
#################################################################
#
#         .cshrc file
#
#         initial setup file for both interactive and noninteractive
#         C-Shells
#
#         added source of .user.cshrc file to provide easy way
#         for each user to customize their C-Shell environment
#         without making alterations to this generic .cshrc file
#            /RWR june 1994
#
#     modified 15 August 1994 /RWR
#################################################################


# Set openwin as my default window system 
set mychoice=openwin
setenv OPENWINHOME /usr/openwin

#         set up search path

# add directories for local commands

set lpath = (~/bin /usr/local/bin /usr/local /helios/local/bin /helios/local /usr/ucb /usr/bin /usr/etc )


if ( ${?mychoice} != 0 ) then
	if ( ${mychoice} == "openwin" ) then
		set lpath = ( /usr/openwin/bin/xview /usr/openwin/bin $lpath )
	endif
endif

set path = (. ~ $lpath )

setenv MANPATH /usr/man:/usr/openwin/share/man:/usr/local/man:/helios/local/man

#         cd path

#set lcd = ( )  #  add parents of frequently used directories
#set cdpath = (.. ~ ~/bin ~/src $lcd)


#   set this for all shells

set noclobber

# the default stacksize setting is to small for trn posting
# We set coredumpsize limit to 0 to prevent filling disk space
# with useless files.  If user wants to keep coredumps they must
# use the unlimit coredumpsize   command.
limit stacksize 65535
limit coredumpsize 0


## If logged in to plato then special environment setup:
#if (`hostname` == "plato") then
## set to use new TeX on plato and the gnu system on plato
#    set path = ( /usr/local/tex/bin /usr/local/gnu/bin $path )
#    setenv MANPATH /usr/local/gnu/man:$MANPATH
#endif

#   aliases for all shells

alias cd            'cd \!*;echo $cwd'
# alias cp            'cp -i'
# alias mv            'mv -i'
alias rm            'rm -i'
alias pwd           'echo $cwd'
#alias del          'rm -i'
# Changed Jun96 per RWR...
# umask 002
umask 022

#   execute compiler set-up and user customization of the csh
source $HOME/.compiler.setup
source $HOME/.user.cshrc

#   skip remaining setup if not an interactive shell

if ($?USER == 0 || $?prompt == 0) exit

#   settings  for interactive shells

#   list current news files:
news -n

set history=40
set ignoreeof
set notify
set savehist=40
set filec
#set prompt="% "
#set prompt="`hostname`{`whoami`}\!: "
#set time=100

#          commands for interactive shells

#date
#pwd

#         other aliases

#alias a            alias
#alias h            'history \!* | head -39 | more'
#alias u            unalias

#alias             clear
#alias list         cat
#alias lock          lockscreen
#alias m             more
#alias mroe          more
#alias type         more

alias .             'echo $cwd'
alias ..            'set dot=$cwd;cd ..'
alias ,             'cd $dot '

#alias dir          ls
#alias pdw           'echo $cwd'
#alias la            'ls -a'
#alias ll            'ls -la'
#alias ls           'ls -F'

#alias pd           dirs
#alias po           popd
#alias pp           pushd

#alias +w            'chmod go+w'
#alias -w            'chmod go-w'
#alias x             'chmod +x'

#alias j             'jobs -l'

#alias bye           logout
#alias ciao          logout
#alias adios         logout

#alias psg           'ps -ax | grep \!* | grep -v grep'
#alias punt          kill

#alias r            rlogin
#alias run          source

#alias nms 'tbl \!* | nroff -ms | more'                  # nroff -ms
#alias tms 'tbl \!* | troff -t -ms >! troff.output &'    # troff -ms
#alias tpr 'tbl \!* | troff -t -ms | lpr -t &'           # troff & print
#alias ppr 'lpr -t \!* &'                                # print troffed

#alias lp1           'lpr -P1'
#alias lq1           'lpq -P1'
#alias lr1           'lprm -P1'

#alias sd           'screendump | rastrepl | lpr -v &'

#alias edit         textedit

#alias help          man
#alias key           'man -k'

#alias mkae          make


# Added by Bhishan Poudel  Mar 25, 2018
alias ls 'ls -'
alias cls 'clear; ls'
alias la  'ls -a'
alias ll  'ls -la'
alias ls  'ls -F'
