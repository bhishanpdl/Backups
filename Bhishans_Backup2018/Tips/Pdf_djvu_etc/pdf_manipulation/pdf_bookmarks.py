#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Sep 28, 2016
# Last update :
#
#
# Imports
from PyPDF2 import PdfFileWriter, PdfFileReader

output = PdfFileWriter()
input1 = PdfFileReader(open('hw1.pdf', 'rb'))
output.addPage(input1.getPage(0))
input2 = PdfFileReader(open('hw2.pdf', 'rb'))
output.addPage(input2.getPage(0))

parent = output.addBookmark('Introduction', 0) # add parent bookmark
output.addBookmark('Hello, World', 0, parent) # add child bookmark

outputStream = open('result.pdf','wb') #creating result pdf JCT
output.write(outputStream) #writing to result pdf JCT
outputStream.close() #closing result JCT
