! ref : http://www.cs.mtu.edu/~shene/COURSES/cs201/NOTES/chap04/iostatus.html

program myiostat
implicit none
INTEGER :: io, x, sum

sum = 0
DO
   READ(*,*,IOSTAT=io)  x
   IF (io > 0) THEN
      WRITE(*,*) 'Check input.  Something was wrong'
      EXIT
   ELSE IF (io < 0) THEN
      WRITE(*,*)  'The total is ', sum
      EXIT
   ELSE
      sum = sum + x
   END IF
END DO
end program

!Now if the input is

!    1
!    3
!    4

!the above code should display 8 (=1+3+4). If the input is

!    1
!    @
!    3

!since @ is not a legal integer, the second time the READ is executed, 
!io would receive a positive number and the above program exits the DO-loop. 

!	 If you prepare the input using keyboard, hiting the Ctrl-D key would 
!	 generate the end-of-mark under UNIX. Once you hit Ctrl-D, 
!	 the system would consider your input stop at there. 
!	 If your program tries to read passing this point, this is an error.

!	However, with IOSTAT=, you can catch this end-of-file mark and do 
!	something about it. A commonly seen application is that let the 
!	program to count the number of data items as will be shown in examples below.
