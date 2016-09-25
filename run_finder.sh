#!/bin/bash

gfortran soliton_finder.f pde_solver.f
./a.out
gnuplot uR_2d.gnu