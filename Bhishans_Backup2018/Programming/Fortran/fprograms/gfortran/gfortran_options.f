      program test
c
c gfortran -Wall -fbounds-check -Wuninitialized \
c  -ffpe-trap=invalid,zero,overflow,underflow \
c  -fbacktrace -g -O fermi.f -o fermi
c gfortran -Wall -fbounds-check -Wuninitialized -ffpe-trap=invalid,zero,overflow,underflow -fbacktrace -g -O fermi_7501.f -o fermi
c see Hardy and Towner, Phys. Rev. C 91 025501 (2015)
c
c
c gfortran -Wall -fbounds-check -Wuninitialized -ffpe-trap=invalid,zero,overflow,underflow -fbacktrace gfortran_options.f
c
c clear; f95 fermi.f && ./a.out && rm a.out
c clear; gfortran -Wall fermi.f -o fermi && ./fermi && rm fermi

      implicit real*8 (a-h,o-z)

      print '(1x,a,/)','Tests of integrated Fermi Function'

      q=10.420d0
      z= 8.0d0
      a=16.0d0
      call f_int(f,q,a,z)
      print '(1x,a,f15.5)','16N -> 16O(g.s.)      f_int=',f

      q=2.83123d0    ! Qec for 14O -> 14N in MeV
      z=-7.0d0
      a=14.0d0
      call f_int(f,q,a,z)
      print '(1x,a,f15.5)','14O -> 14N            f_int=',f

      q=5.491662d0    ! Qec for 34Cl -> 34S in MeV
      z=-16.0d0
      a=34.0d0
      call f_int(f,q,a,z)
      print '(1x,a,f15.5)','34Cl -> 34S           f_int=',f

      q=4.12453d0
      z=-11.0d0
      a=22.0d0
      call f_int(f,q,a,z)
      print '(1x,a,f15.5)','22Mg -> 22Na(0.657)   f_int=',f

      stop
      end

      subroutine f_int(fint,q,a,z)

c
c fint = integrated fermi function
c q = beta-decay Q-value (for beta minus decay)
c       electron capture Q-value in MeV (beta plus decay)
c a = mass number of nucleus
c z = atomic number of daughter nucleus,
c     note z>0 for beta minus decay, z<0 for beta plus decay
c

      implicit real*8 (a-h,o-z)
      data qme/0.51099906d0/ ! electron mass in MeV

      if (z .gt. 0.0d0) then
        w0=q/qme+1.0d0
      else
        w0=q/qme-1.0d0
      endif
      wmin=1.0d0
      npts=2001      ! npts should be an odd number for Simpson's
      fsum=0.0d0
      iw=1
      dw=(w0-wmin)/dfloat(npts-1)
      do i=1,npts
        w=wmin+dfloat(i-1)*dw
        wt=w*w-1.0d0
        if (wt.gt.0.0d0) then
          p=dsqrt(wt)             ! electron momentum
        else
          p=0.0d0
        endif
        call fermi(w,f,a,z)
        fstat=p*w*(w0-w)**2*f
        fsum=fsum+dfloat(iw)*fstat
        if (i.eq.npts-1) then
          iw=1
        elseif (iw.eq.4) then
          iw=2
        else
          iw=4
        endif
      enddo
      fint=fsum*dw/3.0d0

      return
      end

      subroutine fermi(w,f,a,z)
c
c w = electron or positron total energy
c f = fermi function
c a = mass number
c z = atomic number of daughter nucleus
c
c calculate the Fermi function F=L_0 * F_0 using
c Behrens / Buhring method: Eqs. 4.8, 4.9, and 4.126
c energy is in units of Me * c**2
c momentum is in units of Me * c
c
c note: z>0 for electrons, z<0 for positrons
c
      implicit real*8 (a-h,o-z)

      complex*16 wgamma,wx,wy,qi
