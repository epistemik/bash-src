/* File: spwd.rev.c */

#include <stdio.h>
#include <string.h>

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
// split()

main( int argc, char *argv[] )
{
  char *ptr[ 20 ], buf[ 1024 ];
  int i, n, first ;

  getcwd( buf, 1023 );
  
  if( strlen( buf ) > 20 )
  {
    n = split( buf, ptr, "/" );

    /* how many sub-directories are there? */
    if( n > 3 )
    {
      first = n - 3 ;
      
      /* print the ellipsis */
      printf( "..." );
    }
    else /* there may be long directory names -- may have < 3 names in the token list! */
	first = 0 ;

    for( i = first; i < n; ++i )
       printf( "/%s", ptr[i] );
  }
  else
  {
    printf( buf );
  }
  
}
// main()
