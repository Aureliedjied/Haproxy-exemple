#!/bin/sh

# Définir les variables d'environnement 
export BACKEND_IP=$(hostname -I | awk '{print $1}') 
export BACKEND_PORT="80" 
export CURRENT_DATETIME=$(date)

# Utiliser envsubst pour remplacer les valeurs par des variables d'environnement dans index.html
envsubst < /usr/local/apache2/htdocs/index.html > /usr/local/apache2/htdocs/index_temp.html
mv /usr/local/apache2/htdocs/index_temp.html /usr/local/apache2/htdocs/index.html

# Démarrer Apache en arriere plan
exec httpd-foreground

