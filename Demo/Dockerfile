# Install Apache
FROM httpd:latest

# Mise à jour et installations des paquets et dépendances
RUN apt-get update && \
    apt-get install -y gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copie des fichiers dans le conteneur
COPY index.html /usr/local/apache2/htdocs/index.html
COPY entrypoint.sh /usr/local/bin/
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Set permissions pour rendre le fichier exécutable
RUN chmod 700 /usr/local/bin/entrypoint.sh

# Définit la variable d'environnement
ENV BACKEND_NAME="backend"

# Set entrypoint : l'image qu'exécutera docker.
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Expose ports
EXPOSE 80
EXPOSE 443


