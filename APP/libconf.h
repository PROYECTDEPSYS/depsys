#include "libutils.h" /* Libreria con todas las utilerias */

char read_conf(char *filename) /* Funcion para leer el archivo y retornar el valor de la raíz */
{
  xmlDoc *document; /* Puntero con el contenido del documento */
  xmlNode *root; /* Puntero con el nodo raíz */
  char *encoding="UTF-8"; /* Codigicación del archivo xml */

/* Se le asigna a la variable documento el retorno de la función que lee el archivo xml */
 document = xmlReadFile(filename, encoding, 0);

 /* A el nodo raiz se le asigna la raiz leida por el contenido del documento */
 root = xmlDocGetRootElement(document);

 /* valor que regresa la función el cual es el nodo raíz */
 return root;
}

char value_node(xmlNode *first_child, char *find_node) /* Función que buscara el valor del nodo deseado */
{
  xmlNode *node; /* Puntero que guarda el nodo actual */
  xmlChar *value; /* Puntero que tiene el valor del nodo actual */

  node = first_child; /* Inicializo la variable para el ciclo, le asigno al nodo actual el valor de la raíz */

  /* El ciclo guardara el valor del nodo hasta que el nodo sea igual al valor deseado */
  do
  {
    /* Si el contenido del nodo es sigue el ciclo */
    if ( (node->type==3) && (strlen(trim((char*)xmlNodeGetContent(node)))==0) )
      {
        continue;
      }

    /* Se le asigna el contenido del nodo a la variable */
    value=xmlNodeGetContent(node);

    /* Si el nodo tiene hijos busco el nodo deseado en ellos */
    if (node->children!=NULL)
    {
      value_node(node->children, find_node);
    }

    /* Al nodo actual le asigno el nombre del siguiente nodo */
    node = node->next;
  }
  while(node!=find_node); /* El ciclo seguira hasta que el nodo sea igual al buscado */

  /* Entonces, al encontrar el nodo buscado el valor de la variable sera el ultimo que encontro el cual es de este ultimo */
  return value;
}
