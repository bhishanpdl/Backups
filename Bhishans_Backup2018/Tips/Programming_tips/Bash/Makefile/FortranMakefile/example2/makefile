# General makefile for F90 - choose PROG = name of given program
# Here we define compiler options, libraries and the target

FCC= gfortran
PROG= myprogram

# Here we make the executable file
${PROG} : ${PROG}.o
	${FCC} ${PROG}.o -o ${PROG}
    
# whereas here we create the object file
${PROG}.o : ${PROG}.f90
	${FCC} -c ${PROG}.f90
