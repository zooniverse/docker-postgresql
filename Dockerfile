FROM postgres:9.4

COPY extra_postgresql.conf /postgresql.conf

RUN mkdir /etc/postgres/

COPY scripts/modify_config.sh /docker-entrypoint-initdb.d/modify_config.sh
