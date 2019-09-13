FROM mysql:latest

COPY ./init /docker-entrypoint-initdb.d/

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

EXPOSE 3306