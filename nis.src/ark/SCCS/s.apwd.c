h08041
s 00014/00009/00071
d D 1.2 04/12/14 17:05:06 mhsatto 3 1
c increase acceptable directory string length to 25; set constant for MAX_BUFF_SIZE; add comments
e
s 00008/00003/00077
d R 1.2 04/12/14 17:03:06 mhsatto 2 1
c increase acceptable directory string length to 25; set constant for MAX_BUFF_SIZE; add comments
e
s 00080/00000/00000
d D 1.1 03/05/30 10:50:40 mhsatto 1 0
c date and time created 03/05/30 10:50:40 by mhsatto
e
u
U
f e 0
t
T
I 1
D 3
/*!**************************************************
     Mark Sattolo 
     ---------------------
     File: @(#)apwd.c
     Version: 1.3
     Last Update: 03/02/28 12:04:36
E 3
I 3
/*!***************************************************
    Mark Sattolo (mhsatto@po.cse)
   -----------------------------------------------
     File: %Z%%M%
     Version: %I%
     Last Update: %E% %U%
E 3
   
***************************************************!*/

I 3
/* small program to be used at the command line to compress long directory strings
   -- original by Tom Monk	
   compile with 'gcc -o apwd apwd.c'	*/

E 3
#include <stdio.h>
#include <string.h>

#define  NUM_DIRS_TO_SHOW   3
D 3
#define  DIRSTR_LEN_LIMIT  24	/* chars */
E 3
I 3
#define  DIRSTR_LEN_LIMIT  25	/* chars */
E 3
#define  MAX_DIR_NAMES     32
I 3
#define  MAX_BUFF_SIZE	 1023	/* bytes */
E 3

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
D 3
  char *atHome, *ptr[ MAX_DIR_NAMES ], buff[ 1024 ];
E 3
I 3
  char *atHome, *ptr[ MAX_DIR_NAMES ], buff[ MAX_BUFF_SIZE ];
E 3
  int i, numdirs, first, total ;

D 3
  getcwd( buff, 1023 );
E 3
I 3
  getcwd( buff, MAX_BUFF_SIZE );
E 3
  
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
E 1
