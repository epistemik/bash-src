#!/bin/csh -f

## this version takes a file name parameter and does
## a C or C++ compile, depending on the filename extension
## -o sets name for output file

set good = "true"

## take off the filename extension if present
set name = $1 | sed -e 's/\..*//'

if ( -f ${name}.cpp ) then
  set suff = cpp
  set exe = g++
  
  else if ( -f ${name}.cc ) then
      set suff = cc
      set exe = g++

  else if ( -f ${name}.C ) then
      set suff =C
      set exe = g++

  else if ( -f ${name}.c ) then
      set suff = c
      set exe = gcc

  else if ( -f ${name}.nc ) then
      set suff = nc
      set exe = gcc ;

  else
      set good = "false"
      echo "No valid file with basename '${name}' "

endif      


if ( ${good} == "true" ) then
  /opt/solaris7/bin/${exe} -o $1.x ${name}.${suff}
endif
