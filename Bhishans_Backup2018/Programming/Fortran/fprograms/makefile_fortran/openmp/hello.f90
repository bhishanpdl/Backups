!cmd: clear; f95 hello.f90 -xopenmp=parallel && ./a.out

      program hello

      use omp_lib

      integer nthreads, tid

     call omp_set_num_threads(16)
!        Fork threads with each thread having a private TID variable

!$OMP PARALLEL PRIVATE(TID)

!        get private tread id

      tid = omp_get_thread_num()

      write (6,*) 'hello from thread ',tid 

!        action of master thread

      if (tid.eq.0) then
       nthreads = omp_get_num_threads()
       write (6,*) 'number of threads = ',nthreads
      end if

!$OMP END PARALLEL

      stop
      end 
