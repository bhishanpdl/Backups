# compiler,library,optional flags
FC = gfortran
LIB = -llpack
LIBDIR = /usr/local/lib
FCFLAGS = 


# execute the program and clean it
default: all
	./polint_test
	rm -rf *.o *~ polint_test .mod fort.8


# main programs
PROGRAMS = polint_test

# program depends on other programs (something.o)

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


