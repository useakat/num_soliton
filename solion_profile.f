      program soliton_profile
      implicitnone
      
      integer Ediv,i
      real*8 uL,duL,xmin,xmax
      real*8 uR,Emin,Emax,dE,E

      xmin = 0
      xmax = 5300
c      uL = 0.005312646
c      uL = 0.0053126629535
      uL = 0.00532
      duL = 0.0      

c      E = -1.40706d-5 ! 600
c      E = -1.4124d-5  ! 1200
c      E = -1.4151d-5  ! 2400
c      E = -1.411184486d-5  ! 4800
c      E = -1.411193639d-5  ! 4800
      E = -1.415154826d-5  ! 4800

      call pde_solver(xmin,xmax,uL,duL,E,uR)

      end
      
      
