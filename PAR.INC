! Copyright to it's authors. See the COPYRIGHT file at the top-level directory
! of this distribution.
!
! This file is part of ansticc. It is subject to the license terms in the
! LICENSE file found in the top-level directory of this distribution. No part
! of ansticc, including this file, may be copied, modified, propagated, or
! distributed except according to the terms contained in the LICENSE file.

      PARAMETER(IA1=40,IA2=40)
      PARAMETER(IZ1=20,IZ2=20)
C
      PARAMETER(IATO=IA1+IA2,IZTO=IZ1+IZ2)
C
      PARAMETER(NSIZ=IZTO*30000)     ! may need to be increased
      COMMON/CIX/IXXI,IYYI,IZZI
      INTEGER(2) IXXI(NSIZ),IYYI(NSIZ),IZZI(NSIZ) !iwt=weight, BWB 2008-06-23
      INTEGER(2) IXXI2(NSIZ),IYYI2(NSIZ),IZZI2(NSIZ) !for 2nd species
C
      COMMON/CIV/IPO,IVAL,IEN
      DIMENSION IPO(NSIZ),IVAL(NSIZ)
      integer, dimension(nsiz) :: ipo2, ival2 !< for second species
