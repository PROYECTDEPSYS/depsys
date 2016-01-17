#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <mysql.h>
#include <gtk/gtk.h>
#include <libxml/parser.h>

/* --- Trim ---*/
char *trim(char *s)
{
  char *start = s;

  /* Nos comemos los espacios al inicio */
  while(*start && isspace(*start))
    ++start;

  char *i = start;
  char *end = start;

  /* Nos comemos los espacios al final */
  while(*i)
  {
    if( !isspace(*(i++)) )
      end = i;
  }

  /* Escribimos el terminados */
  *end = 0;

  return start;
}
