# exec is the first target and its dependency is compile
# ./source is command
# dependencies are separated by space
# newline is given by backslash \

exec: compile
	./source  # commands are separated by tab 

compile: \
source.c                  # this is a dependency
	gcc source.c -o source # this is a command
	
clean:
	-rm source
	-rm *.*~
	
	
#  To ignore errors in a recipe line, write a ‘-’ 
#  at the beginning of the line’s text (after the
#  initial tab). The ‘-’ is discarded before the 
#  line is passed to the shell for execution.
