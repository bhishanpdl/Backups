#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 06, 2016
# Last update :
#
# Ref: http://blog.rtwilson.com/my-top-5-new-python-modules-of-2015/
#
# Imports
from tqdm import tqdm

def main():
    
    items = list(range(5))
    for item in tqdm(items):
        print(item)
if __name__ == '__main__':
    main()
