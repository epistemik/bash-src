h36027
s 00029/00000/00000
d D 1.1 03/03/11 09:31:46 mhsatto 1 0
c date and time created 03/03/11 09:31:46 by mhsatto
e
u
U
f e 0
t
T
I 1
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
E 1
