!Topic: character input  - the descriptor A
!cmd: clear; gfortran charInput.f90 && ./a.out


program charInput

    character(len=10) :: str1,str2
    character(len=5)  :: str3,str4
    character(len=15) :: str5,str6
    
    
    read(*,'(a)') str1 ! copy and paste:    abcdefghijklmno
    read(*,'(a10)') str2
    read(*,'(a10)') str3
    read(*,'(a10)') str4
    read(*,'(a5)') str5
    read(*,'(a15)') str6
    
    write(*,*) 'str1= ' , str1
    write(*,*) 'str2= ' , str2
    write(*,*) 'str3= ' , str3
    write(*,*) 'str4= ' , str4
    write(*,*) 'str5= ' , str5
    write(*,*) 'str6= ' , str6
    
    

end program charInput

! output:
! str1= abcdefghij
! str2= abcdefghij
! str3= fghij
! str4= fghij
! str5= abcde          
! str6= abcdefghijklmno
