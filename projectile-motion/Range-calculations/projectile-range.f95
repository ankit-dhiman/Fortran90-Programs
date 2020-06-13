    PROGRAM PROJECTILE_MOTION

    IMPLICIT NONE
    INTEGER::            I,J
    REAL   ::            X_VELOCITY,Y_VELOCITY,THETA_DEGREES,THETA_RAD,TIME !m/s^2Y 
    REAL   ::            X_DISTANCE,Y_DISTANCE,THETA, RANGE_MAX , INITIAL_VELOCITY 
    REAL,PARAMETER   ::  PI=3.141593, G= 9.8 


    WRITE(*,*)   ""
    WRITE(*,*)   "      P R O J E C T I L E         M O T I O N "
    WRITE(*,*)   ""
    WRITE(*,*)   "**********************************************************"
    WRITE(*,*)   ""
    WRITE(*,*)   "          VARIATION OF RANGE WITH ANGLE OF PROJECTION         "
    WRITE(*,*)   "----------------------------------------------------------   "
       
    WRITE(*,*)   " PLEASE GIVE INITIAL VELOCITY OF PROJECTILE :     " 
    READ*,         INITIAL_VELOCITY 
    
    OPEN(UNIT=31,FILE="RANGE-DATA2.dat",STATUS="NEW") 
        
    THETA = 0.00001
    DO J = 1, 90
      THETA =J*PI/180
      IF ((THETA<=1.8)) THEN
        RANGE_MAX = ((INITIAL_VELOCITY**2)*SIN(2*THETA))/G
        WRITE(31,*)  J , RANGE_MAX
    ENDIF
    END DO
  
    CLOSE(31)
    STOP
    END PROGRAM PROJECTILE_MOTION 
