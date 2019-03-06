#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 05, 2016
# Last update :
# NOTE: In terminal it gives progressbar, not in Atom editor!
# Ref: https://pypi.python.org/pypi/wget
#
# Imports
import wget
import os


url = 'http://www.futurecrew.com/skaven/song_files/mp3/razorback.mp3'
def main():
    
    if not os.path.isfile(os.path.basename(url)):
        wget.download(url, out='.')

    # version
    print(wget.__version__)

if __name__ == '__main__':
    main()
