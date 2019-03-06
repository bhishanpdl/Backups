#!bash
#
###########################################################
# Author: Bhishan Poudel
# Date  : Mar 13, 2018
# Topic : Sphinx functions
###########################################################
#
##==============================================================================
# Sphinx documentation
# $SPQK   $SPAPI  $SPBLD
##==============================================================================
alias sprm='rm -rf  docs/build docs/html docs/Makefile docs/rst docs/source docs/pdf'
alias spo='open docs/html/index.html'

# eg. spq docs  or spq ../docs
# spq
# edit the docs/source/conf.py file (add napoleon, uncomment, theme classic)
# cd docs; make html; cd -
# sphinx-apidoc -o docs/source code/scipy   # rename module.rst to index.rst
# cd docs; sphinx-build -b html source build/html; cd -
# open docs/build/html/index.html
#
#
function spq () { sphinx-quickstart -q -p "Bhishan's" -a "Bhishan Poudel" -v 1 -r 1 \
     --ext-autodoc --ext-doctest --ext-viewcode --ext-imgmath \
     --no-batchfile --sep docs;}




# Documentation using sphinx
# spallf code/         (NOTE: keep last /)
# spallf code/scipy/   (NOTE: keep last /)
function sp1 () {

    #1. Quickstart
    # Outputs: docs
    # docs has three things: Makefile source build
    # NOTE: --ext-napoleon gives error, but runs fine if added in conf.py
    sphinx-quickstart -q -p "Bhishan's" -a "Bhishan Poudel" -v 1 -r 1 \
     --ext-autodoc --ext-doctest --ext-viewcode --ext-imgmath \
     --no-batchfile --sep docs

    #2. Copy edit_conf file
    cp ~/Applications/edit_sphinx_conf.py edit_sphinx_conf.py

    #3. Edit conf.py file.
    python3 edit_sphinx_conf.py; rm -rf edit_sphinx_conf.py

    #4. Create html folder (also creates doctrees).
    cd docs; make html; cd -

    #5. Copy custom.css file to rst/_static
    cp ~/Applications/custom.css docs/source/_static/


    #6. Auto create rst files.
    # sphinx-apidoc -o docs/source src/
    sphinx-apidoc -o docs/source "${1%?}"

    #7. Remove the string 'module' from all rst files
    for f in docs/source/*.rst; do sed -ie '1s/module//' $f; done
    for f in docs/source/*.rste; do rm $f; done


    #8. Delete source/index.rst and rename module to index
    # cat !$
    mv docs/source/modules.rst docs/source/index.rst

    #9. Add path to conf.py
    # path.append is relative to Makefile not conf.py
    # vi docs/source/conf.py  then, sys.path.append('../src/')
    awk -v n=23 -v s="sys.path.append('../${1%?}')" 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #10 b. Add napoleon extension to conf.py (it did not worked adding above)
    # 'sphinx.ext.napoleon',
    # cd docs; make clean; make html; open build/html/index.html
    awk -v n=38 -v s="    'sphinx.ext.napoleon'," 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #11. Add Table of Contents to index.rst
    awk -v n=1 -v s=".. contents:: Table of Contents\n   :depth: 3\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst

    #12. Add Sidebar to index.rst
    awk -v n=1 -v s=".. sidebar:: ${1%?}\n\n   :Author: Bhishan Poudel\n   :Date: date\n   :Update: |today|\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst


    #13. Get index.html (pdf is very very bad.)
    cd docs; sphinx-build -b html source build/html; cd -


    #14. Delete pycache
    rm -rf "${1%?}"/__pycache__

    #15. Open html
    # open docs/build/html/index.html
    }

# exactly same thing except open 
# spml will use this.
# spallf_no_open code/
function sp0 () {

    #1. Quickstart
    # Outputs: docs
    # docs has three things: Makefile source build
    # NOTE: --ext-napoleon gives error, but runs fine if added in conf.py
    sphinx-quickstart -q -p "Bhishan's" -a "Bhishan Poudel" -v 1 -r 1 \
     --ext-autodoc --ext-doctest --ext-viewcode --ext-imgmath \
     --no-batchfile --sep docs

    #2. Copy edit_conf file
    cp ~/Applications/edit_sphinx_conf.py edit_sphinx_conf.py

    #3. Edit conf.py file.
    python3 edit_sphinx_conf.py; rm -rf edit_sphinx_conf.py

    #4. Create html folder (also creates doctrees).
    cd docs; make html; cd -

    #5. Copy custom.css file to rst/_static
    cp ~/Applications/custom.css docs/source/_static/


    #6. Auto create rst files.
    # sphinx-apidoc -o docs/source src/
    sphinx-apidoc -o docs/source "${1%?}"

    #7. Remove the string 'module' from all rst files
    for f in docs/source/*.rst; do sed -ie '1s/module//' $f; done
    for f in docs/source/*.rste; do rm $f; done


    #8. Delete source/index.rst and rename module to index
    # cat !$
    mv docs/source/modules.rst docs/source/index.rst

    #9. Add path to conf.py
    # path.append is relative to Makefile not conf.py
    # vi docs/source/conf.py  then, sys.path.append('../src/')
    awk -v n=23 -v s="sys.path.append('../${1%?}')" 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #10 b. Add napoleon extension to conf.py (it did not worked adding above)
    # 'sphinx.ext.napoleon',
    # cd docs; make clean; make html; open build/html/index.html
    awk -v n=38 -v s="    'sphinx.ext.napoleon'," 'NR == n {print s} {print}' \
    docs/source/conf.py > docs/source/conf_new.py;
    rm docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py

    #11. Add Table of Contents to index.rst
    awk -v n=1 -v s=".. contents:: Table of Contents\n   :depth: 3\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst

    #12. Add Sidebar to index.rst
    awk -v n=1 -v s=".. sidebar:: ${1%?}\n\n   :Author: Bhishan Poudel\n   :Date: date\n   :Update: |today|\n\n" \
                    'NR == n {print s} {print}' \
                  docs/source/index.rst > docs/source/tmp; mv docs/source/tmp docs/source/index.rst


    #13. Get index.html (pdf is very very bad.)
    cd docs; sphinx-build -b html source build/html; cd -


    #14. Delete pycache
    rm -rf "${1%?}"/__pycache__

    #15. Open html
    # open docs/build/html/index.html
    }
    




# Add another folder to previous scripts.
# Usage: spallf2 code/scikit/
function sp2 () {
  
    # create modules.rst and source_code.rst
    sphinx-apidoc -o docs/source "${1%?}"
    
    # add contents of modules to index and delete module
    echo "" >> docs/source/index.rst
    echo "" >> docs/source/index.rst
    cat docs/source/modules.rst >> docs/source/index.rst
    rm -rf docs/source/modules.rst
    
    # Remove the string 'module' from all rst files
    for f in docs/source/*.rst; do sed -ie '1s/module//' $f; done
    for f in docs/source/*.rste; do rm $f; done
    
    # add path to conf.py
    awk -v n=25 -v s="sys.path.append('../${1%?}')" 'NR == n {print s} {print}' docs/source/conf.py > docs/source/conf_new.py
    cp docs/source/conf_new.py docs/source/tmp.py
    rm -rf docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py
    
    # build again
    cd docs; make clean; cd -
    cd docs; sphinx-build -b html source build/html; cd -
    
    # remove temp folder
    rm -rf "${1%?}"/__pycache__
    
    # open html
    # open docs/build/html/index.html
     }

## Build from REPO
function spb(){
    cd docs; make clean; cd -
    cd docs; sphinx-build -b html source build/html; cd -
    open docs/build/html/index.html
}


## run spallf without opening final index.html
function spml(){
  rm -rf docs
  spallf_no_open code/;
  cp rst/*.rst docs/source/
  spb
}

## sphinx for machine learning with extra folder
function spmle(){
  rm -rf docs
  spallf_no_open code/;
  cp rst/*.rst docs/source/
  spallf2 ExtraWork/
}

# special case to add scipy folder
function sp5(){
  rm -r docs
  spallf_no_open code/scipy/
  folder2=$1
  mkdir docs/source/$folder2
  sphinx-apidoc -o docs/source/$folder2 code/$folder2
  
  awk -v n=25 -v s="sys.path.append('../code/$folder2')" 'NR == n {print s} {print}' docs/source/conf.py > docs/source/conf_new.py
  rm -rf docs/source/conf.py; mv docs/source/conf_new.py docs/source/conf.py  
  
  # Remove the string 'module' from all rst files
  for f in docs/source/$folder2/*.rst; do sed -ie '1s/module//' $f; done
  for f in docs/source/$folder2/*.rste; do rm $f; done
  
  echo "" >> docs/source/index.rst
  echo "" >> docs/source/index.rst
  cat docs/source/$folder2/modules.rst >> docs/source/index.rst
  rm docs/source/$folder2/modules.rst
  rm -rf "$1"/__pycache__
  open docs/source/scikit/softmaxExercise.rst
  
  
  # open docs/build/html/index.html
}

## sprstq  copies updated rst files and builds again
function sp4(){
    # copy rst files  (not index.rest file)
    cp rst/*.rst docs/source
    cd docs; make clean; cd -
    cd docs; sphinx-build -b html source build/html; cd -
    open docs/build/html/index.html
}


# sp_dir2 code/pytorch/
function sp3(){
  rm -rf docs
  spallf_no_open code/numpy/
  folder2=$(basename $1)  # basename of full path without /.
  mkdir docs/source/$folder2
  sphinx-apidoc -o docs/source/$folder2 code/$folder2
  
  awk -v n=24 -v s="sys.path.append('../code')" 'NR == n {print s} {print}' docs/source/conf.py > docs/source/conf_new.py
  awk -v n=25 -v s="sys.path.append('../code/$folder2')" 'NR == n {print s} {print}' docs/source/conf_new.py > docs/source/conf_new2.py
  rm -rf docs/source/conf.py docs/source/conf_new.py; mv docs/source/conf_new2.py docs/source/conf.py  
  
  # Remove the string 'module' from all rst files
  for f in docs/source/$folder2/*.rst; do sed -ie '1s/module//' $f; done
  for f in docs/source/$folder2/*.rste; do rm $f; done
  
  echo "" >> docs/source/index.rst
  echo "" >> docs/source/index.rst
  cat docs/source/$folder2/modules.rst >> docs/source/index.rst
  rm docs/source/$folder2/modules.rst
  
  rm -rf "$folder2"/__pycache__
  
  cp rst/*.rst docs/source    # copy rst files except index.rest
  cp rst/*.rest docs/source   # copy index.rest
  
  mv docs/source/index.rst docs/source/index2.rst
  mv docs/source/index.rest docs/source/index.rst
  cat docs/source/index2.rst >> docs/source/index.rst
  rm docs/source/index2.rst
  
  
  open docs/source/index.rst  # add $folder2/  prefix to added folder
  
  open docs/source/$folder2/*.rst # .. automodule:: scikit.softmaxExercise
  echo ""
  echo ""
  echo "NOTE: Edit all rst files inside added directory docs/source/$folder2"
  echo "Example of edit."
  echo "pytorch.softmaxExercise"
  echo "=========================="
  echo ".. automodule:: pytorch.softmaxExercise"
  
  
  # Then build again:  spb_rstq

}
