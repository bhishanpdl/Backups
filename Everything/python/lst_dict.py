#!python
# -*- coding: utf-8 -*-#
"""
List and dictionaries

@author: Bhishan Poudel

@date: Nov 10, 2017

@email: bhishanpdl@gmail.com

"""
# Imports
import collections
import numpy as np
from operator import itemgetter
from collections import OrderedDict
import sortedcontainers
from sortedcontainers import SortedDict
import heapq
import operator
import string

def eg1():
    book_info = { 'title': 'Learning Python',
            'pages': 342,
            'pub_date': 'November 2016',
            'chapters': 14,
    }
    print("The book is called %(title)s, and it was released on %(pub_date)s.  It is %(pages)d pages long with %(chapters)d chapters." % book_info)
    
    distro_install_command = {'Debian': 'apt-get',
                        'Ubuntu': 'apt-get',
                        'Fedora': 'dnf',
                        'CentOS': 'yum',
                        'OpenSUSE': 'zypper',
                        'Arch': 'pacman',
                        'Gentoo': 'emerge'
    }
    distro_commands = distro_install_command.values()

    for command in distro_commands:
        print(command)

def eg2():
    # sort dictionaries
    d = {'carl':40,
          'alan':2,
          'bob':1,
          'danny':3}

    # method 1
    # for key in sorted(d.keys()):
    #     print ("%s: %s" % (key, mydict[key]))
    
    # method 2
    # d = sorted(d.items(), key=lambda x: x[1])
    
    # method 3
    # d = sorted(d.items(), key=operator.itemgetter(0), reverse=False) # fastest list of tuples
    
    # method 4
    # d = collections.OrderedDict(sorted(d.items(), key=lambda t: t[0]))
    # print(d)
    
    # method 5
    # d = sortedcontainers.SortedDict(d)
    # print("d.iloc[-1] = {}".format(d.iloc[-1]))
    # print("d['alan'] = {}".format(d['alan']))
    
    # method 6
    d = sorted(d.items()) # list of tuples
    print(d)
    for k,v in d:
        print(k,v)
    
    
    # print NOTE: for key in d is better than for key in d.items() !!!
    # for k,v in d.items(): 
    #     print(k,v)

def eg3():
    d = {'a':2, 'b':23, 'c':5, 'd':17, 'e':1}

    # largest 2
    # s = heapq.nlargest(2, d.items(), key=operator.itemgetter(1)) # harder to use     
    # s = sorted(d.items(), key=lambda t: t[1], reverse=True)[:2] # stable
    
    # smallest 2
    s = heapq.nsmallest(2, d.items(), key=operator.itemgetter(1))      
    # s = sorted(d.items(), key=lambda t: t[1])[:2] 
    
    print("s = {}".format(s))

def eg4():
    # dict comprehnsion
    # d = { chr(65+i): i for i in range(10) if i > 5}
    # d = {(k, v): k+v for k in range(2) for v in range(4)}
    
    
    # dict from lists ZIP them!!
    l1 = ['Hello',"To","Nepal"]
    l2 = [2, 5,6]
    
    # d = dict(zip(l1,l2))
    d = {k: v for (k, v) in zip(l1,l2) if v>2}
    
    
    print("d = {}".format(d))

def eg5():
    d = {v: i for i, v
                    in enumerate(string.ascii_lowercase)
                    if i > 5 if i < 10}
    
    print("d = {}".format(d))

def eg6():
    items      = 'zero one two three'.split()
    lst_tuples = list(enumerate(items))
    d          = dict(enumerate(items))
    d2         = {v:i*2 for (i,v) in enumerate(items)}
    
    print("items      = {}".format(items))
    print("lst_tuples = {}".format(lst_tuples))
    print("d          = {}".format(d))
    print("d2         = {}".format(d2))

def main():
    """Run main function."""
    eg5()

if __name__ == "__main__":
    main()
