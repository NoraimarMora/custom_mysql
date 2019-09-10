FROM mysql:latest

COPY ./init /docker-entrypoint-initdb.d/

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

RUN echo 'CREATE DATABASE IF NOT EXISTS ms_marcas;' > /docker-entrypoint-initdb.d/ms_marcas.sql;/usr/local/bin/docker-entrypoint.sh --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

RUN echo 'CREATE DATABASE IF NOT EXISTS ms_catalogo;' > /docker-entrypoint-initdb.d/ms_catalogo.sql;/usr/local/bin/docker-entrypoint.sh --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

EXPOSE 3306