      subroutine pde_solver(xmin,xmax,uL,duL,E,uR)
      implicitnone
      
      integer ndiv,i,imono_flag
      parameter (ndiv=10000)
      real*8 u(0:ndiv+1),uL,duL,dx,E,x(0:ndiv+1),xmin,xmax
      real*8 uRm,uR,tol

      dx = (xmax -xmin)/(ndiv*1d0)
      u(0) = uL
      u(1) = uL +duL*dx
      do i = 1,ndiv-1
         u(i+1) = 2*u(i) -u(i-1) -u(i)**3/(1d0 +u(i)**2)*dx**2 
     &        -E*u(i)*dx**2
      enddo

      imono_flag = 1
      tol = uL/100.
      do i = 1,ndiv-100
         if (u(i+100) .gt. u(i) +tol) then
            imono_flag = 0
         endif
      enddo

      open(1,file="u.dat",status="replace")
      do i = 0,ndiv
         write(1,*) xmin +i*dx, u(i)
      enddo
      close(1)

      uR = 0.1
      if (imono_flag .eq. 1) then
         if (u(ndiv) > -tol) then
            uR = dabs(u(ndiv))
         endif
      endif

      return
      end
      
      