c
c note: r= BB nuclear radius
c unites of r are h-bar / ( Me * c )
c
      qi=complex(0.0d0,1.0d0)
      pi=4.0d0*atan(1.0d0)
      fine=1.0d0/137.0359895d0  ! fine structure constant
      r0=0.42587d0*fine           ! BB radius parameter
      r=r0*a**(1.0d0/3.0d0)

      g1=dsqrt(1.0d0-(fine*z)**2)
      wt=w*w-1.0d0
      if (wt.gt.1.0d-10) then
        p=dsqrt(wt)             ! electron momentum
        y=fine*z*w/p
        wx=g1+qi*y
        wy=wgamma(wx)
        vx=2.0d0*g1+1.0d0
        vy=ddgamma(vx)
        f0=4.0d0*(2.0d0*p*r)**(-2.0d0*(1.0d0-g1))*
     &     exp(pi*y) * dreal (wy * conjg(wy) ) / (vy * vy)
        ql0=1.0d0 - fine*z*w*r + 13.0d0/60.0d0*(fine*z)**2 -
     &      0.5d0*fine*z*r/w
        f=ql0*f0
      else
        f=0.0d0
      endif

      return
      end

c
c The code below has been take from the CERN Program Library, 2006 version
c http://cernlib.web.cern.ch/cernlib/version.html
c DDGAMMA gives the gamma function of a real aguemnt
c WGAMMA gives the gamma function of a complex arguement
c

      FUNCTION DDGAMMA(X)
