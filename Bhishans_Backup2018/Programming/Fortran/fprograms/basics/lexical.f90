!Author: Bhishan Poudel
!cmd   : clear; gfortran lexical.f90 && ./a.out



program testingChars
implicit none

   character:: a, b, c
   a = 'A'
   b = 'a'
   c = 'B'
   
   if(lgt(a,b)) then
      print *, 'A is lexically greater than a'
   else
      print *, 'a is lexically greater than A'
   end if
   
   if(lgt(a,c)) then
      print *, 'A is lexically greater than B'
   else
      print *, 'B is lexically greater than A'
   end if  
   
   if(llt(a,b)) then
      print *, 'A is lexically less than a'
   end if
   
   if(llt(a,c)) then
      print *, 'A is lexically less than B'
   end if
   
end program testingChars
! Checking Lexical Order of Characters

! The following functions determine the lexical sequence of characters:
! Function 	        Description
! lle(char, char) 	Compares whether the first character is lexically less than or equal to the second
! lge(char, char) 	Compares whether the first character is lexically greater than or equal to the second
! lgt(char, char) 	Compares whether the first character is lexically greater than the second
! llt(char, char) 	Compares whether the first character is lexically less than the second
