<h1>1D Stencil Operation in C and x86-64 Assembly</h1>
Reyes, Alroy Leon
Reynado, Alyza

<h2>Operation:</h2>
Y[i] = X[i-3] + X[i-2] + X[i-1] + X[i] + X[i+1] + X[i+2] + X[i+3]

-i index of the elements of X and Y
-X is the inputted array/ random value initialized
-Y output array of the result of the stencil operation



<h2>Comparative Analysis</h2>
<h3>Average Execution Time</h3>

In getting the average excecution time, we get the execution time of the different sizes in C and assembly language. We ran the program 30 times in two different modes: Debug Mode and Release Mode.


<h3>Debug Mode</h3>

First 10 execution times

<img width="643" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/e82fb580-5400-453b-b8ce-b0f1a358aca6">


Final Average

<img width="277" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/1c8f7ba9-aa72-4965-b261-cfd5707b9c3f">



<h3>Release Mode</h3>

First 10 execution times

<img width="642" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/feb413b7-ca75-4e36-a8be-754443080ab1">


Final Average

<img width="278" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/556e0a1b-0035-48ed-8586-8a876c4c8f02">



<h2>Outputs</h2>

Debug Mode

<img width="880" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/703aa2eb-ea38-4fee-ae6a-d060ae388e12">


Release Mode

<img width="877" alt="image" src="https://github.com/Alroy-Reyes/LBYARCH/assets/98019015/69689e5d-717a-44f3-a683-75f94112c9ce">



<h2>Analysis of Results</h2>




