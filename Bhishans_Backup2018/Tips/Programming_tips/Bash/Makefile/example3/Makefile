# declare the variable

CC=gcc

CFLAGS=-c -Wall   # compiler flags

all: out

out: main.o functions.o
	$(CC) main.o functions.o -o out

main.o: main.c
	$(CC) $(CFLAGS) main.c

functions.o: functions.c
	$(CC) $(CFLAGS) functions.c

clean:
	rm -rf *o main
