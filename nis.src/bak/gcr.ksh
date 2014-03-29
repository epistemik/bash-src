#!/bin/ksh

## this version takes a file name parameter and does
## a C or C++ compile, depending on the filename extension
## -o sets name for output file

x=$1
echo $x
if [[ ${#x} == 0 ]] then
  echo "Usage: gcr 'file_to_compile' "
  exit ;
fi

good="true" ;

## take off the filename extension if present
name=${x%%.*} ;
echo $name ;
#"$1 | sed -e 's/\..*//' "

if [[ -f ${name}.cpp ]] then
  suff=cpp
  exe=g++ ;
  
  elif [[ -f ${name}.cc ]] then
      suff=cc
      exe=g++ ;

  elif [[ -f ${name}.C ]] then
      suff=C
      exe=g++ ;

  elif [[ -f ${name}.c ]] then
      suff=c
      exe=gcc ;

  elif [[ -f ${name}.nc ]] then
      suff=nc
      exe=gcc ;

  else
      good="false"
      echo "No valid file with basename '${name}' " ;

fi       


if [[ ${good} = "true" ]] then
  /opt/solaris7/bin/${exe} -o ${name}.x ${name}.${suff}
fi
