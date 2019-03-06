CC=gcc
CFLAGS=-O3 -Wall
INC= /opt/local/include
LIB= /opt/local/lib -lm -lfftw3
IDIR = .
ODIR = .

# Name of C Program Without .c
PRG = fftw3-test

# execute program and clean it
default: all
	echo " compilation finished ... "
	./$(PRG)
	rm -rf $(ODIR)/*.dSYM
	rm -f $(PRG)




all : $(PRG)

$(PRG) :
	$(CC) $(CFLAGS) -o $(ODIR)/$(PRG) $(IDIR)/$(PRG).c -I $(INC) -L $(LIB)


# Utility targets
.PHONY: clean

clean:
	rm -rf executables/*.dSYM
