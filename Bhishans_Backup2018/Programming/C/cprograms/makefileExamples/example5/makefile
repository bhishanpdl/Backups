# Makefile template for C programs 
# Needs filling in LIBS, CFILES and bin1/bin2 
# (replace all instances of bin1/bin2 with your program name(s))

# compilers, flags and libraries 
CC  := gcc 
CFLAGS :=

# BLAS, LAPACK, FFT (not FFTW) routines are widely used, so 
# can include them here by default
LIBS :=

# optional - directories for sources and objects 
SRCDIR := .
OBJDIR := .

# source file(s) without suffix 
CFILES = hellomake hellofunc
OBJFILES = $(CFILES:%=%.o)
HEADERS = 

# name of your program(s) 
PROGRAMS = bin1 bin2

# program driver source file
bin1 =     
bin2 =

# rules
all : $(PROGRAMS)

bin1: $(CFILES:%=$(OBJDIR)/%.o) $(bin1:%=$(OBJDIR)/%.o)
	$(CC) $(CFLAGS) -I$(SRCDIR) $^ -o $@ $(LIBS)

bin2: $(CFILES:%=$(OBJDIR)/%.o) $(bin2:%=$(OBJDIR)/%.o)
	$(CC) $(CFLAGS) -I$(SRCDIR) $^ -o $@ $(LIBS)

# implicit rule - objects from source files
$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEADERS:%=$(SRCDIR)/%.h)
	$(CC) $(CFLAGS) -I$(SRCDIR) -c $< -o $@ 

clean:
	rm -f $(OBJDIR)/*.o $(PROGRAMS)
