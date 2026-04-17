FROM debian:oldstable

RUN apt update && apt upgrade -y && apt install -y nginx && apt install -y openssl
RUN openssl req -x509 -noenc -out /etc/ssl/certs/certif.crt -keyout /etc/ssl/private/certif.key -subj "/C=FR/O=42LH/CN=tle-pape.42.fr/UID=tle-pape"
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN echo "<?php\nvar_dump(\$_SERVER);" > /var/www/html/dump.php
CMD ["nginx", "-g", "daemon off;"]
