
FC = gfortran

#FCFLAGS = -g -fbounds-check
#FCFLAGS = -O2
# flags forall (e.g. look for system .mod files, required in gfortran)
#FCFLAGS += -I/usr/include

# libraries needed for linking,
#LDFLAGS = -li_need_this_lib

# List of executables to be built within the package
PROGRAMS = prog1 prog2 prog3 prog4

# "make" builds all
all: $(PROGRAMS)

prog2.o: prog2.incf  # this is a text file (include file)
prog3: aux.o         # RHS.f90 is subroutine
prog4.o: mod.o       # RHS.f90 is a module
prog4: mod.o

%: %.o
	$(FC) $(FCFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.f90
	$(FC) $(FCFLAGS) -c $<

%.o: %.F90
	$(FC) $(FCFLAGS) -c $<

# Utility targets
.PHONY: clean veryclean

clean:
	rm -f *.o *.mod *.MOD

veryclean: clean
	rm -f *~ $(PROGRAMS)

