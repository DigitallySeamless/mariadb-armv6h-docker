# vim:set ft=dockerfile:
FROM digitallyseamless/archlinux-armv6h

# Author: Digitally Seamless
MAINTAINER Digitally Seamless <docker@digitallyseamless.com>

ENV MARIADB_MAJOR 10.0
ENV MARIADB_VERSION 10.0.15-1

RUN pacman -Sy --noconfirm mariadb && \
  rm -rf /var/cache/pacman/pkg/* && \
  rm -rf /var/lib/mysql

COPY docker-entrypoint.sh /

VOLUME ["/etc/mysql", "/var/lib/mysql", "/var/run/mysqld"]

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/bin/mysqld_safe"]
