#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel, Physics PhD Student, Ohio University
# Date        : Jul 08, 2017 Sat
# Last update : 
#
# Imports
def func(arg1, arg2):
    """Summary line.

    :param path: The path of the file to wrap
    :type path: str
    :param field_storage: The :class:`FileStorage` instance to wrap
    :type field_storage: FileStorage
    :param temporary: Whether or not to delete the file when the File instance is destructed
    :type temporary: bool
    :returns: A buffered writable file descriptor
    :rtype: BufferedFileStorage

    """
    return arg1 + arg2
