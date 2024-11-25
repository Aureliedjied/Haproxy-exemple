#!/bin/sh

# Genere le crtificat avec certbot et recharge HAProxy
certbot certonly --standalone -d $DOMAIN_NAME --non-interactive --agree-tos --email $EMAIL_ADDRESS --expand --renew-by-default --post-hook "haproxy -f /usr/local/etc/haproxy/haproxy.cfg -c && systemctl reload haproxy"