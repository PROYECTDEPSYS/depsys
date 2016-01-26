#include <stdio.h>
#include <stdlib.h>
#include "db.h"

typedef char strings[50];

int menu()
{
  int options = 4;
  int i, c;
  strings o[options]={"Consulta", "Alta", "Baja", "Salir"};

  printf("Menu\n");

  i = 0;
  while(i < options)
    {
      printf("%d)%s\n", i+1, o[i]);
      i++;
    }

  scanf("%d", &c);
  return c;
}

int submenu(int option)
{
  int options;
  int i, c;

}
