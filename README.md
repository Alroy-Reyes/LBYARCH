1D Stencil Operation in C and x86-64 Assembly
- Reyes,Reynado -

Operation:
Y[i] = X[i-3] + X[i-2] + X[i-1] + X[i] + X[i+1] + X[i+2] + X[i+3]

-i index of the elements of X and Y
-X is the inputted array/ random value initialized
-Y output array of the result of the stencil operation

AVERAGE EXECUTION TIME

In getting the average excecution time, we get the execution time of the different sizes in C and assembly language. We ran the program 30 times in two different modes: Debug Mode and Release Mode.

This is the first 10 execution times in Debug Mode:

<img width="643" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/e82fb580-5400-453b-b8ce-b0f1a358aca6">


Analysis of Results

Debug Mode


<img width="277" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/1c8f7ba9-aa72-4965-b261-cfd5707b9c3f">

Release Mode


<img width="278" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/556e0a1b-0035-48ed-8586-8a876c4c8f02">

