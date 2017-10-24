FROM centos:centos6

MAINTAINER alessandro.minoccheri@studiomado.it

ENV MARIADB_VERSION=10.1

ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
ADD create_mysql_user_and_database.sh /user/local/bin/create_mysql_user_and_database.sh
ADD db.sql /user/local/db.sql

RUN yum -y update && yum install -y MariaDB-server MariaDB-client

EXPOSE 3306

ENTRYPOINT /etc/init.d/mysql start && bash
