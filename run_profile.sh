#!/bin/bash

gfortran soliton_profile.f pde_solver.f
./a.out
gnuplot u.gnu