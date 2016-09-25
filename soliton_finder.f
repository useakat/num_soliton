      program soliton_finder
      implicitnone
      
      integer Ediv,uLdiv,i,j
      real*8 uL,duL,xmin,xmax
      real*8 uR,Emin,Emax,dE,E
      real*8 uLmin,uLmax,dduL

      xmin = 0
      xmax = 1200

      uLmin = 0.01554980
      uLmax = 0.01554983
      uLdiv = 100
      duL = 0.0
      
      Emin = -0.0001208
      Emax = -0.0001209
      Ediv = 100

      dduL = (uLmax -uLmin)/(uLdiv*1d0)
      dE = (Emax -Emin)/(Ediv*1d0)

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
      
      
