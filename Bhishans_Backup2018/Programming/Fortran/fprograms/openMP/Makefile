# compiler,library,and optional flags
FC = f95
LIB = -llapack 
FCFLAGS = -xopenmp=parallel 
LIBDIR = /usr/local/lib


# make will do these things (we can comment this)
default: all
	./hello
	rm -f *.o *~ hello .mod fort.8


# main program
PROGRAMS = hello

# program depends on other programs
hello:

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
	
	
