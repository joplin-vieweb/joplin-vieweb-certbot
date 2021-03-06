FROM --platform=linux/amd64 certbot/certbot:latest
FROM --platform=linux/arm64 certbot/certbot:arm64v8-latest
COPY start_cert.sh /bin/start_cert.sh
RUN chmod +x /bin/start_cert.sh
ENTRYPOINT [ "/bin/start_cert.sh" ]