#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Sep 28, 2016
# Last update :
#
#
# Imports
from pdfrw import PdfReader, PdfWriter, PageMerge

pages = PdfReader('hw1.pdf').pages + PdfReader('hw6.pdf').pages + PdfReader('hw3.pdf').pages
output = PdfWriter()

rects = [[float(num) for num in page.MediaBox] for page in pages] 
height = max(x[3] - x[1] for x in rects)
width = max(x[2] - x[0] for x in rects)

mbox = [0, 0, width, height]

for page in pages:
    newpage = PageMerge()
    newpage.mbox = mbox              # Set boundaries of output page
    newpage.add(page)                # Add one old page to new page
    image = newpage[0]               # Get image of old page (first item)
    image.x = (width - image.w) / 2  # Center old page left/right
    image.y = (height - image.h)     # Move old page to top of output page
    output.addpage(newpage.render())

output.write('homeworks.pdf')
