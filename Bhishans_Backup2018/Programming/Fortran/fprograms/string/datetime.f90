!Author: Bhishan Poudel
!cmd   : clear; gfortran datetime.f90 && ./a.out


program  datetime
implicit none

   character(len = 8) :: dateinfo ! ccyymmdd
   character(len = 4) :: year, month*2, day*2

   character(len = 10) :: timeinfo ! hhmmss.sss
   character(len = 2)  :: hour, minute, second*6

   call  date_and_time(dateinfo, timeinfo)

   !  let’s break dateinfo into year, month and day.
   !  dateinfo has a form of ccyymmdd, where cc = century, yy = year
   !  mm = month and dd = day

   year  = dateinfo(1:4)
   month = dateinfo(5:6)
   day   = dateinfo(7:8)

   print*, 'Date String:', dateinfo ! 20150823
   print*, 'Year:', year            ! 2015
   print *,'Month:', month          ! 08
   print *,'Day:', day              ! 23

   !  let’s break timeinfo into hour, minute and second.
   !  timeinfo has a form of hhmmss.sss, where h = hour, m = minute
   !  and s = second

   hour   = timeinfo(1:2)
   minute = timeinfo(3:4)
   second = timeinfo(5:10)

   print*, 'Time String:', timeinfo ! 140507.285
   print*, 'Hour:', hour            ! 14
   print*, 'Minute:', minute        ! 05
   print*, 'Second:', second        ! 07.285
   
end program  datetime
