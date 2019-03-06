
# First compile the files
gcc -Wall -O3  jedicatalog.c -o jedicatalog -lcfitsio -lfftw3f -lcurl -lm
gcc -Wall -O3  jeditransform.c -o jeditransform -lcfitsio -lfftw3f -lcurl -lm
gcc -Wall -O3  jedidistort.c -o jedidistort -lcfitsio -lfftw3f -lcurl -lm
gcc -Wall -O3  jedipaste.c -o jedipaste -lcfitsio -lfftw3f -lcurl -lm
gcc -Wall -O3  jediconvolve.c -o jediconvolve -lcfitsio -lfftw3f -lcurl -lm
gcc -Wall -O3  jedirescale.c -o jedirescale -lcfitsio -lfftw3f -lcurl -lm
gcc -Wall -O3  jedinoise.c -o jedinoise -lcfitsio -lfftw3f -lcurl -lm
gcc -Wall -O3  jediaverage.c -o jediaverage -lcfitsio -lfftw3f -lcurl -lm

# Then move the executables
mkdir -p ../executables

for f in jedi*; do mv $f ../executables/$f; done
for f in ../executables/*.c; do rm $f; done
