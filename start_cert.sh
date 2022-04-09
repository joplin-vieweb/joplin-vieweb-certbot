#!/bin/sh

if [ ! -d "/etc/letsencrypt/live/${CERT_DOMAIN}" ]
then
    echo "Let's certificate ${CERT_DOMAIN}"
    certbot certonly --webroot --webroot-path /var/www/certbot/ -d ${CERT_DOMAIN} --non-interactive --agree-tos -m ${CERT_MAIL}
fi

if [ -d "/etc/letsencrypt/live/${CERT_DOMAIN}" ]
then
    echo "Certificated. We run for renewal..."
    trap exit TERM; while :; do certbot renew; sleep 12h; done;
   
else
    echo "Certification failed..."
fi
