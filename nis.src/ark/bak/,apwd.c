/*!**************************************************
     Mark Sattolo 
     ---------------------
     File: @(#)apwd.c
     Version: 1.3
     Last Update: 03/02/28 12:04:36
   
***************************************************!*/

#include <stdio.h>
#include <string.h>

#define  NUM_DIRS_TO_SHOW   3
#define  DIRSTR_LEN_LIMIT  24	/* chars */
#define  MAX_DIR_NAMES     32

/* split the individual directory names from the complete string */
int split( char *s1, char *ptr[], char *s2 )
{
  char *p ;
  int i = 0 ;
  
  p = strtok( s1, s2 );
  if( p != NULL )
  {
    while( p != NULL  &&  i < MAX_DIR_NAMES ) /* WILL LOSE DIRS BEYOND MAX_DIR_NAMES ! */
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
  char *atHome, *ptr[ MAX_DIR_NAMES ], buff[ 1024 ];
  int i, numdirs, first, total ;

  getcwd( buff, 1023 );
  
  /* check if I am in one of 'my' directories */
  atHome = strstr( buff, "mhsatto" );
  
  /* if not, print in red as a warning */
  if( atHome == NULL )
    printf( "\033[31m" );
  
  /* compress the directory listing if it is too long */
  if( strlen( buff ) > DIRSTR_LEN_LIMIT )
  {
    numdirs = split( buff, ptr, "/" );
    
    /* how many sub-directories are there? */
    if( numdirs > NUM_DIRS_TO_SHOW )
    {
      /* print the last NUM_DIRS_TO_SHOW directories */
      first = numdirs - NUM_DIRS_TO_SHOW ;
      
      /* print the ellipsis 
         -- but again distinguish between 'my' and 'other' directories */
      if( atHome == NULL ) printf( "***" );
      else printf( "..." );
    }
    else /* there may be long directory names -- may have < 3 names in the token list! */
         first = 0 ;
    
    for( i = first; i < numdirs; ++i )
      printf( "/%s", ptr[i] );
  }
  else // strlen( buff ) <= DIRSTR_LEN_LIMIT
    {
      printf( buff );
    }
  
}
/* main() */
