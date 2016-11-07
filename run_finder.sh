#!/bin/bash

###
### 1. Find soliton-like configurations using following procedure
###
### 1-1. set the field value and its derivative at the left boundary as 0 and 0.1, respectively.
### 1-2. solve the PDE and check that the solution is a 1-soliton like solution.
### 1-3. Then check the field value at the center.
###
gfortran soliton_finder_x.f pde_solver.f
./a.out

###
### 2. Survey soliton solution more in detail in uL vs. E space
###
### Using the information obtained in the previous step 1, 
### find more accuarte soliton solution. 
### The algorithm is
### 2-1. 
###
#gfortran soliton_finder.f pde_solver.f
#./a.out
#gnuplot uR_2d.gnu