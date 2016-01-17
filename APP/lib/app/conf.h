#include "../utils.h"

char read_conf(char filename)
{
  xmlDoc *document;
  xmlNode *root;
  char *encoding="UTF-8";

 document = xmlReadFile(filename, encoding, 0);
 root = xmlDocGetRootElement(document);

 return root;
}

char value_node(xmlNode *first_child, char *find_node)
{
  xmlNode *node;
  xmlChar *value;

  node = first_child;
  do
  {

    if ( (node->type==3) && (strlen(trim((char*)xmlNodeGetContent(node)))==0) )
      {
        continue;
      }
    value=xmlNodeGetContent(node);
    if (node->children!=NULL)
    {
      value_node(node->children, *find_node);
    }

    node = node->next;
  }
  while(node!=find_node);

  return value;
}
