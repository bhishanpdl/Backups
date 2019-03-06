#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date:
# Topic:
###########################################################
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress \
-sOutputFile=lectures.pdf \
lectures/syllabus.pdf \
lectures/lecture1/lecture01.pdf \
lectures/lecture2/lecture02a.pdf \
lectures/lecture2/lecture02.pdf \
lectures/lecture3/lecture03a.pdf

# There should be an space instead of \ in the above last line.
# open it
open lectures.pdf
