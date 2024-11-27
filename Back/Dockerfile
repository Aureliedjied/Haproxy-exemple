# Image officielle HAProxy
FROM haproxy:latest

# Définit l'utilisateur root
USER root

# Mise à jour et installations des paquets et dépendances
RUN apt-get update && \
    apt-get install -y gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Définit les variables d'environnement
ENV DOMAIN_NAME=example.com
ENV EMAIL_ADDRESS=your@email.com
ENV BACKEND1_URL=back1.test.com:80
ENV BACKEND2_URL=back2.test.com:80
ENV ENABLE_HTTPS=true

# Copie des fichiers dans le conteneur
COPY entrypoint.sh /usr/local/bin/
COPY haproxy.cfg.http.template /usr/local/etc/haproxy/haproxy.cfg.http.template
COPY haproxy.cfg.https.template /usr/local/etc/haproxy/haproxy.cfg.https.template

# Set permissions pour rendre le fichier exécutable
RUN chmod +x /usr/local/bin/entrypoint.sh 

# Set entrypoint : l'image qu'exécutera docker.
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
