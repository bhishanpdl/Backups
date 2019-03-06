# @Author: Bhishan Poudel <poudel>
# @Date:   21-Sep-2016 11:09
# @Last modified by:   poudel
# @Last modified time: 09-Nov-2016 11:11


# Author    : Bhishan Poudel
# Date      : Sep 06, 2016



##==============================================================================
## format: MIN HOUR DOM MON DOW CMD     note: we can add  && CMD2
##         00  00   00  00  00
##==============================================================================
#   Field	Description	    Allowed Value
#   MIN	    Minute field	0 to 59
#   HOUR	Hour field	    0 to 23
#   DOM	    Day of Month	1-31
#   MON	    Month field	    1-12
#   DOW	    Day Of Week	    0-6
#   CMD	    Command	Any command to be executed.






##==============================================================================
## Repeat timely
##==============================================================================
#    string         meaning
#    ------         -------
#    @reboot        Run once, at startup.
#    @yearly        Run once a year, "0 0 1 1 *".
#    @annually      (same as @yearly)
#    @monthly       Run once a month, "0 0 1 * *".
#    @weekly        Run once a week, "0 0 * * 0".
#    @daily         Run once a day, "0 0 * * *".
#    @midnight      (same as @daily)
#    @hourly        Run once an hour, "0 * * * *".





##==============================================================================
## Allowed special character (*, -, /, ?, #)
##==============================================================================
#   Asterik(*)      – Match all values in the field or any possible value.
#   Hyphen(-)       –  To define range.
#   Slash (/)       – 1st field /10 meaning every ten minute or increment of range.
#   Comma (,)       – To separate items. e.g, 3,5


##==============================================================================
## Examples to Automate the Processes with Cron
##==============================================================================
# tar the folder at 6:00 AM with added date and time every Friday
# 00 06 * * * tar -cvzf ~/myfolder_$(date +%Y%m%d).tar.gz ~/myfolder


##==============================================================================
## crontab mycrontab.sh   # executes crontab
## crontab -l             # prints current cronjobs
## crontab -e             # opens vim editor to edit current cronjobs
##==============================================================================


##==============================================================================
## To use environment variables
## Note: in ~/.bashrc I have: crontab ~/bin/mycrontab.sh
##==============================================================================
#SHELL=/bin/bash





# Backup some important folders daily at 10 PM
#00 22 * * * rsync -azu ~/jedisim /Volumes/500GB
#00 22 * * * rsync -azu ~/phosim /Volumes/500GB
#00 22 * * * rsync -azu ~/Research /Volumes/500GB

#00 06 * * * tar -czf /Volumes/500GB/Research.tar.gz ~/Research

#00 06 * * * tar -czf /Volumes/500GB/Research_$(date +%Y%m%d).tar.gz ~/Research




##==============================================================================
## practice : type now to see time, crontab mycrontab.sh to set job, crontab -l
##==============================================================================
#58 10 * * * echo 'hello' >> /Volumes/500GB/mac_crontab/$(date).txt
##20 10 * * * rsync -azu ~/bin/try /Volumes/500GB
#38 10 * * * tar -czf /Volumes/500GB/try_$(date +%Y%m%d).tar.gz ~/bin/try

#33 11 * * * tar -czf ~/bin/try.tar.gz ~/bin/try



# this did not worked
#33 11 * * * tar -czf ~/bin/try_$(date +%Y%m%d).tar.gz ~/bin/try



# ref: #http://stackoverflow.com/questions/2229825/where-can-i-set-environment-variables-that-crontab-will-use

# now write your crontab jobs
# crontab /Volumes/500GB/mac_crontab/mycrontab.sh; crontab -l
# Backup some important folders daily at 10 PM
30 21 * * * rsync -azu ~/jedisim /Volumes/500GB/
00 22 * * * rsync -azu ~/Research /Volumes/500GB/
30 22 * * * rsync -azu ~/Dropbox /Volumes/500GB/
45 22 * * * rsync -azu ~/jedisim_all_outputs /Volumes/500GB/
