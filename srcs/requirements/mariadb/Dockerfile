FROM alpine:3.18

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_HOST


RUN apk update && apk add --no-cache mariadb mariadb-client 

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mkdir /var/run/mysqld; \
   chown -R mysql:mysql /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

COPY ./conf/create_db.sh .

RUN chmod +x /create_db.sh

RUN sh create_db.sh && \
   rm create_db.sh

USER mysql

CMD ["/usr/bin/mysqld", "--skip-log-error"]