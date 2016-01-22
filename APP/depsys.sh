#!/usr/bin/zsh

gcc -o depsys `xml2-config --cflags --libs` `pkg-config gtk+-3.0 --cflags --libs` `mysql_config --cflags --libs` depsys.c

./depsys
