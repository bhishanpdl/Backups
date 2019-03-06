#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
# Imports
from collections import Counter

def main():
    
    list_of_integers = [2, 1, 0, 2, 5, 0, 4, 2, 4, 2, 5, 1, 3, 2]
    cnt = Counter(list_of_integers)
    print(cnt.most_common(3))
    # prints: [(2, 5), (0, 2), (1, 2)]

if __name__ == '__main__':
    main()
