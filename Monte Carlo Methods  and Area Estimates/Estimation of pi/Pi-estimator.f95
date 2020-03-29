

!  VARIABLES  USED
!  Inside_points:   NUMBER OF POINTS GENERATED INSIDE THE CIRCLE
!  Total_points :   NUMBER OF POINTS GENERATED INSIDE THE SQUARE OF DIMENSIONS 1*1 UNIT SQUARED
!  Distance     :   DISTANCE OF SAMPLE POINT FROM CENTER OF CIRCLE/ORIGIN


!**********************************************************************
!                   START OF MAIN PROGRAM
!**********************************************************************






Program Pi_Estimator

Real:: inside_points, total_points, distance,x_val,y_val , pi
Integer:: i ,trial_runs
real, parameter:: pi_true = 3.14159265
character (len= 50) :: response , y, n



        write(*,*)  "V A L U E    O F    P I    U S I N G    M O N T E    C A R L O    M E T H O D  "
        write(*,*)  "*****************************************************************************"
        write(*,*)  
10      write(*,*)  "Enter the total number of trials to be simulated."
        read*,   trial_runs

        inside_points = 0
        total_points  = 0
        distance      = 0 



        open(unit=1,file="newset.dat",status="new")
        do i=1 , trial_runs
        x_val=rand()
        y_val=rand()
        distance= x_val**2 + y_val**2
        
        if (distance<=1) then
            inside_points=inside_points + 1
            total_points = total_points + 1
        else
            total_points = total_points + 1
        endif
        pi = 4*DBLE(inside_points/total_points)    
        write(1,*) i,pi
        end do
        close(1)

        

      write(*,*) "inside points: " , inside_points , " total points : ",total_points
      write(*,*) 
      write(*,*) " Value of pi : " , pi
        
      write(*,*) "Do you want to try again (y/n) "
      read*, response
         goto 10
      else
          write(*,*) " Have a nice day !"
          goto 20
      endif   

20      stop
        End program Pi_Estimator
