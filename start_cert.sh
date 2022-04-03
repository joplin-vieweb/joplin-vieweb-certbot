#!/bin/sh

if [ ! -d "/etc/letsencrypt/live/${server_name}" ]
then
    echo "Let's certificate ${DOMAIN}"
    certbot certonly --webroot --webroot-path /var/www/certbot/ -d ${DOMAIN} --non-interactive --agree-tos -m ${CERT_MAIL}
fi

if [ -d "/etc/letsencrypt/live/${server_name}" ]
then
    echo "Certificated. We run for renewal..."
    trap exit TERM; while :; do certbot renew; sleep 12h; done;
   
else
    echo "Certification failed..."
fi
