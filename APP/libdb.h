/* Ejemplo sacado de la v0.1*/
#include "libutils.h"

void query()
{
  MYSQL *ddb = mysql_init(NULL);

  if (mysql_query(MYSQL * mysql, const char * query))
  {
    printf("%s\n", mysql_error(ddb));
    mysql_close(ddb);
    exit(1);
  }
}
