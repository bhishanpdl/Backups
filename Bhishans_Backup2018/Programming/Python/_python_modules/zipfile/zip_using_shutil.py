#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel, Physics PhD Student, Ohio University
# Date        : Jul 19, 2017 Wed
#
# Imports
import shutil

def main():
    """Main Module."""
    fmt = 'zip' # 'tar' , 'gztar'
    shutil.make_archive('myhtml', fmt, 'html')

if __name__ == '__main__':
    main()
