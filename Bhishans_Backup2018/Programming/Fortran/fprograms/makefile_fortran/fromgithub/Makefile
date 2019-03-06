CC       = gcc
CFLAGS   = -g -O2 -Wall -Wextra -std=c90 -pedantic
CXX      = g++
CXXFLAGS = -g -O2 -Wall -Wextra -std=c++98 -pedantic
F77      = gfortran
FFLAGS   = -g -O2 -Wall -Wextra -std=f95 -pedantic
FC       = f95
FCFLAGS  = -g -O2 -Wall -Wextra -std=f95 -pedantic
CPPFLAGS =
DEFS     =
LDFLAGS  =
DEPDIR   = .deps

CCLINK   = $(CC)  $(CFLAGS)   $(LDFLAGS)
CXXLINK  = $(CXX) $(CXXFLAGS) $(LDFLAGS)
F77LINK  = $(F77) $(FFLAGS)   $(LDFLAGS)
FCLINK   = $(FC)  $(FCFLAGS)  $(LDFLAGS)

BIN1  = prog2
OBJ1  = prog1.o
LIB1  =
LINK1 = $(CCLINK)

BIN2  =
OBJ2  =
LIB2  =
LINK2 = $(CCLINK)

BIN3  =
OBJ3  =
LIB3  =
LINK3 = $(CCLINK)

BIN4  =
OBJ4  =
LIB4  =
LINK4 = $(CCLINK)

BIN5  =
OBJ5  =
LIB5  =
LINK5 = $(CCLINK)

BIN6  =
OBJ6  =
LIB6  =
LINK6 = $(CCLINK)

BIN7  =
OBJ7  =
LIB7  =
LINK7 = $(CCLINK)

BIN8  =
OBJ8  =
LIB8  =
LINK8 = $(CCLINK)

BIN9  =
OBJ9  =
LIB9  =
LINK9 = $(CCLINK)

BIN = $(BIN1) $(BIN2) $(BIN3) $(BIN4) $(BIN5) $(BIN6) $(BIN7) $(BIN8) $(BIN9)
OBJ = $(OBJ1) $(OBJ2) $(OBJ3) $(OBJ4) $(OBJ5) $(OBJ6) $(OBJ7) $(OBJ8) $(OBJ9)

all: $(BIN)

$(BIN1): $(OBJ1)
	$(LINK1) -o $(BIN1) $(OBJ1) $(LIB1)

$(BIN2): $(OBJ2)
	$(LINK2) -o $(BIN2) $(OBJ2) $(LIB2)

$(BIN3): $(OBJ3)
	$(LINK3) -o $(BIN3) $(OBJ3) $(LIB3)

$(BIN4): $(OBJ4)
	$(LINK4) -o $(BIN4) $(OBJ4) $(LIB4)

$(BIN5): $(OBJ5)
	$(LINK5) -o $(BIN5) $(OBJ5) $(LIB5)

$(BIN6): $(OBJ6)
	$(LINK6) -o $(BIN6) $(OBJ6) $(LIB6)

$(BIN7): $(OBJ7)
	$(LINK7) -o $(BIN7) $(OBJ7) $(LIB7)

$(BIN8): $(OBJ8)
	$(LINK8) -o $(BIN8) $(OBJ8) $(LIB8)

$(BIN9): $(OBJ9)
	$(LINK9) -o $(BIN9) $(OBJ9) $(LIB9)

mostlyclean:
	rm -rf $(OBJ)

clean:
	rm -rf $(BIN) $(OBJ) $(DEPDIR) *.gch

.SUFFIXES: .o .c .cc .gch .h .f .F .f95 .F95 .f90 .F90

.c.o:
	$(CC) $(DEFS) $(CPPFLAGS) $(CFLAGS) -c -MD -o $@ $< && { [ -d $(DEPDIR) ] || mkdir $(DEPDIR); } && mv $*.d $(DEPDIR)

.cc.o:
	$(CXX) $(DEFS) $(CPPFLAGS) $(CXXFLAGS) -c -MD -o $@ $< && { [ -d $(DEPDIR) ] || mkdir $(DEPDIR); } && mv $*.d $(DEPDIR)

.f.o:
	$(F77) $(FFLAGS) -c -o $@ $<

.F.o:
	$(F77) $(DEFS) $(CPPFLAGS) $(FFLAGS) -c -MD -o $@ $< && { [ -d $(DEPDIR) ] || mkdir $(DEPDIR); } && mv $*.d $(DEPDIR)

.f95.o:
	$(FC) $(FCFLAGS) -c -o $@ $<

.F95.o:
	$(FC) $(DEFS) $(CPPFLAGS) $(FCFLAGS) -c -MD -o $@ $< && { [ -d $(DEPDIR) ] || mkdir $(DEPDIR); } && mv $*.d $(DEPDIR)

#%.h.gch: %.h
#	$(CC) $(DEFS) $(CPPFLAGS) $(CFLAGS) -c -MD -o $@ $< && { [ -d $(DEPDIR) ] || mkdir $(DEPDIR); } && mv $*.d $(DEPDIR)

#%.h.gch: %.h
#	$(CXX) $(DEFS) $(CPPFLAGS) $(CXXFLAGS) -c -MD -o $@ $< && { [ -d $(DEPDIR) ] || mkdir $(DEPDIR); } && mv $*.d $(DEPDIR)

-include $(DEPDIR)/*.d
