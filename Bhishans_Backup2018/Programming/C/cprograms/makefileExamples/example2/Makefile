OBJS = file1 file2 file3
CC = gcc

all: file1 file2 file3

# file 1 is target
file1:
	$(CC) file1.c -o file1  # this is dependency of target 'file1'
file2:
	$(CC) file2.c -o file2  # dependencies are separated by tab
file3:
	$(CC) file3.c -o file3
clean:
	rm -rf $(OBJS)
	rm *.*~
