#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date  : Mar 13, 2018
# Topic : Bash functions for MacOS
###########################################################



# set screenshot location
defaults write com.apple.screencapture location ~/Dropbox/Screenshots





# which command
alias which='type --all'






# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}






##==============================================================================
## Show/Hide Files in Mac
##==============================================================================
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'





#==============================================================================
## Lock the screen (when going AFK)
##==============================================================================
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"






##==============================================================================
## Pdf
##==============================================================================
# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'






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
## Mixed
##==============================================================================
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias mute="osascript -e 'set volume output muted true'"
alias volumeup="osascript -e 'set volume output volume 100'"
alias cpn="tr -d '\n' | pbcopy" # trim \n and copy from terminal
