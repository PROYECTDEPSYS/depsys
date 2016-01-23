
/* Estructura con los datos de la conexión */
typedef struct {
  gchar *host, *user, *password, *DB, *unix_socket;
  unsigned int port;
  unsigned long flags;
} init_settingDB;

/*Declearación*/
gchar *parseHost();

/* Función para obtener los datos y regresarlos */
init_settingDB *read_conf(gchar *filename) {

  init_settingDB values;
  xmlDoc *document; /* Puntero con el contenido del documento */
  xmlNode *root_node, *child_node; /* Puntero con el nodo raíz y el nodo hijo */
  char *encoding="UTF-8"; /* Codigicación del archivo xml */

  /* Se le asigna a la variable documento el retorno de la función que lee el archivo xml */
  document = xmlReadFile(filename, encoding, 0);
  /* A el nodo raiz se le asigna la raiz leida por el contenido del documento */
  root_node = xmlDocGetRootElement(document);
  /* Le asigno la estructura del root al primer nodo */
  child_node = root_node->children;

  while (child_node != NULL) {
		if ((!xmlStrcmp(child_node->name, (const xmlChar *)"connectdb"))){
			values.host = parseHost(document, child_node);
		}

	child_node = child_node->next;
	}

  return values;
}

gchar *parseHost (xmlDoc *document, xmlNode *child_node) {

  char *key;
  child_node = child_node->children;
  while (child_node != NULL) {
      if ((!xmlStrcmp(child_node->name, (const xmlChar *)"host"))) {
         key = xmlNodeGetContent(child_node);
      }
  child_node = child_node->next;
  }
    return key;
}
