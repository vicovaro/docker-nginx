FROM linuxserver/baseimage.nginx
MAINTAINER Stian Larsen <lonix@linuxserver.io>
ENV APTLIST="php5-mysql php5-mcrypt php5-curl php5-gd php5-cgi php5-pgsql php5-sqlite memcached nginx openssl php5-fpm php5 php5-cli"

#Applying stuff from apt
RUN apt-get update -q && \
apt-get install -qy $APTLIST && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config
EXPOSE 80 443
