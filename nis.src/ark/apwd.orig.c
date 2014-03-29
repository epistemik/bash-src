/* File: apwd.c */

#include <stdio.h>
#include <string.h>

/* split the individual directory names from the complete string */
int split( char *s1, char *ptr[], char *s2 )
{
  char *p ;
  int i = 0 ;
  
  p = strtok( s1, s2 );
  if( p != NULL )
  {
    while( p != NULL )
     {
       ptr[ i ] = p;
       ++i;
       p = strtok( NULL, s2 );
     }
  }
  return i ;
}
/* split() */

main( int argc, char *argv[] )
{
  char *r, *ptr[ 20 ], buf[ 1024 ];
  int i, n ;

  getcwd( buf, 1023 );
  
  /* check if I am in one of 'my' directories */
  r = strstr( buf, "mhsatto" );
  /* if not, print in red as a warning */
  if( r == NULL )
    printf( "\033[31m" );
  
  /* compress the directory listing if it is too long */
  if( strlen( buf ) > 24 )
  {
    n = split( buf, ptr, "/" );
    
    /* print the ellipsis -- but again distinguish between 'my' and 'other' directories */
    if( r == NULL )
      printf( "***" );
    else
      printf( "..." );
    
    for( i = n - 3; i < n; ++i )
      printf( "/%s", ptr[i] );
  }
  else
    {
      printf( buf );
    }
  
}
/* main() */
