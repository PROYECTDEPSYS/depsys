#include "lib/depsys.h"

int main(int argc, char **argv)
{
  char *filename="conf.xml", *value, *find_node="host";
  xmlNode *first_child;

  first_child = read_conf( filename );
  value = value_node( first_child, find_node)

  printf("%s\n",value);

  return 0;
}
