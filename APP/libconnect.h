/* Ejemplo sacado de la v0.1*/
#include "libutils.h"

void connect()
{
  MYSQL *ddb = mysql_init(NULL);

  if (ddb == NULL)
  {
    printf("%s\n", mysql_error(ddb));
    exit(1);
  }

  char *host = "localhost";
  char *user = "root";
  char *passwd = "HHe52932";
  char *db = "depsys_test";
  unsigned int port;
  const char *unix_socket = NULL;
  unsigned long flags;

  if (mysql_real_connect(ddb, host, user, passwd, db, port, unix_socket, flags))
  {
    printf("%s\n", mysql_error(ddb));
    mysql_close(ddb);
    exit(1);
  }
}

void disconnect()
{
  MYSQL *ddb = mysql_init(NULL);

  mysql_close(ddb);
  exit(0);
}
