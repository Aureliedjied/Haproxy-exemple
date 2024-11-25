#!/bin/sh

# Utiliser envsubst pour remplacer les valeurs par des variables d'environnement dans index.html
envsubst < /usr/local/apache2/htdocs/index.html > /usr/local/apache2/htdocs/index_temp.html
mv /usr/local/apache2/htdocs/index_temp.html /usr/local/apache2/htdocs/index.html

# Démarrer Apache en arriere plan
exec httpd-foreground

