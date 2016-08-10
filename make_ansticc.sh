#!/bin/bash
#
# Copyright to it's authors. See the COPYRIGHT file at the top-level directory
# of this distribution.
#
# This file is part of ansticc. It is subject to the license terms in the
# LICENSE file found in the top-level directory of this distribution. No part
# of ansticc, including this file, may be copied, modified, propagated, or
# distributed except according to the terms contained in the LICENSE file.

gfortran -Wall -fcheck=all -std=f2008 bexception.f90 prec_def.f90 class_ArrayList.f90 ansticc.for -o ansticc
