#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel, Physics PhD Student, Ohio University
# Date        : Jul 04, 2017 Tue
# Ref:
# http://www.sphinx-doc.org/en/stable/theming.html
#
# Imports
import time
import os
import subprocess

def edit_sphinx_conf_py():
    """Edit sphinx conf.py file."""
    
    html_theme_options = """html_theme_options = { 
        'linkcolor'          : '#808000',
        'sidebartextcolor'   : '#008080', 
        'sidebarlinkcolor'   : '#808080', 
        'relbarbgcolor'      : '#5D6D7E', 
        'sidebarbgcolor'     : '#064335', 
        'collapsiblesidebar' : True, 
        'externalrefs'       : True
        }
    """

    conf, conf2 = 'docs/source/conf.py', 'docs/source/conf2.py'
    if os.path.isfile(conf): subprocess.call('mv %s %s '% (conf, conf2), shell=True)
    with open(conf2, 'r') as f, open(conf,'w') as fo:
        for line in f.readlines():
            olds = [r'# import os', 
                    r'# import sys',
                    r"# sys.path.insert(0, os.path.abspath('.'))",
                    r"html_theme = 'alabaster'"]
            news = [r'import os', 
                    r'import sys',
                    r"sys.path.insert(0, os.path.abspath('.'))",
                    r"html_theme = 'classic'",
                    html_theme_options,
                    r"html_style = 'custom.css'"]
                    
            # os
            if olds[0] in line:
                print(line.replace(line, news[0]), file=fo, end='\n')
            
            # sys
            elif olds[1] in line:
                print(line.replace(line, news[1]), file=fo, end='\n')
            
            # path
            elif olds[2] in line:
                print(line.lstrip('#').lstrip(' '), file=fo, end='')
                print("sys.path.append('../code')", file=fo, end='\n')
            
            # theme
            elif olds[3] in line:
                print(line.replace(line, news[3]), file=fo)
                print(news[4], file=fo)
                print(news[5], file=fo)
            
            # Other lines
            else:
                print(line, file=fo, end='')
    os.remove(conf2)
    print('Editing file: ', conf)

if __name__ == '__main__':
    edit_sphinx_conf_py()
