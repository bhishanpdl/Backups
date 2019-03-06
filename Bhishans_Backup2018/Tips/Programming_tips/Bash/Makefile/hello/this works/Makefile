# all is the first target and hello is its prerequisite
# to check for error: cat -e -t -v  makefile_name
# prerequisites are separated by space
# recipes are separated by TAB

CC=gcc 
CFLAGS=-Wall

all: hello
hello: hello.o
hello.o: hello.c  

clean:
	rm -f hello hello.o
	rm *.*~
run: hello
	./hello