C
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='GAMMA/DGAMMA')
C
      CHARACTER*80 ERRTXT

      DIMENSION C(0:15)

      DATA C( 0) /3.65738 77250 83382 44D0/
      DATA C( 1) /1.95754 34566 61268 27D0/
      DATA C( 2) /0.33829 71138 26160 39D0/
      DATA C( 3) /0.04208 95127 65575 49D0/
      DATA C( 4) /0.00428 76504 82129 09D0/
      DATA C( 5) /0.00036 52121 69294 62D0/
      DATA C( 6) /0.00002 74006 42226 42D0/
      DATA C( 7) /0.00000 18124 02333 65D0/
      DATA C( 8) /0.00000 01096 57758 66D0/
      DATA C( 9) /0.00000 00059 87184 05D0/
      DATA C(10) /0.00000 00003 07690 81D0/
      DATA C(11) /0.00000 00000 14317 93D0/
      DATA C(12) /0.00000 00000 00651 09D0/
      DATA C(13) /0.00000 00000 00025 96D0/
      DATA C(14) /0.00000 00000 00001 11D0/
      DATA C(15) /0.00000 00000 00000 04D0/

      U=X
      IF(U .LE. 0) THEN
       WRITE(ERRTXT,101) U
       CALL MTLPRT(NAME,'C302.1',ERRTXT)
       H=0
       GO TO 9
      ENDIF
    8 F=1
      IF(U .LT. 3) THEN
       DO 1 I = 1,INT(4-U)
       F=F/U
    1  U=U+1
      ELSE
       DO 2 I = 1,INT(U-3)
       U=U-1
    2  F=F*U
      END IF
      H=U+U-7
      ALFA=H+H
      B1=0
      B2=0
      DO 3 I = 15,0,-1
      B0=C(I)+ALFA*B1-B2
      B2=B1
    3 B1=B0
    9 DDGAMMA=F*(B0-H*B2)
      RETURN
  101 FORMAT('ARGUMENT IS NEGATIVE = ',1P,E15.1)
      END

      FUNCTION WGAMMA(Z)

      IMPLICIT DOUBLE PRECISION (A-H,I,O-Z)
      COMPLEX*16 WGAMMA
      COMPLEX*16 Z,U,V,F,H,S
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
      PARAMETER (NAME = 'CGAMMA/WGAMMA')
      DIMENSION C(0:15)

      PARAMETER (Z1 = 1, HF = Z1/2)

      DATA PI /3.14159 26535 89793 24D0/
      DATA C1 /2.50662 82746 31000 50D0/

      DATA C( 0) / 41.62443 69164 39068D0/
      DATA C( 1) /-51.22424 10223 74774D0/
      DATA C( 2) / 11.33875 58134 88977D0/
      DATA C( 3) / -0.74773 26877 72388D0/
      DATA C( 4) /  0.00878 28774 93061D0/
      DATA C( 5) / -0.00000 18990 30264D0/
      DATA C( 6) /  0.00000 00019 46335D0/
      DATA C( 7) / -0.00000 00001 99345D0/
      DATA C( 8) /  0.00000 00000 08433D0/
      DATA C( 9) /  0.00000 00000 01486D0/
      DATA C(10) / -0.00000 00000 00806D0/
      DATA C(11) /  0.00000 00000 00293D0/
      DATA C(12) / -0.00000 00000 00102D0/
      DATA C(13) /  0.00000 00000 00037D0/
      DATA C(14) / -0.00000 00000 00014D0/
      DATA C(15) /  0.00000 00000 00006D0/

      U=Z
      X=U
      IF(imagpart(U) .EQ. 0 .AND. -ABS(X) .EQ. INT(X)) THEN
       F=0
       H=0
       WRITE(ERRTXT,101) X
       CALL MTLPRT(NAME,'C305.1',ERRTXT)
      ELSE
       IF(X .GE. 1) THEN
        F=1
        V=U
       ELSEIF(X .GE. 0) THEN
        F=1/U
        V=1+U
       ELSE
        F=1
        V=1-U
       END IF
       H=1
       S=C(0)
       DO 1 K = 1,15
       H=((V-K)/(V+(K-1)))*H
    1  S=S+C(K)*H
       H=V+(4+HF)
       H=C1*EXP((V-HF)*LOG(H)-H)*S
       IF(X .LT. 0) H=PI/(SIN(PI*U)*H)
      ENDIF
      WGAMMA=F*H

      RETURN
  101 FORMAT('ARGUMENT EQUALS NON-POSITIVE INTEGER = ',1P,E15.1)
      END

      SUBROUTINE MTLPRT(NAME,ERC,TEXT)
      CHARACTER*(*) NAME,ERC,TEXT
      LOGICAL LMF,LRF

      IF(ERC(5:6).NE.'.0') THEN
        CALL MTLMTR(ERC,MLG,LMF,LRF)
      ELSE
        LMF=.TRUE.
        LRF=.FALSE.
      ENDIF
      IF(LMF) THEN
        LT=LENOCC(TEXT)
        IF(MLG .LT. 1) WRITE(  *,100) ERC(1:4),NAME,ERC,TEXT(1:LT)
        IF(MLG .GE. 1) WRITE(MLG,100) ERC(1:4),NAME,ERC,TEXT(1:LT)
      ENDIF
      IF(.NOT.LRF) CALL ABEND
      RETURN
100   FORMAT(7X,'***** CERN ',A,1X,A,' ERROR ',A,': ',A)
      END

      SUBROUTINE MTLSET(ERC,NLG,MXM,MXR)

      PARAMETER (KTE = 132)
      CHARACTER*6 ERC,CODE(KTE)
      LOGICAL LMF,LRF
      DIMENSION KNTM(KTE),KNTR(KTE)

      DATA ILG /0/

