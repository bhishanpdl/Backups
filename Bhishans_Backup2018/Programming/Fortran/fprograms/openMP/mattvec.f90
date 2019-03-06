!cmd: clear; f95 mattvec.f90 -xopenmp=parallel && ./a.out > mattvec.dat; rm -f *~

      program mattvec

!        program to multiply a matrix with a vector

      use omp_lib

      integer (kind=4)             :: m, n, i, memstat

      parameter (m=10000, n=14000) 

      integer (kind=4)             :: tid
      integer (kind=4)             :: kwrite=6
      real    (kind=8)             :: wtime,stime,sum

      real    (kind=8), allocatable, dimension (:)   :: a, c
      real    (kind=8), allocatable, dimension (:,:) :: b


      allocate ( a(1:m), stat=memstat )
        if (memstat.ne.0) stop 'Error in memory allocation for a'

      allocate ( b(1:m,1:n), stat=memstat )
        if (memstat.ne.0) stop 'Error in memory allocation for b'

      allocate ( c(1:n), stat=memstat )
        if (memstat.ne.0) stop 'Error in memory allocation for c'

      
      write (kwrite,'(a,i5)') ' # of processors =',omp_get_num_procs ( )
      write (kwrite,'(a,i5)') ' # of threads =',omp_get_max_threads ( )
      write (kwrite,*)
      write (kwrite,*) ' m =',m,' n =',n

!        initialize matrix b and vector c

      c(1:n) = 1.d0

      do i=1,m
       b(i,1:n) = float(i)
      end do

!        sequential run

      write (6,*) ' Execute sequential code '

      stime = omp_get_wtime ( )

      call mxvs (m,n,a,b,c)

      stime = omp_get_wtime( ) - stime

      write (kwrite,10001) stime
10001 format (' wtime =',d14.5)
      write (kwrite,*)
!-----------------------------------------------------------
!        parallel run 1

      write (6,*) ' Execute parallel code 1 '

      wtime = omp_get_wtime ( )

      call mxvp2 (m,n,a,b,c)

      wtime = omp_get_wtime( ) - wtime

      write (kwrite,10000) wtime,(abs(wtime/stime)*100.d0)
10000 format (' wtime =',d14.5,',   percent improvment =',d14.5)
      write (kwrite,*)


!-----------------------------------------------------------
!        parallel run 2

      write (6,*) ' Execute parallel code 2 '

      wtime = omp_get_wtime ( )

      call mxvp2 (m,n,a,b,c)

      wtime = omp_get_wtime( ) - wtime

      write (kwrite,10000) wtime,(abs(wtime/stime)*100.d0)
      write (kwrite,*)

!-----------------------------------------------------------
!        parallel run 3

      write (6,*) ' Execute parallel code 3 '

      wtime = omp_get_wtime ( )

      call mxvp3 (m,n,a,b,c)

      wtime = omp_get_wtime( ) - wtime

      write (kwrite,10000) wtime,(abs(wtime/stime)*100.d0)
      write (kwrite,*)


      deallocate (a,b,c)

      stop 
      end
!---------------------------------------------------------------

      subroutine mxvs (m,n,a,b,c)

!        sequential multiplication of matrix by vector

      implicit none

      integer  (kind=4) :: m, n
      integer  (kind=4) :: i, j
      real     (kind=8) :: a(1:m), b(1:m,1:n), c(1:n)
      real     (kind=8) :: sum

      do i=1,m
       
        a(i) =0.d0

        do j=1,n
         a(i) = a(i) + b(i,j)*c(j)
        end do

      end do 

      sum = 0.d0
      do i=1,m
       sum=sum+a(i)
      end do

      write (6,10001) sum
10001 format (1x,'sum in sequential code =',d15.6)

      return
      end
!---------------------------------------------------------------

      subroutine mxvp (m,n,a,b,c)

!        parallel multiplication of matrix by vector

      implicit none

      integer  (kind=4) :: m, n
      integer  (kind=4) :: i, j
      real     (kind=8) :: a(1:m), b(1:m,1:n), c(1:n)
      real     (kind=8) :: sum

!$omp parallel do private(i,j), shared(m,n,a,b,c)

      do i=1,m

        a(i) =0.d0

        do j=1,n
         a(i) = a(i) + b(i,j)*c(j)
        end do

      end do
!$omp end parallel do


      sum = 0.d0
      do i=1,m
       sum=sum+a(i)
      end do

      write (6,10001) sum
10001 format (1x,'sum in parallel code 1 =',d15.6)

      return
      end

 
!---------------------------------------------------------------

      subroutine mxvp2 (m,n,a,b,c)

!        parallel multiplication of matrix by vector

      implicit none

      integer  (kind=4) :: m, n
      integer  (kind=4) :: i, j
      real     (kind=8) :: a(1:m), b(1:m,1:n), c(1:n)
      real     (kind=8) :: sum

!$omp parallel do default(none) &
!$omp private(i,j), shared(m,n,a,b,c)

      do i=1,m

        a(i) = b(i,1)*c(1)

        do j=2,n
         a(i) = a(i) + b(i,j)*c(j)
        end do

      end do
!$omp end parallel do


      sum = 0.d0
      do i=1,m
       sum=sum+a(i)
      end do

      write (6,10001) sum
10001 format (1x,'sum in parallel code 2 =',d15.6)

      return
      end

 
!---------------------------------------------------------------

      subroutine mxvp3 (m,n,a,b,c)

!        parallel multiplication of matrix by vector
!        use reversed order of loops

      implicit none

      integer  (kind=4) :: m, n
      integer  (kind=4) :: i, j
      real     (kind=8) :: a(1:m), b(1:m,1:n), c(1:n)
      real     (kind=8) :: sum

!$omp parallel default(none) &
!$omp private(i,j), shared(m,n,a,b,c)

!$omp workshare
      a(1:m) = b(1:m,1)*c(1)
!$omp end workshare

!$omp do reduction(+:a)
      do j=2,n
       do i=1,m
        a(i) = a(i) + b(i,j)*c(j)
       end do
      end do
!$omp end do

!$omp end parallel 

      sum = 0.d0
      do i=1,m
       sum=sum+a(i)
      end do

      write (6,10001) sum
10001 format (1x,'sum in parallel code 2 =',d15.6)

      return
      end

 
