FROM debian:11

# Set UTC Timezone because docker is dumb
RUN apt-get update && \
apt-get install -y tzdata && \
ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
dpkg-reconfigure --frontend noninteractive tzdata

# Install MariaD
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client procps


EXPOSE 3306

# entrypoint
COPY ./Tools/Setup.sh /
RUN chmod 777 /Setup.sh

#conf files
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./Tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod -R 755 /var/lib/mysql /var/run/mysqld

ENTRYPOINT ["sh", "/Setup.sh"]
CMD [ "mysqld" ]