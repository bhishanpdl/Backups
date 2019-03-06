!Author: Bhishan Poudel
!cmd   : clear; gfortran char.f90 && ./a.out


program hello
implicit none

   character(len=15) :: surname, firstname 
   character(len=6) :: title 
   character(len=40):: name
   character(len=25)::greetings
   
   title = 'Mr. ' 
   firstname = 'Rowan ' 
   surname = 'Atkinson'
   
   name = title//firstname//surname
   greetings = 'A big hello from Mr. Beans'
   
   print *, 'Here is ', name
   print *, greetings
   
end program hello

!Function 	                Description
!len(string) 	            It returns the length of a character string
!index(string,sustring) 	It ﬁnds the location of a substring in another string,
                            !returns 0 if not found.
!achar(int) 	            It converts an integer into a character
!iachar(c) 	                It converts a character into an integer
!trim(string) 	            It returns the string with the trailing blanks removed.
!scan(string, chars) 	    It searches the "string" from left to right 
                            !(unless back=.true.) for the first occurrence of any 
                            !character contained in "chars". It returns an integer 
                            !giving the position of that character, or zero if 
                            !none of the characters in "chars" have been found.
!verify(string, chars) 	It scans the "string" from left to right 
                            !(unless back=.true.) for the first occurrence of 
                            !any character not contained in "chars". 
                            !It returns an integer giving the position of that 
                            !character, or zero if only the characters in 
                            !"chars" have been found
!adjustl(string) 	        It left justifies characters contained in the "string"
!adjustr(string) 	        It right justifies characters contained in the "string"
!len_trim(string) 	        It returns an integer equal to the length of "string" 
                            !(len(string)) minus the number of trailing blanks
!repeat(string,ncopy) 	    It returns a string with length equal to "ncopy" times 
                            !the length of "string", and containing "ncopy" 
                            !concatenated copies of "string"
