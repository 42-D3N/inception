FROM debian:oldstable

RUN apt update && apt upgrade -y && apt install -y mariadb-server procps
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/mysql/mariadb.conf.d/
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/60-custom.cnf

COPY ./tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh
RUN chmod +x /usr/local/bin/mariadb_setup.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb_setup.sh"]
