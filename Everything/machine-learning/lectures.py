#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Sep 28, 2016
# Last update :
#
#
# Imports
import io
import subprocess
import os
from pdfrw import PdfReader, PdfWriter
from natsort import natsorted


def create_merged_pdf(in_pdf_dir):
    """Create merged pdf."""
    writer = PdfWriter()
    files = [x for x in os.listdir(in_pdf_dir) if x.endswith('.pdf')]
    pagenums = [1]
    pagenum = 1
    for fname in natsorted(files):
        page_length = len((PdfReader(os.path.join(in_pdf_dir, fname)).pages))
        pagenum = pagenum + page_length
        pagenums.append(pagenum)
        writer.addpages(PdfReader(os.path.join(in_pdf_dir, fname)).pages)
    outpdf = "tmp.pdf"
    writer.write(outpdf)
    del pagenums[-1]  # we dont need last page number
    return pagenums


def create_index_file_for_ghostscript(pagenums):
    """Create index file."""
    bookmarks = []
    for count, value in enumerate(pagenums):
        line = '[/Page {:d} /View [/XYZ null null null] /Title (lecture{:d}) /OUT pdfmark'.format(
            value, count + 1)
        bookmarks.append(line)
    myindex = '\n'.join(bookmarks)
    with open('index.info', 'w') as f:
        f.writelines(myindex.lstrip())


def create_clickable_index(inpdf, outpdf):
    """Create clickable pdf."""
    # input/output files
    inpdf = inpdf
    outpdf = outpdf
    commands = "gs -sDEVICE=pdfwrite -q -dBATCH -dNOPAUSE  -sOutputFile=" +\
        outpdf + ' index.info -f ' + inpdf
    subprocess.call(commands, shell=True)
    print('{} {} {}'.format('Creating : ', outpdf, ''))


if __name__ == '__main__':

    # first create merged pdf
    pagenums = create_merged_pdf(in_pdf_dir='lectures')

    # create index file for ghostscript
    create_index_file_for_ghostscript(pagenums)

    # create clickable index in pdf
    inpdf = 'tmp.pdf'
    outpdf = 'lectures.pdf'
    create_clickable_index(inpdf, outpdf)

    # delete index.info
    if os.path.exists('index.info'):
        os.remove('index.info')

    if os.path.exists('tmp.pdf'):
        os.remove('tmp.pdf')

    #  open output pdf
    #  subprocess.call('xdg-open  all_homeworks1.pdf', shell=True)
