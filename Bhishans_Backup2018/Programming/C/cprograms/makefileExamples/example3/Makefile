# declare the variable

CC=gcc

CFLAGS=-c -Wall   # compiler flags

exec: \
all
	./a.out

all: a.out

a.out: main.o functions.o
	$(CC) main.o functions.o -o a.out

main.o: main.c
	$(CC) $(CFLAGS) main.c

functions.o: functions.c
	$(CC) $(CFLAGS) functions.c

clean:
	rm -rf *o main
	rm *.*~
	
#exec: \
#compile
#	./source

#compile: \
#source.c
#	gcc source.c -o source
