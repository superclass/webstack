FROM debian:bookworm
MAINTAINER Andre van Dijk <andre.van.dijk@superclass.nl>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apache2 php php-imagick php-cli php-common php-curl php-fpm php-gd php-json php-mbstring php-mysql php-opcache php-readline php-xml php-zip php-intl  libapache2-mod-xsendfile libapache2-mod-php vim-tiny wget php-sqlite3 php-apcu php-gmp php-bcmath libmagickcore-6.q16-6-extra bzip2
RUN apt-get -y upgrade
RUN apt-get -y autoremove
RUN apt-get clean
COPY httpd-foreground /usr/local/bin/
RUN sed -i 's/ServerTokens OS/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
RUN ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && dpkg-reconfigure tzdata
EXPOSE 80
CMD ["/usr/local/bin/httpd-foreground"]
