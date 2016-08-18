#!/bin/bash

gfortran -Wall -Wno-maybe-uninitialized -Wno-unused-variable -fcheck=all -std=f2008 bexception.f90 prec_def.f90 class_ArrayList.f90 ansticc_global.f90 ansticc.for -o ansticc
