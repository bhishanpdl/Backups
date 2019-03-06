! ref  : http://rsusu1.rnd.runnet.ru/develop/fortran/prof77/node156.html

! cmd  : clear; gfortran -Wall mysave.f90 && ./a.out


SUBROUTINE EXTRA(MILES) 
       INTEGER MILES, LAST 
       SAVE LAST 
       DATA LAST /0/ 
       WRITE(UNIT=*, FMT=*) MILES - LAST, ' more miles.' 
       LAST = MILES 
       END
       
!       
!	Things To Know:

!1.    If the list in a SAVE statement is omitted in a scoping unit, everything in 
!    that scoping unit that can be saved is saved. No other explicit occurrences of the 
!    SAVE attribute or SAVE statement are allowed.
!    
!2. 	A variable in a common block must not be saved individually.
!	If a common block is saved in one program unit, it must be 
!	saved everywhere it appears other than in a main program.
!	
!3.  A SAVE statement in a main program has no effect because all 
!	variables and common blocks are saved implicitly in a main program.
!	
!4.	There is only one copy of saved variables in all activations in a recursive procedure. 
!	If a local variable is not saved, there is a different copy for each activation.

!5.  Initialization in a DATA statement or in a type declaration implies that a variable has 
!	the SAVE attribute, unless the variable is in a named common block in a block data subprogram.
!	
!6.	The SAVE attribute may be declared in the specification part of a module. A variable in a 
!	module that is not saved becomes undefined when

       
!       
!       
!	SAVE is a specification statement which can be used to ensure that variables and arrays 
!	used within a procedure preserve their values between successive calls to the procedure.
!	Under normal circumstances local items will become ``undefined" as soon as the procedure
!	returns control to the calling unit. It is often useful to store the values of certain 
!	items used on one call to avoid doing extra work on the next. For example:

! 

!	This subroutine simply saves the value of the argument MILES each time and subtracts it 
!	from the next one, so that it can print out the incremental value. The value of LAST 
!	had to be given an initial value using a DATA statement in order to prevent its use 
!	with an undefined value on the initial call.

!	Local variables and arrays and complete named common blocks can be saved using SAVE statements, 
!	but not variables and arrays which are dummy arguments or which appear within common blocks.

!	Items which are initially defined with a DATA statement but which are never updated with a new 
!	value do not need to be saved.

!	The SAVE statement has two alternative forms:
!	SAVE item, item, ... item
!	SAVE
!	Where each item can be a local variable or (unsubscripted) array, or the name of a common 
!	block enclosed in slashes. The second form, with no list of items, saves all the allowable 
!	items in the program unit. This form should not be used in any program unit which uses a 
!	common block unless all common blocks used in that program unit are also used in the main 
!	program or saved in every program unit in which it appears. The SAVE statement can be used 
!	in the main program unit (so that it could be packaged with other specifications in an 
!	INCLUDE file) but has no effect.

!	Many current Fortran systems have a simple static storage allocation scheme in which all 
!	variables are saved whether SAVE is used or not. But on small computers which make use 
!	of disc overlays, or large ones with virtual memory systems, this may not be so. You 
!	should always take care to use the SAVE statement anywhere that its use is indicated 
!	to make your programs safe and portable. Even where it is at present strictly redundant 
!	it still indicates to the reader that the procedure works by retaining information from 
!	one call to the next, and this is valuable in itself. 

