#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date  : Mar 13, 2018
# Topic : Sphinx functions
###########################################################









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
## For Music (youtube-dl  and ffmpeg)
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
