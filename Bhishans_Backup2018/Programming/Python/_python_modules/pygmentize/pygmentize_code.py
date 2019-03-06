#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jul 03, 2017 Mon
# Last update : 
#
# Imports
import os

def main():

    pcat = "pygmentize -l python -f terminal256 -O style=native -g "
    cmd = pcat + 'hello.py'

    os.system(cmd)

if __name__ == '__main__':
    main()
