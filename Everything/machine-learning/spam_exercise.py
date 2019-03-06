#!python
# -*- coding: utf-8 -*-#
"""
Spam Exercise (Qn 2)

@author: Bhishan Poudel

@date: Nov 9, 2017

@email: bhishanpdl@gmail.com

"""
# Imports
import collections
import numpy as np

def read_examples():
    # files
    ifile = 'data.txt'
    ofile = 'vocab.txt'
    stopwords = 'stopwords.txt'
    
    
    # read stop words
    stopwords = np.loadtxt(stopwords,dtype='str')
    
    # count the words and frequencies
    wordcount = collections.Counter()
    with open(ifile) as fi:
        for line in fi:
            wordcount.update(line[1:].split())

    pairs = [(i,j) for i,j in wordcount.items() ]
    
    pairs = sorted(pairs, key=lambda word: word[0], reverse=False)
    
    # print("len(pairs) = {}".format(len(pairs)))
    with open(ofile,'w') as fo:
        for i in range(len(pairs)):
            fo.write("{} {}\n".format(i+1,pairs[i][0]))
            # fo.write("{} {} {}\n".format(i,pairs[i][0], pairs[i][1]))

def create_sparse_data():
    # datafiles
    ifile = 'data.txt'
    ofile = 'data_sparse.txt'

    x,y = np.genfromtxt("vocab.txt", dtype=str, unpack=True)
    d = dict(zip(y,x))

    with open(ifile) as fi, \
         open(ofile,'w') as fo:
    
        for line in fi:
            s = line[0] + " " + " ".join([d[w]+":1" for w in line[1:].split() ]) + "\n"
            fo.write(s)

def main():
    read_examples()
    create_sparse_data()

if __name__ == "__main__":
    main()
