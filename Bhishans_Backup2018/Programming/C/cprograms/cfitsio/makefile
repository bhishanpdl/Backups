# compiler,library,optional flags
FC = gfortran
LIB = 
LIBDIR = /usr/local/lib
FCFLAGS =


# execute program and clean it
default: all
	rm -f *.o *~ 


# main programs
PROGRAMS = a b

# program depends on other programs (something.o)
# dminv_test: 

# "make" builds all
all: $(PROGRAMS)


%: %.o
	$(FC) $(FCFLAGS) -o $@ $^ $(LDFLAGS) -L$(LIBDIR)  $(LIB)
	

%.o: %.c
	$(FC) $(FCFLAGS) -c $< -L$(LIBDIR)  $(LIB)

# Utility targets
.PHONY: clean

clean:
	rm -f *.o *~
	
	
