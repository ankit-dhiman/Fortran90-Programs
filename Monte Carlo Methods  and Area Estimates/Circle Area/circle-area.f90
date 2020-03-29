!  Monte carlo methods and Area estimation
!  Area of circle = (N_hits/N_counts)*(area of rectangle )
! area of square of length 2r is 4r^2
Program circle_area

integer  :: i,trials
real     :: x,y,radius,area_approx,area_true,pi_approx,hits,counts
real, parameter :: pi=3.141593,Area_square= r*r   !(unit squared) 

write(*,*)  
write(*,*)  "          Monte carlo method            "
write(*,*)
write(*,*)  " Area of circle using Monte Carlo Method "
write(*,*)  " ***************************************"
write(*,*)  
write(*,*)  
write(*,*)  " Enter the value for radius of the circle. "
read(*,*)    radius
write(*,*)  "Enter the total number of trials to be simulated"
read(*,*)    trials


hits   = 0
counts = 0
    do i=1,trials
    x= radius*rand()
    y= radius*rand()
    if ((x**2 + y**2).le.(radius*radius)) Then
        hits=hits + 1
        counts = counts + 1
    else
        counts = counts + 1
   endif
   end do

  area_approx = 4*(hits/counts)*(radius*radius)
  area_true   = pi*(radius**2)

  
  write(*,*)  " Estimated area of the circle =  " , area_approx  
  write(*,*)  " True area of the circle      =  " , area_true

  
end Program circle_area
