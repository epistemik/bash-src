#!/bin/ksh

FILE=${1:?}

while [ "$1x" != "x" ];
  do
      FULLPATH=""
        
      for dir in `echo $PATH|sed -e's@:@ @g'`;
         do
             FOUND=0
             if [ -f $dir/$1 ];
               then
                 echo $dir/$1 
                 FOUND=1
                 break
               else
                   FULLPATH=`echo $FULLPATH $dir`
             fi
         done
         
      if [ $FOUND -ne 1 ];
        then
            echo no $1 in $FULLPATH
      fi
      
      shift
      
  done
