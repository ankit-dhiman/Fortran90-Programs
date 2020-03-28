# Monte carlo methods and area calculations


### So, What are Monte Carlo methods?

Monte carlo  methods are a set of computational algorithms which uses  the process of repeated random sampling 
to make numerical estimations of unknown parameters , as described by the Russian Mathematician Sobol:

>The Monte Carlo method is a numerical method of solving mathematical problems by random sampling (or by the simulation of random variables).

For more in detail study of monte carlo methods , I would like you to go ahead and visit [scratchpixel](https://www.scratchapixel.com/lessons/mathematics-physics-for-computer-graphics/monte-carlo-methods-in-practice/monte-carlo-methods) or [overview of monte carlo methods](https://towardsdatascience.com/an-overview-of-monte-carlo-methods-675384eb1694).

### Multidimensional monte carlo integration

A classical example of the Monte Carlo integration approach is to determine the area of a circular "pond" by throwing stones into it.

If we know:
 the total area Atot over which you are throwing the stones, and   that the locations (including the pond and its surrounding area) where they landed are uniformly and randomly distributed then the area of the pond is determined as the ratio of the number of stones that hit the pond compared to the total number, multiplied by the total area 
`Apond = (Nhit/Ntot )* Atot`

Multi-dimensional Monte Carlo integration implements this by throwing random numbers into a multi-dimensional space and determining when the values of these random numbers fall inside or outside of the boundary of the volume.


## Algorithm for calculating approximating the area of a circle using MC method

1. generate two uniform random deviates x and y  over an interval [0,1], This can be done in Fortran using intrinsic function `rand()` . This function returns real value between 0 and 1.
2. calculate the Cartesian distance r to the point they correspond to, `r^2 = x^2 + y^2`. This means that find the distance of random point from origin.
3. Test if r falls within the circle determined by the maximum radius of integration R,i.e check wether the the random poin generated lies within the circle or not.
4. If r <= R, count this test as a "hit", and increase both the `hit` and `count` by 1
5. If r>R count the test as a "miss", increase the total `count` by 1,while leaving the `hit` var unchanged.
6. After N total trials, the area of the circle is approximated by    `4*(Nhit / N) * R^2`

where 4R^2 is the area of the box with sides D=2R in length which circumscribes the circle
Similary the area can be approximated for more common known as well as unknown shapes whose area is hard to calculate analytically.


