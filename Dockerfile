FROM certbot/certbot:latest
COPY start_cert.sh /bin/start_cert.sh
RUN chmod +x /bin/start_cert.sh
ENTRYPOINT [ "/bin/start_cert.sh" ]