#!/bin/sh

# Vérifies si la variable https est à true ( https activé ) et execute le script de renouvellement des certificats, sinon, on utilise le template de configuration http
if [ "$ENABLE_HTTPS" = "true" ]; then
    /usr/local/bin/renew-certs.sh
    
    export DOMAIN_CERT_PATH="/etc/letsencrypt/live/$DOMAIN_NAME/combined.pem"
    cat /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem /etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem > /etc/letsencrypt/live/$DOMAIN_NAME/combined.pem
    envsubst < /usr/local/etc/haproxy/haproxy.cfg.https.template > /usr/local/etc/haproxy/haproxy.cfg
    
    cron -f &
else
    envsubst < /usr/local/etc/haproxy/haproxy.cfg.http.template > /usr/local/etc/haproxy/haproxy.cfg
fi

# Démarre HA Proxy avec ses configurations
exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg