module ansticc_global
 use iso_fortran_env

 real(kind=REAL64), parameter, dimension(1:5) &
  :: masses = (/.9383, .9396, 1.8757, 2.8077, 2.8098/)

 integer, parameter :: ipid=1 !< which particle ID to use for analysis
 integer, parameter :: ipid2=1 !< ID of 2nd particle in source function calculation (and maybe other 2-particle things eventually)
 real(kind=REAL64), parameter :: am1=masses(ipid) &
                               , am2=masses(ipid2)
 real(kind=REAL64), PARAMETER :: AM1K=AM1*AM1

end module ansticc_global
