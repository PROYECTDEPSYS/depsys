#include "GUI/gui.h"
#include "DB/db.h"

int main (int argc,char **argv)
{
  int status;
  GtkApplication *apptest;

  apptest = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE);
  g_signal_connect (apptest, "activate", G_CALLBACK (activate), NULL);
  status = g_application_run (G_APPLICATION (apptest), argc, argv);
  g_object_unref (apptest);

  return status;
}
