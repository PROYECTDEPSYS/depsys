#include "libdepsys.h"

int main(int argc, char **argv)
{
  /*---- prueba solo para verificar el funcionamiento de la nueva libreria ----*/

  /*Asigno el archivo a leer, así como el nodo a buscar. Declaro variable para el valor*/
  char *filename="conf.xml", *value, *find_node="host";

  /* Nodo que contendra la raiz para inicializar la funcion*/
  xmlNode *first_child;

  /*A la variable que contendra la raíz le asigno el valor que me retorna la funcion creada */
  first_child = read_conf( filename );

  /* Al valor a buscar le asigno la variable que retorna la función creada */
  value = value_node( first_child, find_node);

  /* Imprimo el valor encontrado */
  printf("%s\n",value);

  /*---- termina la prueba -----*/

  return 0;
}
