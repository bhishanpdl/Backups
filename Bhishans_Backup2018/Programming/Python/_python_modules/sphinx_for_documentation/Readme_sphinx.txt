# Author    : Bhishan Poudel
# Date      : Jul 04, 2017 Tue
# Ref: https://www.youtube.com/watch?v=qrcj7sVuvUA
# Ref: https://github.com/thesheff17/youtube/tree/master/sphinx

Note: 

1. rst= reSTructured Text
2. The scripts should always be self contained.
  i.e. all prints and run code shoud be after if name equals parts.
3. The docstrings are read as rst format.



To create documentation using sphinx
======================================

1. Create three folders and copy scripts inside scripts
mkdir scripts rst html
Copy the script inside scripts e.g. copy pets.py

2. Run sphinx
sphinx-quickstart

Project Name: Homeworks
Author: Bhishan Poudel
Project Version: 1
autodoc: y
viewcode: y
windows: n

3. Make html
make html

4. Generate rst
sphinx-apidoc -o rst scripts

5. Edit Config file
vi conf.py

/import : this will take us to import line
hit enter and i




import os
import sys
sys.path.insert(0, os.path.abspath('.'))
sys.path.append('./scripts')

again go to escape mode search theme using / tool.
html_theme = 'default'

:wq


6. Copy edited conf.py inside rst
cp conf.py rst/


7. Inside folder rst, copy modules.rst to index.rst
cp rst/modules.rst rst/index.rst

8. Inside folder rst, create a folder _static
mkdir rst/_static

ls rst/   ==> should have these added files and folders

9. Build html from rst
sphinx-build -b html rst html

10. Now open the html file
open html/index.html



##=======================================================================
## Sphinx commands
##=======================================================================
sphinx-quickstart -q -p My Project -a Bhishan Poudel -v 1 --ext-autodoc --ext-doctest --ext-viewcode

# This creates a Project folder
# Inside Project 
# Three hidden folders: _templates _build _static
# Four files: conf.py index.rst Makefile make.bat

cd Project
cp ~/Applications/edit_sphinx_conf.py .
mkdir html rst rst/_static


# Then we have to change Makefile
Change python to python3

# 
make html
sphinx-apidoc -o rst  ../scripts
python3 edit_sphinx_conf.py
cp conf.py rst/
cp rst/modules.rst rst/index.rst
sphinx-build -b html rst html

# This sphinx-build failed due to jinja error
# When reinstalling jinja failed, invalid syntax in setup.py


cp -r html ../html
cd ../
rm -rf Project scripts/__pycache__ rst
open html/index.html




##=======================================================================
## .bash_profile
##=======================================================================
alias spall='sphinx-quickstart -q -p My Project -a Bhishan Poudel -v 1 --ext-autodoc --ext-doctest --ext-viewcode && cd Project && cp ~/Applications/edit_sphinx_conf2.py edit_sphinx_conf.py && mkdir html rst rst/_static;make html && sphinx-apidoc -o rst  ../scripts;python3 edit_sphinx_conf.py && cp conf.py rst/ &&  cp rst/modules.rst rst/index.rst && sphinx-build -b html rst html && cp -r html ../html && cd ../ && rm -rf Project scripts/__pycache__ rst && open html/index.html'









##=======================================================================
## sphinx-quickstart options
##=======================================================================
> Root path for the documentation [.]:
> Separate source and build directories (y/n) [n]: 
> Name prefix for templates and static dir [_]:
> Project name: 
> Author name(s):
> Project version []: 
> Project release []:
> Project language [en]: 
> Source file suffix [.rst]: 
> Name of your master document (without suffix) [index]:
> Do you want to use the epub builder (y/n) [n]:
> autodoc: automatically insert docstrings from modules (y/n) [n]:
> doctest: automatically test code snippets in doctest blocks (y/n) [n]:
> intersphinx: link between Sphinx documentation of different projects (y/n) [n]: 
> todo: write "todo" entries that can be shown or hidden on build (y/n) [n]: 
> coverage: checks for documentation coverage (y/n) [n]: 
> imgmath: include math, rendered as PNG or SVG images (y/n) [n]: 
> mathjax: include math, rendered in the browser by MathJax (y/n) [n]: 
> ifconfig: conditional inclusion of content based on config values (y/n) [n]: 
> viewcode: include links to the source code of documented Python objects (y/n) [n]: 
> githubpages: create .nojekyll file to publish the document on GitHub pages (y/n) [n]:
> Create Makefile? (y/n) [y]: 
> Create Windows command file? (y/n) [y]:
