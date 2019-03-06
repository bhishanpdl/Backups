CC=gcc
CFLAGS=-O3 -Wall
INC= /opt/local/include
LIB= /opt/local/lib -lm -lcfitsio
INDIR = .
OUTDIR = .

# Change this
PRG = fitscreate

# execute program and clean it
default: all
	echo " compilation finished ... "
	./$(PRG)
	rm -rf $(ODIR)/*.dSYM
	rm -f $(PRG)




all : $(PRG)

$(PRG) :
	$(CC) $(CFLAGS) -o $(OUTDIR)/$(PRG) $(INDIR)/$(PRG).c -I $(INC) -L $(LIB)


# Utility targets
.PHONY: clean

clean:
	rm -rf executables/*.dSYM
