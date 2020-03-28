! Monte carlo Simulation
! Evaluating area of a ellipse usng Monte carlo method.
! ni = total number of trials
! a,b = major and minor axis of an ellipse respectively.


!       INPUT VARIABLES
!   a = Length of the major axis 
!   b = Length of the minor axis
!  ni = Total number of trials



! .......................................................!
!
!
!           Start of Main Program 
!
!
! .......................................................!




Program Ellipse_Area
implicit none

integer ::ni,k
real  ::  a , b,pi=3.141592,x,y,approx_area,area_ellipse
real  :: ah, count


write(*,*)
print*,    "Area of an Ellipse using Monte carlo simulation" 
write(*,*)
print*,    "***********************************************"
write(*,*)
print*,    " a = major axis , b = minor axis "

print*,    "Please enter  the values for a  and b respectively."
read*,      a ,b
print*,    "Enter the number of trials . "
read*,      ni
write(*,*)
write(*,*)
ah=0
count=0

do 20 k=1, ni
   x=a*rand()
   y=b*rand()
          
   if ((x**2)/(a**2)+(y**2)/(b**2).le.1)then
      ah=ah+1
      count= count+1
      else 
         count= count+1
      endif
20    continue

write(*,*)
print*, " Total hits = " , ah , " Total counts = " ,count

! Total area will be four times the area of first quadrant,since ellipse is symmeterical along major and minor axis

    approx_area =4*(ah/count)*(a*b)
    area_ellipse =(a*b*pi)

write(*,*)
print*, "using monte carlo simulation area of ellipse is =" , approx_area
print*, "Actual area is =", area_ellipse
write(*,*)     

stop
end Program Ellipse_area              
      
