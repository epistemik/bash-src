
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
  gid_t k5a = 5021 ;
  
  int retval = setgid( k5a );

  return retval ;
}
