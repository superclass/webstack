FROM debian:bullseye
MAINTAINER Andre van Dijk <andre.van.dijk@superclass.nl>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apache2 php7.4 php-imagick php7.4-cli php7.4-common php7.4-curl php7.4-fpm php7.4-gd php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-zip php7.4-intl  libapache2-mod-xsendfile libapache2-mod-php7.4 vim-tiny wget php7.4-sqlite3 php-apcu php7.4-gmp php7.4-bcmath libmagickcore-6.q16-6-extra
RUN apt-get -y upgrade
RUN apt-get -y autoremove
RUN apt-get clean
COPY httpd-foreground /usr/local/bin/
RUN sed -i 's/ServerTokens OS/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
RUN ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && dpkg-reconfigure tzdata
EXPOSE 80
CMD ["/usr/local/bin/httpd-foreground"]
