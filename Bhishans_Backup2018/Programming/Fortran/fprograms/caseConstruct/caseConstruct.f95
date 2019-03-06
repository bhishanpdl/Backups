!ref: https://en.wikipedia.org/wiki/Fortran_95_language_features
!cmd: clear; gfortran caseConstruct.f95 && ./a.out

program main
       SELECT CASE (number)       ! number of type integer
      CASE (:-1)                 ! all values below 0
         n_sign = -1
      CASE (0)                   ! only 0
         n_sign = 0
      CASE (1:)                  ! all values above 0
         n_sign = 1
      END SELECT
      
      
end program main

