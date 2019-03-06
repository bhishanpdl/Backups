#!/usr/bin/env python
import os
import sys

from hashlib         import md5
from multiprocessing import Pool, freeze_support
from stat            import S_ISREG

def walk_files(topdir):
     """yield up full pathname for each file in tree under topdir"""
     for dirpath, dirnames, filenames in os.walk(topdir):
         for fname in filenames:
             pathname = os.path.join(dirpath, fname)
             yield pathname

def files_to_process(topdir, size_limit):
    """yield up full pathname for only files we want to process"""
    for fname in walk_files(topdir):
        try: sr = os.stat(fname)
        except OSError: pass
        else:
            # if it is a regular file and small enough, we want to process it
            if S_ISREG(sr.st_mode) and sr.st_size <= size_limit:
                yield fname

def md5sum(fname):
    with open(fname, 'rb') as fp:
        # read all file at once
        contents = fp.read()
        hash = md5(contents)
        return fname, hash.hexdigest()

def main(argv=None):
    if argv is None:
        argv = sys.argv
    topdir = argv[1]
    size_limit = 500000
    nprocesses = 1

    pool = Pool(processes=nprocesses)
    files = files_to_process(topdir, size_limit)
    for fname, hexdigest in pool.imap_unordered(md5sum, files):
        print("%s\t%s" % (fname, hexdigest))

if __name__=="__main__":
    freeze_support()
    main()
