[build-menu]
EX_00_LB=_Execute
EX_00_CM=clear; gcc -Wall %f -L /Users/poudel/Applications/cfitsio/lib -I /Users/poudel/Applications/cfitsio/include  -lcfitsio -lm  -framework vecLib; ./a.out; rm -f a.out
EX_00_WD=
FT_01_LB=_Build
FT_01_CM=gcc -Wall -o "%e" "%f" -L /Users/poudel/Applications/cfitsio/lib -I /Users/poudel/Applications/cfitsio/include  -lcfitsio -lm -lfftw3f -framework vecLib
FT_01_WD=
FT_00_LB=_Compile
FT_00_CM=gcc -Wall -c "%f"
FT_00_WD=
FT_02_LB=_Lint
FT_02_CM=cppcheck --language=c --enable=warning,style --template=gcc "%f"
FT_02_WD=
