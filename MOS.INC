      PARAMETER(PTMX=.8,PLMN=.8,PLMX=.9) ! p-transverse max, p-longitudinal min (neg), p-long max of momentum region
!      real (kind=REAL64), parameter :: vtmx = 0.65, vlmn=0.65, vlmx=0.69 !< velocities based on above momenta that assume protons
      PARAMETER(DPTL=0.025)  ! width of momentum cell

      ! number of cells in transverse and longitudinal directions. in transverse, i=-nt,nt
      PARAMETER(NT=int(PTMX/DPTL+.5),NLM=int(PLMN/DPTL+.5)
     &          ,NLX=int(PLMX/DPTL+.5))
!      COMMON/IUR/IMN,IMX
!      DIMENSION IMN(-NT:NT,-NT:NT,-NLM:NLX)
!      DIMENSION IMX(-NT:NT,-NT:NT,-NLM:NLX)
!      DIMENSION IMN2(-NT:NT,-NT:NT,-NLM:NLX)
!      DIMENSION IMX2(-NT:NT,-NT:NT,-NLM:NLX)
C
      PARAMETER(NLL1=NLM+NLX+1)       !< total number of cells in long-direction
      PARAMETER(NTL1=(NT+NT+1)*NLL1)  !< total number of cells in 2D x-z plane
      PARAMETER(MAXIPO=NT*NT*NLL1*10)
