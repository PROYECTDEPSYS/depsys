#include <gtk/gtk.h>

static void activate (GtkApplication *apptest,
                      gpointer user_data)
{
  GtkWidget *window_test;

  window_test = gtk_application_window_new (apptest);
  gtk_window_set_title (GTK_WINDOW (window_test), "Ventana de Prueba");
  gtk_window_set_default_size (GTK_WINDOW (window_test), 800, 600);
  gtk_widget_show_all (window_test);
}
