FROM haproxy:latest

# Switch sur root pour installer les paquets
USER root

# Mise à jour et installations des paquets et dépendances
RUN apt-get update && \
    apt-get install -y certbot gettext-base cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV DOMAIN_NAME=yourdomain.com
ENV EMAIL_ADDRESS=your@email.com
ENV BACKEND1_URL=back1.test.com:80
ENV BACKEND2_URL=back2.test.com:80
ENV ENABLE_HTTPS=true

# Copie des fichiers dans le conteneur
COPY entrypoint.sh /usr/local/bin/
COPY haproxy.cfg.http.template /usr/local/etc/haproxy/haproxy.cfg.http.template
COPY haproxy.cfg.https.template /usr/local/etc/haproxy/haproxy.cfg.https.template
COPY renew-certs.sh /usr/local/bin/
COPY renew-cron /etc/cron.d/


# Set permissions pour rendre le fichier exécutable
RUN chmod 700 /usr/local/bin/entrypoint.sh /usr/local/bin/renew-certs.sh && \
    chmod 0644 /etc/cron.d/renew-cron && \
    crontab /etc/cron.d/renew-cron

# Set entrypoint : l'image qu'exécutera docker.  
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
