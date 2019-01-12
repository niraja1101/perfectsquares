
#GROUP INFORMATION:

Number      Member names         UFID
  1        Niraja Ganpule      17451951
  2        Harshal Patil       55528581

#PROBLEM DEFINITION
Given two numbers n and k,find all numbers "num" between 1 and n, such that sum of squares of consecutive k integers starting from num is a perfect square of an integer.

Input 
The Input to the program will be the values n and k, given as commandline arguments

Output
The program will output every number "num" between 1 and n that is the solution of the problem.

#INSTRUCTIONS

The name of the submitted zip file is niraja_harshal.zip, unzip this file
and go into the unzipped folder. Here, go into the folder perfectsquare.
To run the application, open a terminal in the folder "perfectsquare". This is the application root directory of the Mix project created.

On the terminal, the application can be run with the command :
mix run -e Perfectsquare.main -- n k
Both n and k must be positive integers and if not the application will exit with error message on the standard output.

Example usage : mix run -e Perfectsquare.main -- 70 24 

#ACTOR MODELLING
The main function spawns multiple actors and assigns them work. The number of actors is a factor of n. The problem size n gets divided into subproblems of a fixed size and each actor solves the subproblem assigned to it. 

#ANSWERS

1. The size of the work unit we used is 500. Each actor solves 500 subproblems and prints the solution of each problem if any valid solution is found. This size was determined empirically by plotting a graph of the ratio of CPU time to real time on Y-axis against size of work unit on X-axis for various values of n ranging from small value to intermediate value to very large values.



As displayed in the graph attached as email, a batch size of 500 was the minimum amount of work that could be assigned to each actor, beyond this batch size the parallelism remained almost constant.

2. On running the program for the input n=1000000 and k=4 the output is the program returns no output, there is no valid solution for this value of n and k

3. For the above problem, the running time is:
Real 0m0.767s
User 0m1.345s
Sys  0m0.172s

The CPU time to real time ratio is 1.98 for this problem.

4. The largest problem we managed to solve is n=1000000000.

