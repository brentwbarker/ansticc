module ansticc_global
 use iso_fortran_env

 real(kind=REAL64), parameter, dimension(1:5) &
  :: masses = (/.9383, .9396, 1.8757, 2.8077, 2.8098/)

 integer, parameter :: ipid=1 !< which particle ID to use for analysis
 integer, parameter :: ipid2=1 !< ID of 2nd particle in source function calculation (and maybe other 2-particle things eventually)
 real(kind=REAL64), parameter :: am1=masses(ipid) &
                               , am2=masses(ipid2)
 real(kind=REAL64), PARAMETER :: AM1K=AM1*AM1

 integer :: nyxn, nyxx, nyyn, nyyx, nyzn, nyzx !< min, max indices of r-rapidity bins

 integer, dimension(:,:,:), allocatable :: imn, imx, imn2, imx2 !< array of indices of particles that start each r-rapidity bin


contains

!  PUTS VALUES INTO IMN AND IMX
 SUBROUTINE FINDI(IPO,IVAL,NQ,IMN,IMX)
  integer, DIMENSION(:),      intent(in)  :: IPO,IVAL
  integer,                    intent(in)  :: nq
  integer, dimension(:,:,:), allocatable, intent(out) :: imn, imx
!  integer, dimension(nyxn:nyxx,nyyn:nyyx,nyzn:nyzx),  intent(out) :: imn, imx

  allocate(imn(nyxn:nyxx,nyyn:nyyx,nyzn:nyzx))
  allocate(imx(nyxn:nyxx,nyyn:nyyx,nyzn:nyzx))

  IQC=1
  DO iz=nyzn,nyzx
   DO iy=nyyn,nyyx
    DO ix=nyxn,nyxx
     IMN(IX,IY,IZ)=IQC
     IVXYZ = ix + iy*(nyxx-nyxn+1)+iz*(nyxx-nyxn+1)*(nyyx-nyyn+1)
 20  CONTINUE
     IF(IQC.GT.NQ)THEN
      IF(IMN(IX,IY,IZ).LE.NQ)THEN
       IMX(IX,IY,IZ)=NQ
      ELSE
       IMX(IX,IY,IZ)=-1
      ENDIF
     ELSEIF(IVAL(IPO(IQC)).GT.IVXYZ)THEN
!*** EXTRA***
      IF(IQC.GT.IMN(IX,IY,IZ))THEN
       IMX(IX,IY,IZ)=IQC-1
      ELSE
       IMX(IX,IY,IZ)=-1
      ENDIF
     ELSE
      IQC=IQC+1
      GOTO 20
     ENDIF
    enddo !iz
   enddo !ix
  enddo !iy

 END subroutine findi

end module ansticc_global
