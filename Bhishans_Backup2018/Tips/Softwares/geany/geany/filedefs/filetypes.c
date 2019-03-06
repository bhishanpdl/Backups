[build-menu]
EX_00_LB=_Execute
EX_00_CM=clear; gcc -Wall %f  -lcfitsio -lm  -framework vecLib; ./a.out; rm -f a.out
EX_00_WD=
FT_01_LB=_Build
FT_01_CM=clear; gcc -Wall -o "%e" "%f" -lcfitsio -lm -lfftw3f -framework vecLib; gcc -Wall -c "%f"; rm "%e".o
FT_01_WD=
FT_00_LB=_Compile
FT_00_CM=clear; gcc -Wall -o "%e" "%f" -lcfitsio -lm -lfftw3f -framework vecLib; gcc -Wall -c "%f"; rm "%e".o
FT_00_WD=
