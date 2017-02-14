module ansticc_global
 use iso_fortran_env
 implicit none

 real(kind=REAL64), parameter, dimension(1:5) &
  :: masses = (/.9383, .9396, 1.8757, 2.8077, 2.8098/)

 integer, parameter :: ipid=1 !< which particle ID to use for analysis
 integer, parameter :: ipid2=1 !< ID of 2nd particle in source function calculation (and maybe other 2-particle things eventually)
 real(kind=REAL64), parameter :: am1=masses(ipid) &
                               , am2=masses(ipid2)
 real(kind=REAL64), PARAMETER :: AM1K=AM1*AM1

 integer :: nyxn, nyxx, nyyn, nyyx, nyzn, nyzx !< min, max indices of r-rapidity bins

 integer, dimension(:,:,:), allocatable :: imn, imx, imn2, imx2 !< array of indices of particles that start each r-rapidity bin

 integer, parameter :: ia1 = 40 & !< projectile A
                      ,iz1 = 20 & !< projectile Z
                      ,ia2 = 40 & !< target A
                      ,iz2 = 20   !< target Z

 integer, parameter :: iato = ia1+ia2 &
                     , izto = iz1+iz2 &
                     , nsiz = izto*30000 ! may need to be increased

 integer(kind=2), dimension(nsiz) :: ixxi &  !< raw value for x-momentum for pid1
                                   , iyyi &  !< raw value for y-momentum for pid1
                                   , izzi &  !< raw value for z-momentum for pid1
                                   , ixxi2 & !< raw value for x-momentum for pid2
                                   , iyyi2 & !< raw value for y-momentum for pid2
                                   , izzi2   !< raw value for z-momentum for pid2

 integer, dimension(nsiz) :: ipo  & !< array of pointers to particle indices for pid1
                            ,ival &
                            ,ipo2 & !< array of pointers to particle indices for pid2
                            ,ival2

 integer :: ien & !< number of particles of pid1
           ,ien2  !< number of particles of pid2

! real, parameter :: ptmx = 0.8 & !< p-transverse max
!                   ,plmn = 0.8 & !< p-longitudinal min (neg)
!                   ,plmx = 0.9   !< p-long max of momentum region

! real (kind=REAL64), parameter :: vtmx = 0.65, vlmn=0.65, vlmx = 0.69 !< velocities based on above momenta that assume protons

! real, parameter :: dptl = 0.025 !< width of momentum cell

 real (kind=REAL64), parameter :: dyy = 0.027 !< width of r-rapidity cell (based on
                                              !+ momentum cell width of 0.025 GeV/c)

 ! number of cells in transverse and longitudinal directions. in transverse, i=-nt,nt
! integer, PARAMETER :: NT =int(PTMX/DPTL+.5) &
!                      ,NLM=int(PLMN/DPTL+.5) &
!                      ,NLX=int(PLMX/DPTL+.5)

! integer, PARAMETER :: NLL1   = NLM+NLX+1 &      !< total number of cells in long-direction
!                      ,NTL1   = (NT+NT+1)*NLL1 & !< total number of cells in 2D x-z plane
  integer :: MAXIPO ! = NT*NT*NLL1*10

contains

!  PUTS VALUES INTO IMN AND IMX
 SUBROUTINE FINDI(IPO,IVAL,NQ,IMN,IMX)
  integer, DIMENSION(:),      intent(in)  :: IPO,IVAL
  integer,                    intent(in)  :: nq
  integer, dimension(:,:,:), allocatable, intent(out) :: imn, imx
!  integer, dimension(nyxn:nyxx,nyyn:nyyx,nyzn:nyzx),  intent(out) :: imn, imx

  integer :: iqc, ivxyz, ix, iy, iz

  allocate(imn(nyxn:nyxx,nyyn:nyyx,nyzn:nyzx))
  allocate(imx(nyxn:nyxx,nyyn:nyyx,nyzn:nyzx))

  IQC=1
  DO iz=nyzn,nyzx
   DO iy=nyyn,nyyx
    DO ix=nyxn,nyxx
     IMN(IX,IY,IZ)=IQC
     IVXYZ = (ix - nyxn + 1) &
           + (iy - nyyn + 1) * (nyxx-nyxn+1) &
           + (iz - nyzn + 1) * (nyxx-nyxn+1) * (nyyx-nyyn+1)
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