C     renumber the data statements after putting new codes in Unix with:
C     awk -F'[()]' '{ printf"%s(%s)%s(%s)%s(%s)%s\n",$1,NR,$3,NR,$5,NR,$7 }'
C     and modify KTE to the number of lines below

      DATA CODE(1),KNTM(1),KNTR(1) / 'B100.1', 255, 255 /
      DATA CODE(2),KNTM(2),KNTR(2) / 'B300.1', 255, 255 /
      DATA CODE(3),KNTM(3),KNTR(3) / 'B300.2', 255, 255 /
      DATA CODE(4),KNTM(4),KNTR(4) / 'C200.0', 255, 255 /
      DATA CODE(5),KNTM(5),KNTR(5) / 'C200.1', 255, 255 /
      DATA CODE(6),KNTM(6),KNTR(6) / 'C200.2', 255, 255 /
      DATA CODE(7),KNTM(7),KNTR(7) / 'C200.3', 255, 255 /
      DATA CODE(8),KNTM(8),KNTR(8) / 'C201.0', 255, 255 /
      DATA CODE(9),KNTM(9),KNTR(9) / 'C202.0', 255, 255 /
      DATA CODE(10),KNTM(10),KNTR(10) / 'C202.1', 255, 255 /
      DATA CODE(11),KNTM(11),KNTR(11) / 'C202.2', 255, 255 /
      DATA CODE(12),KNTM(12),KNTR(12) / 'C205.1', 255, 255 /
      DATA CODE(13),KNTM(13),KNTR(13) / 'C205.2', 255, 255 /
      DATA CODE(14),KNTM(14),KNTR(14) / 'C207.0', 255, 255 /
      DATA CODE(15),KNTM(15),KNTR(15) / 'C208.0', 255, 255 /
      DATA CODE(16),KNTM(16),KNTR(16) / 'C209.0', 255, 255 /
      DATA CODE(17),KNTM(17),KNTR(17) / 'C209.1', 255, 255 /
      DATA CODE(18),KNTM(18),KNTR(18) / 'C209.2', 255, 255 /
      DATA CODE(19),KNTM(19),KNTR(19) / 'C209.3', 255, 255 /
      DATA CODE(20),KNTM(20),KNTR(20) / 'C210.1', 255, 255 /
      DATA CODE(21),KNTM(21),KNTR(21) / 'C302.1', 255, 255 /
      DATA CODE(22),KNTM(22),KNTR(22) / 'C303.1', 255, 255 /
      DATA CODE(23),KNTM(23),KNTR(23) / 'C304.1', 255, 255 /
      DATA CODE(24),KNTM(24),KNTR(24) / 'C305.1', 255, 255 /
      DATA CODE(25),KNTM(25),KNTR(25) / 'C306.1', 255, 255 /
      DATA CODE(26),KNTM(26),KNTR(26) / 'C307.1', 255, 255 /
      DATA CODE(27),KNTM(27),KNTR(27) / 'C312.1', 255, 255 /
      DATA CODE(28),KNTM(28),KNTR(28) / 'C313.1', 255, 255 /
      DATA CODE(29),KNTM(29),KNTR(29) / 'C315.1', 255, 255 /
      DATA CODE(30),KNTM(30),KNTR(30) / 'C316.1', 255, 255 /
      DATA CODE(31),KNTM(31),KNTR(31) / 'C316.2', 255, 255 /
      DATA CODE(32),KNTM(32),KNTR(32) / 'C320.1', 255, 255 /
      DATA CODE(33),KNTM(33),KNTR(33) / 'C321.1', 255, 255 /
      DATA CODE(34),KNTM(34),KNTR(34) / 'C323.1', 255, 255 /
      DATA CODE(35),KNTM(35),KNTR(35) / 'C327.1', 255, 255 /
      DATA CODE(36),KNTM(36),KNTR(36) / 'C328.1', 255, 255 /
      DATA CODE(37),KNTM(37),KNTR(37) / 'C328.2', 255, 255 /
      DATA CODE(38),KNTM(38),KNTR(38) / 'C328.3', 255, 255 /
      DATA CODE(39),KNTM(39),KNTR(39) / 'C330.1', 255, 255 /
      DATA CODE(40),KNTM(40),KNTR(40) / 'C330.2', 255, 255 /
      DATA CODE(41),KNTM(41),KNTR(41) / 'C330.3', 255, 255 /
      DATA CODE(42),KNTM(42),KNTR(42) / 'C331.1', 255, 255 /
      DATA CODE(43),KNTM(43),KNTR(43) / 'C331.2', 255, 255 /
      DATA CODE(44),KNTM(44),KNTR(44) / 'C334.1', 255, 255 /
      DATA CODE(45),KNTM(45),KNTR(45) / 'C334.2', 255, 255 /
      DATA CODE(46),KNTM(46),KNTR(46) / 'C334.3', 255, 255 /
      DATA CODE(47),KNTM(47),KNTR(47) / 'C334.4', 255, 255 /
      DATA CODE(48),KNTM(48),KNTR(48) / 'C334.5', 255, 255 /
      DATA CODE(49),KNTM(49),KNTR(49) / 'C334.6', 255, 255 /
      DATA CODE(50),KNTM(50),KNTR(50) / 'C336.1', 255, 255 /
      DATA CODE(51),KNTM(51),KNTR(51) / 'C337.1', 255, 255 /
      DATA CODE(52),KNTM(52),KNTR(52) / 'C338.1', 255, 255 /
      DATA CODE(53),KNTM(53),KNTR(53) / 'C340.1', 255, 255 /
      DATA CODE(54),KNTM(54),KNTR(54) / 'C343.1', 255, 255 /
      DATA CODE(55),KNTM(55),KNTR(55) / 'C343.2', 255, 255 /
      DATA CODE(56),KNTM(56),KNTR(56) / 'C343.3', 255, 255 /
      DATA CODE(57),KNTM(57),KNTR(57) / 'C343.4', 255, 255 /
      DATA CODE(58),KNTM(58),KNTR(58) / 'C344.1', 255, 255 /
      DATA CODE(59),KNTM(59),KNTR(59) / 'C344.2', 255, 255 /
      DATA CODE(60),KNTM(60),KNTR(60) / 'C344.3', 255, 255 /
      DATA CODE(61),KNTM(61),KNTR(61) / 'C344.4', 255, 255 /
      DATA CODE(62),KNTM(62),KNTR(62) / 'C345.1', 255, 255 /
      DATA CODE(63),KNTM(63),KNTR(63) / 'C346.1', 255, 255 /
      DATA CODE(64),KNTM(64),KNTR(64) / 'C346.2', 255, 255 /
      DATA CODE(65),KNTM(65),KNTR(65) / 'C346.3', 255, 255 /
      DATA CODE(66),KNTM(66),KNTR(66) / 'C347.1', 255, 255 /
      DATA CODE(67),KNTM(67),KNTR(67) / 'C347.2', 255, 255 /
      DATA CODE(68),KNTM(68),KNTR(68) / 'C347.3', 255, 255 /
      DATA CODE(69),KNTM(69),KNTR(69) / 'C347.4', 255, 255 /
      DATA CODE(70),KNTM(70),KNTR(70) / 'C347.5', 255, 255 /
      DATA CODE(71),KNTM(71),KNTR(71) / 'C347.6', 255, 255 /
      DATA CODE(72),KNTM(72),KNTR(72) / 'C348.1', 255, 255 /
      DATA CODE(73),KNTM(73),KNTR(73) / 'C349.1', 255, 255 /
      DATA CODE(74),KNTM(74),KNTR(74) / 'C349.2', 255, 255 /
      DATA CODE(75),KNTM(75),KNTR(75) / 'C349.3', 255, 255 /
      DATA CODE(76),KNTM(76),KNTR(76) / 'D101.1', 255, 255 /
      DATA CODE(77),KNTM(77),KNTR(77) / 'D103.1', 255, 255 /
      DATA CODE(78),KNTM(78),KNTR(78) / 'D104.1', 255, 255 /
      DATA CODE(79),KNTM(79),KNTR(79) / 'D104.2', 255, 255 /
      DATA CODE(80),KNTM(80),KNTR(80) / 'D105.1', 255, 255 /
      DATA CODE(81),KNTM(81),KNTR(81) / 'D105.2', 255, 255 /
      DATA CODE(82),KNTM(82),KNTR(82) / 'D107.1', 255, 255 /
      DATA CODE(83),KNTM(83),KNTR(83) / 'D110.0', 255, 255 /
      DATA CODE(84),KNTM(84),KNTR(84) / 'D110.1', 255, 255 /
      DATA CODE(85),KNTM(85),KNTR(85) / 'D110.2', 255, 255 /
      DATA CODE(86),KNTM(86),KNTR(86) / 'D110.3', 255, 255 /
      DATA CODE(87),KNTM(87),KNTR(87) / 'D110.4', 255, 255 /
      DATA CODE(88),KNTM(88),KNTR(88) / 'D110.5', 255, 255 /
      DATA CODE(89),KNTM(89),KNTR(89) / 'D110.6', 255, 255 /
      DATA CODE(90),KNTM(90),KNTR(90) / 'D113.1', 255, 255 /
      DATA CODE(91),KNTM(91),KNTR(91) / 'D201.1', 255, 255 /
      DATA CODE(92),KNTM(92),KNTR(92) / 'D202.1', 255, 255 /
      DATA CODE(93),KNTM(93),KNTR(93) / 'D401.1', 255, 255 /
      DATA CODE(94),KNTM(94),KNTR(94) / 'D601.1', 255, 255 /
      DATA CODE(95),KNTM(95),KNTR(95) / 'E210.1', 255, 255 /
      DATA CODE(96),KNTM(96),KNTR(96) / 'E210.2', 255, 255 /
      DATA CODE(97),KNTM(97),KNTR(97) / 'E210.3', 255, 255 /
      DATA CODE(98),KNTM(98),KNTR(98) / 'E210.4', 255, 255 /
      DATA CODE(99),KNTM(99),KNTR(99) / 'E210.5', 255, 255 /
      DATA CODE(100),KNTM(100),KNTR(100) / 'E210.6', 255, 255 /
      DATA CODE(101),KNTM(101),KNTR(101) / 'E210.7', 255, 255 /
      DATA CODE(102),KNTM(102),KNTR(102) / 'E211.0', 255, 255 /
      DATA CODE(103),KNTM(103),KNTR(103) / 'E211.1', 255, 255 /
      DATA CODE(104),KNTM(104),KNTR(104) / 'E211.2', 255, 255 /
      DATA CODE(105),KNTM(105),KNTR(105) / 'E211.3', 255, 255 /
      DATA CODE(106),KNTM(106),KNTR(106) / 'E211.4', 255, 255 /
      DATA CODE(107),KNTM(107),KNTR(107) / 'E406.0', 255, 255 /
      DATA CODE(108),KNTM(108),KNTR(108) / 'E406.1', 255, 255 /
      DATA CODE(109),KNTM(109),KNTR(109) / 'E407.0', 255, 255 /
      DATA CODE(110),KNTM(110),KNTR(110) / 'E408.0', 255, 255 /
      DATA CODE(111),KNTM(111),KNTR(111) / 'E408.1', 255, 255 /
      DATA CODE(112),KNTM(112),KNTR(112) / 'F500.0', 255, 255 /
      DATA CODE(113),KNTM(113),KNTR(113) / 'F500.1', 255, 255 /
      DATA CODE(114),KNTM(114),KNTR(114) / 'F500.2', 255, 255 /
      DATA CODE(115),KNTM(115),KNTR(115) / 'F500.3', 255, 255 /
      DATA CODE(116),KNTM(116),KNTR(116) / 'G100.1', 255, 255 /
      DATA CODE(117),KNTM(117),KNTR(117) / 'G100.2', 255, 255 /
      DATA CODE(118),KNTM(118),KNTR(118) / 'G101.1', 255, 255 /
      DATA CODE(119),KNTM(119),KNTR(119) / 'G101.2', 255, 255 /
      DATA CODE(120),KNTM(120),KNTR(120) / 'G105.1', 255, 255 /
      DATA CODE(121),KNTM(121),KNTR(121) / 'G106.1', 255, 255 /
      DATA CODE(122),KNTM(122),KNTR(122) / 'G106.2', 255, 255 /
      DATA CODE(123),KNTM(123),KNTR(123) / 'G116.1', 255, 255 /
      DATA CODE(124),KNTM(124),KNTR(124) / 'G116.2', 255, 255 /
      DATA CODE(125),KNTM(125),KNTR(125) / 'H101.0', 255, 255 /
      DATA CODE(126),KNTM(126),KNTR(126) / 'H101.1', 255, 255 /
      DATA CODE(127),KNTM(127),KNTR(127) / 'H101.2', 255, 255 /
      DATA CODE(128),KNTM(128),KNTR(128) / 'H301.1', 255, 255 /
      DATA CODE(129),KNTM(129),KNTR(129) / 'U501.1', 255, 255 /
      DATA CODE(130),KNTM(130),KNTR(130) / 'V202.1', 255, 255 /
      DATA CODE(131),KNTM(131),KNTR(131) / 'V202.2', 255, 255 /
      DATA CODE(132),KNTM(132),KNTR(132) / 'V202.3', 255, 255 /

      ILG=NLG
      L=0
      IF(ERC .NE. ' ') THEN
       DO 10 L = 1,6
       IF(ERC(1:L) .EQ. ERC) GOTO 12
   10  CONTINUE
   12  CONTINUE
      ENDIF
      DO 14 I = 1,KTE
      IF(L .EQ. 0 .OR. CODE(I)(1:L) .EQ. ERC(1:L)) THEN
       IF(MXM .GE. 0) KNTM(I)=MXM
       IF(MXR .GE. 0) KNTR(I)=MXR
      ENDIF
   14 CONTINUE
      RETURN

      ENTRY MTLMTR(ERC,MLG,LMF,LRF)

      MLG=ILG
      DO 20 I = 1,KTE
      IF(ERC .EQ. CODE(I))  GOTO 21
   20 CONTINUE
      WRITE(*,100) ERC
      CALL ABEND
      RETURN

   21 LMF=KNTM(I) .GE. 1
      LRF=KNTR(I) .GE. 1
      IF(LMF .AND. KNTM(I) .LT. 255)  KNTM(I)=KNTM(I)-1
      IF(LRF .AND. KNTR(I) .LT. 255)  KNTR(I)=KNTR(I)-1
      IF(.NOT.LRF) THEN
       IF(ILG .LT. 1) WRITE(  *,101) CODE(I)
       IF(ILG .GE. 1) WRITE(ILG,101) CODE(I)
      ENDIF
      RETURN
  100 FORMAT(7X,'***** CERN N002 MTLSET ... ERROR N002: ',
     1'ERROR CODE ',A6,' NOT RECOGNIZED BY ERROR MONITOR. RUN ABORTED.')
  101 FORMAT(7X,'***** CERN N002 MTLSET ... ERROR NOO2.1: ',
     1'RUN TERMINATED BY LIBRARY ERROR CONDITION ',A6)
      END


      FUNCTION LENOCC (CHV)
C
C CERN PROGLIB# M507    LENOCC          .VERSION KERNFOR  4.21  890323
C ORIG. March 85, A.Petrilli, re-write 21/02/89, JZ
C
C-    Find last non-blank character in CHV

      CHARACTER    CHV*(*)

      N = LEN(CHV)

      DO 17  JJ= N,1,-1
      IF (CHV(JJ:JJ).NE.' ') GO TO 99
   17 CONTINUE
      JJ = 0

   99 LENOCC = JJ
      RETURN
      END

      SUBROUTINE ABEND
C
C CERN PROGLIB# Z035    ABEND           .VERSION KERNFOR  4.31  911111
C ORIG.  8/02/88  JZ
C

      STOP  7
      END
