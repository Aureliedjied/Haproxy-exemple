#!/bin/sh

# Chemin vers le certificat auto-signé
DOMAIN_CERT_PATH="/usr/local/etc/haproxy/certs/haproxy-selfsigned.pem"

# Vérifier si le certificat existe
if [ ! -f "$DOMAIN_CERT_PATH" ]; then
    echo "Erreur : Le certificat SSL n'existe pas à $DOMAIN_CERT_PATH"
    exit 1
fi

export DOMAIN_CERT_PATH

# Générer le fichier de configuration HAProxy
envsubst < /usr/local/etc/haproxy/haproxy.cfg.https.template > /usr/local/etc/haproxy/haproxy.cfg

# Démarrer HAProxy avec le fichier de configuration généré
exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg

