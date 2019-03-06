# set fortran compiler for linux and unix machines
####################################################
UNAME_S := $(shell uname -s)

$(info $$UNAME_S == $(UNAME_S))

ifeq ($(UNAME_S),Linux)
    FC := f95
    LIB = -llapack
    #FCFLAGS = -xopenmp=parallel   ! for f95 compiler
else ifeq ($(UNAME_S),Darwin)
  FC := gfortran
  LIB = -framework vecLib
else
  $(error unsupported system: $(UNAME_S))
endif

$(info $$PDFVIEWER == $(PDFVIEWER))
####################################################



# compiler,library,optional flags


LIBDIR = /usr/local/lib


# execute program and clean it
default: all
	./dminv_test
	rm -f *.o *~ dminv_test *.mod fort.8


# main program
PROGRAMS = dminv_test

# main program depends on other programs and subroutines (something.o)
dminv_test: dminv.o print_matrix.o

# "make" builds all
all: $(PROGRAMS)


%: %.o
	$(FC) $(FCFLAGS) -o $@ $^ $(LDFLAGS) -L$(LIBDIR)  $(LIB)
	

%.o: %.f90
	$(FC) $(FCFLAGS) -c $< -L$(LIBDIR)  $(LIB)

# Utility targets
.PHONY: clean

clean:
	rm -f *.o *.mod *.MOD fort.8
	rm -f *~ $(PROGRAMS)
	
	
# notes: to replace  cmd opt F  (in mac)
