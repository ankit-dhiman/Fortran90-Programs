   ! UNCOMMENT THE COMMENTS  DOWN BELOW
   
   
   PROGRAM PROJECTILE_MOTION
   
    real ::  V_o ,V_x,V_y,launch_angle,t
    real ::   x ,y
    real , parameter :: g = 9.8 , pi=3.141593
    integer ::  t_final
    character :: yes ,choice , no
    
    write(*,*)  "   2-D     P R O J E C T I L E     M O T I O N     "
    write(*,*)  "***************************************************"
    write(*,*)  "" 
10  write(*,*)  "Give initial velocity and launch angle :    followed by a <return>" 
    read*,      V_o , launch_angle  
    
    if(((launch_angle<0).or.(launch_angle>90).or.(V_o<0))) then
      write(*,*) " launch angle should lie between 0 and 90 degreees !"
      goto 10
    endif
    
    theta_rad = 0.0000
    theta_rad = (launch_angle*pi)/(180)
    t_final = (2*V_o*sin(theta_rad)/g)
  
    x   = 0.000000
    y   = 0.000000

    V_ox = 0.0
    V_oy = 0.0
    
    x =   0.0 
    y =   0.0
    t= 0.0
    
    
       h_max = ((V_o*sin(theta_rad))**2)/(2*g)
       x_max = (4*h_max)/(tan(theta_rad))
       V_x = V_o*cos(theta_rad) 
        
    open(unit=1,file="x-ycoordinates.dat",status="new")

    do
        
        V_y = V_o*sin(theta_rad)-g*t
        x =  V_o*cos(theta_rad)*t
        y = V_o*sin(theta_rad)*t-(0.5* (g*t*t))
        write(1,*)  x ,y 
        t=t+0.005
        if(t>t_final)         exit            
                        
   end do
   close(1)
   
        write(*,*) ""
     
        write(*,*) " Total time of flight of the projectile           :", real(t_final) , "seconds"
        write(*,*) " Maximum height achieved by the projectile is :", h_max   , " meters "
        write(*,*) " Maximum range achieved by the projectile is  :",  x_max  , " meters"
        write(*,*) " Final vertical component of velocity         :",  V_y    , "meters per second"
       
   
   write(*,*) " continue ? (yes/no)  followed by  a  <return> "
   read*,     choice
   if(choice==yes) then
    goto10
    else 
    goto 30
    endif    
30   STOP
    END PROGRAM PROJECTILE_MOTION 

   
