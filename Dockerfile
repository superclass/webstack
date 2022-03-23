FROM debian:buster
MAINTAINER Andre van Dijk <andre.van.dijk@superclass.nl>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apache2 php7.3 php-imagick php7.3-cli php7.3-common php7.3-curl php7.3-fpm php7.3-gd php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-readline php7.3-xml php7.3-zip php7.3-intl  libapache2-mod-xsendfile libapache2-mod-php7.3 vim-tiny wget php7.3-sqlite3 php-apcu php7.3-gmp php7.3-bcmath libmagickcore-6.q16-6-extra
RUN apt-get -y upgrade
RUN apt-get -y autoremove
RUN apt-get clean
COPY httpd-foreground /usr/local/bin/
RUN sed -i 's/ServerTokens OS/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
RUN ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && dpkg-reconfigure tzdata
EXPOSE 80
CMD ["/usr/local/bin/httpd-foreground"]
