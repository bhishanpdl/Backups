!Author: Bhishan Poudel
!Program: addition
!cmd    : clear; gfortran precision.f90 && ./a.out


program getSize
implicit none
   real (kind = 4) :: a
   real (kind = 8) :: b
   integer (kind = 2) :: i
   integer (kind = 4) :: j

   print *,'precision of real(4) =', precision(a) ! 6
   print *,'precision of real(8) =', precision(b) ! 15
   
   print *,'range of real(4) =', range(a) ! 37
   print *,'range of real(8) =', range(b) ! 307
   

   print *,'maximum exponent of real(4) =' , maxexponent(a) ! 128
   print *,'maximum exponent of real(8) =' , maxexponent(b) ! 1024
  
   print *,'minimum exponent of real(4) =' , minexponent(a) ! -125
   print *,'minimum exponent of real(8) =' , minexponent(b) ! -1021
   
   print *,'bits in integer(2) =' , bit_size(i) ! 16
   print *,'bits in integer(4) =' , bit_size(j) ! 32
   
end program getSize
