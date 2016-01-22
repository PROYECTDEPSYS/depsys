/* Libreria lectora/escritora del archivo de configuración inicial */
#include "libutils.h"

/* Estructura con los datos de la conexión */
typedef struct {
  gchar *host, *user, *password, *DB, *unix_socket;
  unsigned int port;
  unsigned long flags;
} settingDB;

/* Función para obtener los datos y regresarlos */
settingDB connectDB(char *filename) {

  xmlDoc *document; /* Puntero con el contenido del documento */
  xmlNode *root_node, *child_node; /* Puntero con el nodo raíz */
  char *encoding="UTF-8"; /* Codigicación del archivo xml */

  /* Se le asigna a la variable documento el retorno de la función que lee el archivo xml */
  document = xmlReadFile(filename, encoding, 0);
  /* A el nodo raiz se le asigna la raiz leida por el contenido del documento */
  root = xmlDocGetRootElement(document);

}
