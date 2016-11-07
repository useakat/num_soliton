      program soliton_finder
      implicitnone
      
      integer Ediv,uLdiv,i,j
      real*8 uL,duL,xmin,xmax
      real*8 uR,Emin,Emax,dE,E
      real*8 uLmin,uLmax,dduL

CCC     range of x-axis
      xmin = 0
      xmax = 1000

CCC   range of field value at the center
c      uLmin = 0.01554980
c      uLmax = 0.01554983
      uLdiv = 100 ! the number of scanning points
      duL = 0.0
    
CCC   Eigen value range
c      Emin = -0.0001208
c      Emax = -0.0001209
      Emin = 0d0
      Emax = -1d0
      Ediv = 100 ! the number of scanning points

      dduL = (uLmax -uLmin)/(uLdiv*1d0)
      dE = (Emax -Emin)/(Ediv*1d0)

CCC making data of field values at the right boundary
      open (2,file="uR.dat",status="replace")      
      do j = 1,uLdiv+1
         uL = uLmin +(j-1)*dduL
         do i = 1,Ediv+1
            E = Emin +(i-1)*dE
            call pde_solver(xmin,xmax,uL,duL,E,uR)
            write(2,*) uL, E, uR
         enddo
         write(2,*)
      enddo        
      close(2)

      end
      
      
